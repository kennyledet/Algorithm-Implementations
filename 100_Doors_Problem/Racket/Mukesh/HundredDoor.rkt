#lang racket
(provide bits bits-bit-value solve)

(define-struct bits (bit-value size) #:transparent)

(define (bit-vector size v)
  (let*-values ([(q r) (quotient/remainder size 8)])
    (bits (make-bytes (if (zero? r) q (+ q 1))
                      (if (zero? v)
                          0 255)) size)))

(define (set-bit bits pos)
  (let ([bit-val (bits-bit-value bits)]
        [size (bits-size bits)])
    (if (>= pos size)
        bits
        (let*-values ([(q r) (quotient/remainder pos 8)]
                      [(mod-val) (bitwise-ior (bytes-ref bit-val q) (expt 2 (- 7 r)))])
          (bytes-set! bit-val q mod-val)
          (make-bits bit-val size)))))

(define (toggle-bit bits pos)
  (let ([bit-val (bits-bit-value bits)]
        [size (bits-size bits)])
    (if (>= pos size)
        bits
        (let*-values ([(q r) (quotient/remainder pos 8)]
                      [(mod-val) (bitwise-xor (bytes-ref bit-val q) (expt 2 (- 7 r)))])
          (bytes-set! bit-val q mod-val)
          (make-bits bit-val size)))))


(define (iterate-bits bits n step)
  (let ([bit-val (bits-bit-value bits)]
        [size (bits-size bits)])
    (if (>= n size)
        bits
        (iterate-bits (toggle-bit bits n) (+ n step) step))))


(define (pass bits n)
  (iterate-bits bits (- n 1) n))

(define (solve n)
  (foldl (λ(x acc) (pass acc x)) (bit-vector n 0) (range 1 (+ n 1))))

(define (print-byte byte n p)
  (if (not (zero? (bitwise-and byte (expt 2 (- 7 p)))))
      (string-append (number->string (+ n p 1)) " is open")
      (string-append (number->string (+ n p 1)) " is closed")))
  
      
(define (print-bits bits)
  (let*-values ([(bit-val) (bits-bit-value bits)]
                [(size) (bits-size bits)])
    (map (λ(p) (let*-values ([(q r) (quotient/remainder p 8)])
                 (print-byte (bytes-ref bit-val q) (* 8 q) r))) (range 0 size))))
          
        

                