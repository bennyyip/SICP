#lang racket
(define (for-each f lst)
	(cond ((not (null? lst)) 
		(f (car lst))
		(for-each f (cdr lst)))))

(for-each (lambda (x) (newline) (display x))
	(list 1 2 3 4 5))