#lang racket
(define random-init 7)

(define (rand-update x)
  (let ((a 27) (b 26) (m 127))
    (modulo (+ (* a x) b) m)))

(define (rand)
  (let ((x random-init))
    (define (dispatch message)
      (cond ((eq? message 'generate)
             (begin (set! x (rand-update x))
                    x))
            ((eq? message 'reset)
             (lambda (new-value)
               (set! x new-value)))))
    dispatch))