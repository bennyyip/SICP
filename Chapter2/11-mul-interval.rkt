#lang racket
(require "7-interval.rkt")
(define (mul-interval x y)
  (let ((a (lower-bound x))
        (b (upper-bound x))
        (c (lower-bound y))
        (d (upper-bound y)))
    (cond ((> a 0)
           (cond ((> c 0) (make-interval (* a c) (* b d)))
                 ((< d 0) (make-interval (* b c) (* a d)))
                 (else (make-interval (* b c) (* b d)))))
           ((< b 0)
            (cond ((> c 0) (make-interval (* b c) (* a d)))
                  ((< d ) (make-interval (* b d) (* a c)))
                  (else (make-interval (* a d) (* a c)))))
           (else
            (cond ((> c 0) (make-interval (* a d) (* b d)))
                  ((< d 0) (make-interval (* b c) (* a c)))
                  (else (make-interval (min (* a d) (* b c) ) (max (* a c) (* b d)))))))))
 
(define a (make-interval -10 20))
(define b (make-interval -3 4))
  