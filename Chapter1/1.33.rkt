#lang racket
(define (accumulate ? combiner null-value term a next b)
  (define (iter rst i)
    (if (> i b)
        rst
        (if (? i)
        (iter (combiner rst (term i)) (next i))
        (iter rst (next i)))))
  (iter null-value a))

(define (sum-prime a b)
  (accumulate prime? + 0 (lambda (x) x) a next-odd b))

(define (product-coprimes n)
  (accumulate (lambda (x)(coprime? x n)) * 1 (lambda (x) x) 1 (lambda (x) (+ 1 x)) n))

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

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (coprime? a b)
  (= (gcd a b) 1))