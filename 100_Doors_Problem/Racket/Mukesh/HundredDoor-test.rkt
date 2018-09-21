#lang racket
(require "HundredDoor.rkt"
         rackunit)

(check-eq? #t (not (zero? (bitwise-and (bytes-ref (bits-bit-value (solve 100)) 0)
                                       (expt 2 (- 7 0)))))) ;; door 0 => 1

(check-eq? #t (not (zero? (bitwise-and (bytes-ref (bits-bit-value (solve 100)) 0)
                                       (expt 2 (- 7 3)))))) ;; door 3 => door 4

(check-eq? #t (not (zero? (bitwise-and (bytes-ref (bits-bit-value (solve 100)) 1)
                                       (expt 2 (- 7 0)))))) ;; door 9