#lang racket 
(require "38-fold.rkt")
(define (reverse-r seq)
  (fold-right (lambda (x y) (append y (list x))) '() seq))
(define (reverse-l seq)
  (fold-left (lambda (x y) (cons y x)) '()  seq))