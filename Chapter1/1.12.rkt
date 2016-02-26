#lang racket
(define (pas row col)
  (if (or (= col 0) (= col row))
      1
      (+ (pas (- row 1) col) (pas (- row 1) (- col 1)))))
(display (pas 4 2))
         
