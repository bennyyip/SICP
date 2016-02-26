#lang racket
(define (cont-frac n d k)
  (define (foo rst i)
    (if (= 0 i)
        rst
        (foo (/ (n i) (+ rst (d i))) (- i 1))))
  (foo 0 k))

(define (e)
  (+ (cont-frac (lambda (x) 1.0)
                (lambda (x) 
                  (if (= (remainder (+ 1 x) 3) 0)
                      (* (/ (+ 1 x) 3) 2.0)
                      1.0))
                1000)
     2))
