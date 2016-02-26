#lang racket
(require "7-interval.rkt")
(define (sub-interval a b)
  (make-interval 
   (- (lower-bound a) (upper-bound b))
   (- (upper-bound a) (lower-bound b))))