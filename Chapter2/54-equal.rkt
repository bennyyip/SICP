#lang racket

(define (equal? x y)
  (or (and (pair? x)
           (pair? y)
           (equal? (car x) (car y))
           (equal? (cdr x) (cdr y)))
      (and 
       (not (pair? x))
       (not (pair? y))
       (eq? x y))))