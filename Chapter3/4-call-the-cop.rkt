#lang racket

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (call-the-cops) "The cops are coming")
  (let ((tries 0))
    (define (dispatch pwd m)
      (cond  ((not (eq? password pwd))
              (lambda (x) (begin (set! tries (+ tries 1))
                                 (if (> tries 6)
                                  (call-the-cops)
                                     "Incorrect password"))))
             ((eq? m 'withdraw) (begin (set! tries 0) withdraw))
             ((eq? m 'deposit) (begin (set! tries 0)  deposit))
             (else (error "Unknown request -- MAKE-ACCOUNT"
                          m))))
    dispatch))

; (define acc (make-account 100 'secret-password))
; ((acc 'secret-password 'withdraw) 40)
; ((acc 'some-other-password 'deposit) 50)

