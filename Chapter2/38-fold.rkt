#lang racket
(define (fold-left op ini seq)
	(define (iter result rest)
		(if (null? rest)	
			result
			(iter (op result (car rest))
				(cdr rest))))
	(iter ini seq))
(require "accumulate.rkt")
(define fold-right accumulate)
(provide fold-right)
(provide fold-left)