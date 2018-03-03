#lang racket
(provide palindrome-string)

(define (string-reverse s)
  (list->string (reverse (string->list s))))

(define (palindrome-string str)
  (string=? str (string-reverse str)))

