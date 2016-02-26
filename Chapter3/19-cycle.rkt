#lang planet neil/sicp

(define (cycle? x)
  (define (safe-cdr l)
    (if (pair? l) (cdr l) '()))
  (define (safe-cddr l)(safe-cdr (safe-cdr l)))
  (define (iter slow fast)
    (cond ((or (null? slow) (null? fast)) #f)
          ((eq? slow fast) #t)
          (else (iter (safe-cdr slow) (safe-cddr fast)))))
  (iter (safe-cdr x) (safe-cddr x)))

(define third (cons 'a 'b))
(define second (cons third third))
(define first (cons second second))
(cycle? first)

(define simple-cycle (cons 'a 'b))
(set-cdr! simple-cycle simple-cycle)
(cycle? simple-cycle)

(define cycle (list 'a 'b 'c))
(set-cdr! (cddr cycle) simple-cycle)
(cycle? cycle)

