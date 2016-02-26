#lang racket
;recurssive version
(define (cont-frac-rec n d k)
  (define (foo i)
    (if (= k i) 
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (foo (+ 1 i))))))
  (foo 1))

;iterative
(define (cont-frac-iter n d k)
  (define (foo rst i)
    (if (= 0 i)
        rst
        (foo (/ (n i) (+ rst (d i))) (- i 1))))
  (foo 0 k))