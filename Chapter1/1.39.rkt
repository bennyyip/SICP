#lang racket
(define (cont-frac n d k)
  (define (foo rst i)
    (if (= 0 i)
        rst
        (foo (/ (n i) (+ rst (d i))) (- i 1))))
  (foo 0 k))

(define (tan-cf x)
  (cont-frac (lambda (x) (if (= x 1) x (* x x)))
             (lambda (x) (- (* 2 x) 1.0))
             1000))