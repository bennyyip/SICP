#lang racket
(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (fixed-point f x)
  (display x)
  (newline)
  (let ((tolerance 0.00000000001)
        (abs (lambda (x) (if (> x 0) x (- 0 x))))
        (next-x (f x)))
    (if (< (abs (- x next-x)) tolerance)
         x
         (fixed-point f next-x))))

;root of equation x^x=1000
(define (root)
  (fixed-point (average-damp (lambda (x) (/ (log 1000) (log x)))) 1.3))

(define (root-slow)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 1.3))