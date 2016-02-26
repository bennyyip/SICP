#lang racket
(define (p) (p))
(define (f x y) 
  (cond ((= x 0) x)
        (else (p))))
(display (p))