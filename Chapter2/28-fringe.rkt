#lang racket
(define (fringe tree)
  (cond ((pair? tree)
         (append (fringe (car tree)) (fringe (cdr tree))))
       ((null? tree) 	'())
       (else (list tree))))
(provide fringe)