#lang racket
(define (next-odd x)
  (if (odd? x)
      (+ x 2)
      (+ x 1)))

(define (square x) 
  (* x x))

(define (expmod b e m)
  (define (iter rst exp base)
  (cond ((= exp 0) rst)
        ((even? exp) 
          (iter rst (/ exp 2) (remainder (square base) m)))
        (else
          (iter (remainder (*  base rst) m) (- exp 1) base))))
  (iter 1 e b))

(define (fermat-test n)
  (define (try a)
    (= (expmod a n n) a))
  (try (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

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
        (;(prime? n)
         ((lambda (n) (fast-prime? n 5000)) n)
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



