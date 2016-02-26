#lang racket

; (define _z false)

; (define (f x)
;     (cond ((= x 0) (begin (set! _z #t) 0))
;         (else (if _z 0 1))))

(define (g y)
  (define (f x)
    (let ((z y))
      (set! y x)
      z))
  f)
(define f (g 0))