#lang racket
(define (sum f next a b)
  (define (iter rst i)
    (if (> i b)
        rst
        (iter (+ rst (f i)) (next i))))
  (iter 0 a))
