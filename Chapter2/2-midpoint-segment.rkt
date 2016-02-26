#lang racket
(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint-segment segment)
  (define (avr a b)
    (/ (+ a b) 2.0))
  (make-point 
   (avr (x-point (start-segment segment))
        (x-point (end-segment segment)))
   (avr (y-point (start-segment segment))
        (y-point (end-segment segment)))))

(define (print-point p)
  (newline)
  (display "(")
  (display(x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(provide make-point)
(provide make-segment)