#lang racket
(provide harshad-number)

(define (digit-sum n)
  (let*-values ([(q r) (quotient/remainder n 10)])
    (if (zero? q)
        r
        (+ r (digit-sum q)))))

(define (harshad-number n)
  (zero? (remainder n (digit-sum n))))

