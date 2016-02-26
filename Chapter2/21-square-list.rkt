#lang racket
(require "square.rkt")
(define (square-list items)
	(if (null? items)
		'()
		(cons (square (car items)) (square-list (cdr items)))))

(define (list-square items)
	(map square items))
