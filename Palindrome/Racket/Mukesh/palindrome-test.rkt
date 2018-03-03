#lang racket
(require "palindrome.rkt"
         rackunit)

;unit test
(check-eq? #t (palindrome-string "palinilap"))
(check-eq? #f (palindrome-string "helloworld"))
(check-eq? #t (palindrome-string "alula"))
(check-eq? #t (palindrome-string "palindromemordnilap"))