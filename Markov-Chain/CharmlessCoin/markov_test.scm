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
