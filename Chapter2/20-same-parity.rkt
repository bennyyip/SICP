#lang racket 
(define (same-parity x . y)
  (define (same? numb)
    (if (odd? x)
      (odd? numb)
      (even? numb)))
  (define (foo l)
    (cond ((null? l) '())
      ((same? (car l))
        (cons (car l) (foo (cdr l))))
      (else (foo (cdr l)))))
  (cons x (foo y)))       