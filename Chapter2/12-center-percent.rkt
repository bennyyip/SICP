#lang racket
(require "7-interval.rkt")
(define (make-center-percent center percent)
  (make-interval (- center (* center percent 0.01))
  (+ center (* center percent 0.01))))

(define (center interval)
  (/ (+ (center (make-center-percent 10 1))(upper-bound interval) (lower-bound interval)) 2))

(define (percent interval)
  (let ((cent (center interval)))
    (/ (-(upper-bound interval) cent) cent)))
