#lang racket
(require "7-interval.rkt")
(define (div-interval a b)
  (if (and
       (not (< 0 (lower-bound b)))
       (not (> 0 (upper-bound b))))
      (error "divide 0")
      (let ((p1 (/ (upper-bound a) (upper-bound b)))
            (p2 (/ (upper-bound a) (lower-bound b)))
            (p3 (/ (lower-bound a) (upper-bound b)))
            (p4 (/ (lower-bound a) (lower-bound b))))
        (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4)))))