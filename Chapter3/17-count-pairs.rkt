#lang planet neil/sicp

(define (count-pairs x)
  (let ((encountered '()))
    (define (helper x)
      (if (or (not (pair? x)) (memq x encountered))
          0
          (begin
            (set! encountered (cons x encountered))
            (+ 1
               (helper (car x))
               (helper (cdr x))))))
    (helper x)))

(define third (cons 'a 'b))
(define second (cons third third))
(define first (cons second second))
(count-pairs first)  ;; => 7

(define lst (list 'a 'b 'c))
(set-cdr! (cddr lst) lst)
(count-pairs lst)  ;; never returns