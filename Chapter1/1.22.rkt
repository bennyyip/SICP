#lang racket
(define (next-odd x)
  (if (odd? x)
      (+ x 2)
      (+ x 1)))
(define (square x) 
  (* x x))

(define (prime? x)
  (define (test i)
    (cond ((> (square i) x)
           #t)
          ((= (remainder x i) 0)
           #f)
          (else 
           (test (next-odd i)))))
  (test 2))

(define (get-prime n count)
  (cond ((= count 0)
        (display ""))
        ((prime? n)
         (display n)
         (newline)
         (get-prime (next-odd n) (- count 1)))
        (else 
         (get-prime (next-odd n) count))))
                         
(define (foo n)
  (let ((start-time (current-inexact-milliseconds)))
    (get-prime n 3)
    (display "used time:")
    (display (- (current-inexact-milliseconds) start-time))
    (newline)))

(define (bar x n)
  (cond ((> n 0)
        (foo x) (bar (* x 10) (- n 1)))))