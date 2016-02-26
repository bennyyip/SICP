#lang planet neil/sicp

(define (cycle? x)
  (define (safe-cdr l)
    (if (pair? l) (cdr l) '()))
  (let ((visited '()))
    (define (iter x)
      (set! visited (cons x visited))
      (cond ((null? (safe-cdr x)) #f)
            ((memq (safe-cdr x) visited) #t)
            (else (iter (safe-cdr x)))))
    (iter x)))


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

