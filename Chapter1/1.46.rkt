#lang racket
(define tolerance 0.0000001)
(define (iterative-improve good-enough? improve)
  (define (foo guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          guess
          (foo next))))
  foo)

(define (sqrt x)
  ((iterative-improve 
    (lambda (v1 v2) 
      (< (abs (- v1 v2)) tolerance))
    (lambda (y)
      (/ (+ (/ x y) y) 2.0)))
   1.0))		

(define (fixed-point f guess)
  ((iterative-improve
   (lambda (v1 v2)
     (< (abs (- v1 v2)) tolerance))
   f)
  guess))


(provide sqrt)