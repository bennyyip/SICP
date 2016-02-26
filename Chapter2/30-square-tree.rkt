#lang racket
(require "square.rkt")
(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
            (square-tree sub-tree)
            (square sub-tree)))
      tree))

(define (square-tree-raw tree)
  (cond ((null? tree) '())
       ((pair? tree)
        (cons (square-tree-raw (car tree)) (square-tree-raw (cdr tree))))
       (else (square tree))))

; (define tree
;   (list 1
;        (list 2 (list 3 4) 5)
;        (list 6 7)))
