#lang racket
;iterative&succisive square
(define (square x) (* x x))
(define (expt x n)
  (define (expt-iter a b m)
    (cond ((= m 0)
           a)
          ((even? m) 
           (expt-iter a (square b) (/ m 2)))
          (else
           (expt-iter (* b a) b (- m 1)))))
  (expt-iter 1 x n))
(display (expt 2 2333))
 
        
        
  