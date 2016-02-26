#lang racket
(define (make-interval a b) (cons a b))

(define (lower-bound interval) (car interval))

(define (upper-bound interval) (cdr interval))

(define (add-interval a b)
  (make-interval (+ (lower-bound a) (lower-bound b))
   (+ upper-bound a) (upper-bound b)))

(define (sub-interval a )
  (make-interval  (- (lower-bound a) (upper-bound b))
    (- (upper-bound a) (lower-bound b))))

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

(define (div-interval a b)
  (if (and (not (< 0 (lower-bound b)))
   (not (> 0 (upper-bound b))))
  (error "divide 0")
  (mul-interval a (make-interval (/ 1.0 (upper-bound b))
   (/ 1.0 (lower-bound b))))))

(provide make-interval)
(provide upper-bound)
(provide lower-bound)
(provide add-interval)
(provide sub-interval)
(provide mul-interval)
(provide div-interval)
