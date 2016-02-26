#lang racket
;implement multiply with add,half,double
;iterative
;handle negative number
(define (double x) (+ x x))
(define (half x) (/ x 2))
(define (xor a b)
  (if (or (and a b) (not (or a b))) 
      #f
      #t))

(define (* x y)
  (define (foo rst a b)
    (cond ((= b 0) 
           rst)
          ((even? b) (foo rst (double a) (half b)))
          (else (foo (+ rst a) a (- b 1)))))
  (if (xor (< x 0) (< y 0))    
      (- (* (- 0 x) y))
      (foo 0 x y)))

(display (* 0 8))
 
        