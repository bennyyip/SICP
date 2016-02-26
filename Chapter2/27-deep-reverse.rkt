#lang racket
(require "18-reverse.rkt")

(define (deep-reverse tree)
  (cond ((pair? tree)
         (cons (deep-reverse (cdr tree))
              (deep-reverse (car tree))))
       ((null? tree) '())
       (else tree)))
