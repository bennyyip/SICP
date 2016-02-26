#lang racket
(define (make-mobile left right)
; 	(list left right))
	(cons left right))	

 (define (make-branch length structure)
 	; (list length structure))
	(cons length structure))

(define (branch-length branch)
 	(car branch))

 (define (branch-structure branch)
; 	(cadr branch))
	(cdr branch))

(define (left-branch mobile)
	(car mobile))

(define (right-branch mobile)
; 	(cadr mobile))
	(cdr mobile))

(define (total-weight mobile)
	(+ (branch-weight (left-branch mobile))
		(branch-weight (right-branch mobile))))

(define (branch-weight branch)
	(if (hang-mobile? branch)
		(total-weight (branch-structure branch))
		(branch-structure branch)))

(define (hang-mobile? branch)
	(pair? (branch-structure branch)))

; (define mobile (make-mobile (make-branch 10 20)
; 	(make-branch 10 25)))
; (define another-mobile (make-mobile (make-branch 10 mobile) 
; 	(make-branch 10 20)))

(define (mobile-balanced? branch)
	(and (torque-equal? branch)
		(branch-balanced? (left-branch branch)) 
		(branch-balanced? (right-branch branch))))

(define (branch-balanced?  branch)
	(if (hang-mobile? branch)
		(mobile-balanced? (branch-structure branch))
		#t))

(define (torque-equal? mobile)
	(= (torque (left-branch mobile)) (torque (right-branch mobile))))

(define (torque branch)
	(* (branch-length branch) (branch-weight branch)))

(define balance-mobile (make-mobile (make-branch 10 10)
	(make-branch 10 10)))

(define unbalance-mobile (make-mobile (make-branch 0 0)
	(make-branch 10 10)))

(define mobile-with-sub-mobile (make-mobile (make-branch 10 balance-mobile)
	(make-branch 10 balance-mobile)))