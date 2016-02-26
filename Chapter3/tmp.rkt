#lang racket
(define random-init 7)

(define (rand-update x)
  (let ((a 27) (b 26) (m 127))
    (modulo (+ (* a x) b) m)))

(define rand
    ((lambda (x)
        (lambda ()
          (set! x (rand-update x))
          x)) random-init))