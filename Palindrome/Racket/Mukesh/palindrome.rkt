#lang racket
(require rackunit)

(define (string-reverse s)
  (list->string (reverse (string->list s))))

(define (palindrome-string str)
  (string=? str (string-reverse str)))

;unit test
(check-eq? #t (palindrome-string "palinilap"))
(check-eq? #f (palindrome-string "helloworld"))
(check-eq? #t (palindrome-string "alula"))
(check-eq? #t (palindrome-string "palindromemordnilap"))