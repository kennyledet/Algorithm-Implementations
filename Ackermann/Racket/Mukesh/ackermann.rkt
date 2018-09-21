#lang racket
(provide ackermann)

(define (ackermann m n)
  (match/values (values m n)
    [(0 n) (+ n 1)]
    [(m 0) (ackermann (- m 1) 1)]
    [(m n) (+ (ackermann (- m 1) (ackermann m (- n 1))))]))
    