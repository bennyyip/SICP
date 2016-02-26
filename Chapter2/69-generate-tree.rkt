#lang racket
(require "huffman.rkt")
(require "67-sample-tree.rkt")
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge pairs)
  (if (null? (cdr pairs))
      (car pairs)
      (successive-merge
         (adjoin-set (make-code-tree
            (car pairs)
            (cadr pairs))
         (cddr pairs)))))

; (define t (generate-huffman-tree
;          '((A 4) (C 1) (D 1) (B 2))))
; (newline)
; (display t)
; (newline)
; (display sample-tree)

(provide generate-huffman-tree)