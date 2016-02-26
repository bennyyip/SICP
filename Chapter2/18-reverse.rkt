#lang racket 
;recurrisive
; (define (reverse l)
;   (if (null? l)
;       '()
;       (append (reverse (cdr l)) (list(car l)))))


(define (reverse l)
	(define (iter remain rst)
		(if (null? remain)
			rst
			(iter (cdr remain) (cons (car remain) rst))))
	(iter l '()))

(provide reverse)