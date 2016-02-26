#lang racket
(require "huffman.rkt")
(require "67-sample-tree.rkt")
(require "69-generate-tree.rkt")
(define (element-of-set? x set)
  (cond ((null? set) false)
    ((equal? x (car set)) true)
    (else (element-of-set? x (cdr set)))))


(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
      (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
    ((element-of-set? symbol (symbols (left-branch tree)))
     (cons 0 (encode-symbol symbol (left-branch tree))))
    ((element-of-set? symbol (symbols (right-branch tree)))
     (cons 1 (encode-symbol symbol (right-branch tree))))))


; (display "\n")
;(display (encode (list 'A 'D 'A 'B 'B 'C 'A) sample-tree))
;(display (encode '(A D A B B C A) sample-tree))
; (newline)

(provide encode)
