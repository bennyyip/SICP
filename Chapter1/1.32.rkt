#lang racket
(define (accumulate combiner null-value term a next b)
  (define (iter rst i)
    (if (> i b)
        rst
        (iter (combiner rst (term i)) (next i))))
  (iter null-value a))


(define (accumulate-r combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-r combiner null-value term (+ 1 a) next b))))