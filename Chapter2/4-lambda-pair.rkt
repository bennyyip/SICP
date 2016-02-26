#lang racket
(define (make-rat n d)
  (if (> 0 d)
      (cons (- n) (- d))
      (cons n d)))

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define (print-rat z)
  (display (car z))
  (display "/" )
  (display (cdr z)))

(provide make-rat)
