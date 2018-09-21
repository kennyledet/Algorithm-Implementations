#lang racket
(require "ackermann.rkt"
         rackunit)

(check-eq? (ackermann 1 2) 4)
(check-eq? (ackermann 3 2) 29)