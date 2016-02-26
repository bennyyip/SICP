#lang racket
(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))
(provide make-interval)
(provide upper-bound)
(provide lower-bound)
