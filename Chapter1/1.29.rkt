#lang racket
(define (cube x) (* x x x))

(define (sum f next a b)
  (define (iter rst i)
    (if (> i b)
        rst
        (iter (+ rst (f i)) (next i))))
  (iter 0 a))
  
;n must be even
(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (* (/ h 3) (+ (f a)
                    (* 4 (sum f (lambda (x) (+ x h h)) (+ a h) (- b h)))
                    (* 2 (sum f (lambda (x) (+ x h h)) (+ a h h) (- b h h)))
                    (f  b)))))

(display (simpson cube 0 1 1000))