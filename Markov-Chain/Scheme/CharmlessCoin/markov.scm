; markov.scm - Naive balanced Markov Chain implementation for Guile Scheme.
; Markov Chain: https://en.wikipedia.org/wiki/Markov_Chain
; tl;dr:
;   A Markov Chain is a system that undergoes random (possibly weighted)
;   changes in state, with the property that the next state only depends
;   on the current state, and none before it.
;
;   In this implementation, we use a directed graph (a set of nodes, some of
;   which are connected by links which have a direction. e.g. node A could go
;   to node B, but node B doesn't have to go to node A) to represent the chain.

; Graphs are of the form:
; '((node-0-links)
;   (node-1-links)
;   ...
;   (node-n-links))
;
; So a node is identified by its index in the graph.
;
; Links are of the form,
;
; (node-index chance)
;
; where chance is a percentage (0 <= n <= 1).

; Note that it is almost _always_
; easier to just hand-write the graph.
(define (make-node links graph)
  (let ((len (length graph)))
    (append graph
            links)))

; ABSTRACTION
(define (get-node-count graph)
  (length graph))

(define (make-link node chance)
  (list node chance))

(define (get-node-links node graph)
  (list-ref graph node))

; Pick a node out of a list of links.
; The list of links should be sorted from
; least chance to greatest chance.
; XXX: Probably not correct, because
; I'm not sure how to do this properly.
(define (pick-node links)
  (define (pick-itr prev links len val count)
    (let ((node (caar links))
          (chance (cadar links)))
      (cond ((= count (- len 1))
            node)

            ((and (= count 0)
                  (< val chance))
             node)

            (else
              (if (and (< prev val)
                       (< val chance))
                node
                (pick-itr chance
                          (cdr links)
                          len val
                          (+ count 1)))))))
  (let ((val (random 1.0))
        (len (length links)))
    (pick-itr 0 links len val 0)))

; Chain nodes from `graph` together until (end? node chain),
; using pick-link to select each node for chaining.
(define (chain-until node graph pick-link end?)
  (define (chain-itr node chain graph)
    (if (end? node chain)
      (cons node chain)
      (chain-itr (pick-link node graph)
                 (cons node chain)
                 graph)))
  (chain-itr node '() graph))

; Build a chain of nodes from the weighted Markov Chain `graph`.
; This implementation assumes that every node has at
; least one link, that all nodes linked to in the graph
; exist, and uses the graph format described above.
(define (markov-chain node graph end?)
  (let ((pick-link (lambda (node graph)
                     (pick-node (sort (get-node-links node graph)
                                      (lambda (pair-a pair-b)
                                        (let ((chance-a (cadr pair-a))
                                              (chance-b (cadr pair-b)))
                                          (< chance-a chance-b))))))))

    ; The chain comes out with the last element in front, so reverse it.
    (reverse (chain-until node graph pick-link end?))))

(define (get-markov-string links)
  (list-ref links (- (length links) 1)))

; This hacks a string payload onto the end of a node.
(define (markov-chain-with-str node graph end?)
  (map (lambda (index)
         (get-markov-string (list-ref graph index)))
       (markov-chain node
                     ; Strip off the string from each node
                     ; before markov-chain ever sees it.
                     (map (lambda (links)
                            (cdr (reverse links)))
                          graph)
                     end?)))
