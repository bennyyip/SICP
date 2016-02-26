#lang racket
(define (fixed-point f x)
  (let ((tolerance 0.0001)
        (abs (lambda (x) (if (> x 0) x (- 0 x))))
        (next-x (/ (+ (f x) x) 2)))
    (if (< (abs (- x next-x)) tolerance)
        x
        (fixed-point f next-x))))

(define (golden-ratio)
  (fixed-point (lambda (x) (+ (/ 1 x) 1)) 1.0))