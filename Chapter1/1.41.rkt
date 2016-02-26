#lang racket
(define (double f)
  (lambda (x) (f (f x))))

(display(((double(double double)) (lambda (x) (+ 1 x))) 5))
;2^2^2