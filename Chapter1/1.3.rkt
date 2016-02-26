#lang racket
(define (f x y z)
	(cond
		((not (or (> x y) (> x z))) (+ (* y y) (* z z)))
		(else (f y z x))))