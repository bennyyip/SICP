#lang racket
;implement multiply with add,half,double
;recurssive
(define (double x) (+ x x))
(define (half x) (/ x 2))

(define (* a b)
  (cond ((= b 0)
         0)
        ((even? b)
         (double (* a (half b))))
        ((odd? a)
         (+ a (* a (- b 1))))))

(display (* 3 3))