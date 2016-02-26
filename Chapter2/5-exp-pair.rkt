#lang racket
(define (cons a b)
  (* (exp 2 a) (exp 3 b)))

(define (car z)
  (if (= (remainder z 2) 0)
      (+ 1 (car (/ z 2)))
      0))

(define (cdr z)
  (if (= (remainder z 3) 0)
      (+ 1 (cdr (/ z 3)))
      0))

(define (exp base n)
  (define (foo rst a i)
    (cond ((= i 0) 
           rst)
          ((even? i)
           (foo rst (* a a) (/ i 2)))
          (else
           (foo (* rst a) a (- i 1)))))
  (foo 1 base n))

