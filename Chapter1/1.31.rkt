#lang racket
(define (product f next a b)
  (define (iter rst i)
    (if (> i b)
        rst
        (iter (* rst (f i)) (next i))))
  (iter 1 a))

(define (factorial n)
  (product (lambda (x) x) (lambda (x) (+ 1 x)) 1 n))

(define (productr f next a b)
  (if (> a b)
      1
      (* (f a) (product f next (+ 1 a) b))))

(define (square x) (* x x))
(define (pi)
  (let ((n 1000000))
    (* 4 (product (lambda (x) (/ (*(- x 1)(+ 1 x)) (square x))) (lambda (x) (+ x 2)) 3.0 n))))
