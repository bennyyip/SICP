#lang racket
(define tolerance 0.0000001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
  
(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (repeated f n)
  (if (= 1 n)
      f
      (compose f
                (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (exp base n)
  (define (foo rst a i)
    (cond ((= i 0) 
           rst)
          ((even? i)
          (foo rst (* a a) (/ i 2)))
          (else
          (foo (* rst a) a (- i 1)))))
    (foo 1 base n))

(define (nth-root x n)
  (define (lg t)
    (cond ((> (/ t 2) 1)
          (+ 1 (lg (/ t 2))))
          ((< (/ t 2) 1)
           0)
          (else 
           1)))
  (define times (lg n))
  (fixed-point ((repeated average-damp times) (lambda (y) (/ x (exp y (- n 1))))) 1.0))
  ;            ******************************