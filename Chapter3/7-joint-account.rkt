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
  (define (dispatch pwd m)
    (cond  ((not (eq? password pwd))
            (lambda (x) "Incorrect password"))
           ((eq? m 'withdraw) withdraw)
           ((eq? m 'deposit) deposit)
           (else (error "Unknown request -- MAKE-ACCOUNT"
                        m))))
  dispatch)

(define (make-joint account old-password new-password)
  (if (number? ((account old-password 'withdraw) 0))
      (lambda (pwd msg)
        (if (eq? pwd new-password)
            (account old-password msg)
            (account 'wrong-password 'foo)))
      "Incorrect password"))


(define acc (make-account 100 'secret-password))
; ((acc 'secret-password 'withdraw) 40)
; ((acc 'some-other-password 'deposit) 50)

