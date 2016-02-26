#lang racket
(define (count-leaves t)
  (accumulate +
             0
             (map (lambda (x) 1)
                 (fringe t))))
(require "accumulate.rkt")
(require "28-fringe.rkt")