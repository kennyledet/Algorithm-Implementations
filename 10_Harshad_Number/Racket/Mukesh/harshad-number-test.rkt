#lang racket
(require "harshad-number.rkt"
         rackunit)

(check-eq? #t (harshad-number 1))
(check-eq? #t (harshad-number 133))
(check-eq? #f (harshad-number 109))