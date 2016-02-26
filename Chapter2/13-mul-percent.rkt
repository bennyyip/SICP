#lang racket
(require "7-interval.rkt")
(define (mul-interval-percent p1 p2)
  (/ (* (+ 1 (* p1 0.01)) (+ 1 (* p2 0.01)))
     (* (- 1 (* p1 0.01)) (- 1 (* p2 0.01)))))