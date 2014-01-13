; markov_test.scm - usage examples of markov.scm.
; Uses Guile Scheme.
(load "./markov.scm")

; Test graph:
; 0 -> 0
; 0 -> 1
; 0 -> 2
; 1 -> 0
; 1 -> 3
; 2 -> 2
; 2 -> 1
; 3 -> 3
; 3 -> 2
(define test-graph
  '(((0 .1) (1 .4) (2 .5))  ; 0
    ((0 .6) (3 .4))         ; 1
    ((3 .4) (1 .6))         ; 2
    ((3 .6) (2 .4))))       ; 3

(define (test-end len)
  (lambda (node chain)
    (if (= (length chain)
           len)
      #t
      #f)))

(define (test-run start length)
  (markov-chain start
                test-graph
                (test-end length)))

; Prisoner-graph:
; 0: There
; 1: Are
; 2: Three
; 3: Four
; 4: Lights

; 0 -> 1
; 1 -> 2
; 1 -> 3
; 2 -> 4
; 3 -> 4

(define prisoner-graph
  (list
    (list '(1 1) "There")
    (list '(2 .5) '(3 .5) "are")
    (list '(4 1) "three")
    (list '(4 1) "four")
    (list '() "lights")))

; Check the odds that "three" or "four" will
; come up from using the prisoner-graph.
(define (odds-prisoner times)
  (define (odds-itr three four count)
    (if (= count 0)
      (cons (/ three times) ; Call exact->inexact if you'd like decimal.
            (/ four times))
      (if (member "three"
                  (markov-chain-with-str
                    0
                    prisoner-graph
                    prisoner-end?))
        (odds-itr (+ three 1)
                  four
                  (- count 1))
        (odds-itr three
                  (+ four 1)
                  (- count 1)))))
  (if (<= times 0)
    #f
    (odds-itr 0 0 times)))

(define (prisoner-end? node graph)
  (= node 4))

(define (test-prisoner)
  (string-join (markov-chain-with-str 0
                                      prisoner-graph
                                      prisoner-end?)
               " "))
