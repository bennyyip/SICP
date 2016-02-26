#lang racket
;recurssive 
(define (f n)
  (if (< n 3) 
      n
     (+ (f (- n 1)) (* (f (- n 2)) 2) (* (f (- n 3)) 3))))

;iterative
(define (g n)
  (define (gi a b c i)
    (if (= i n)
        c
        (gi b c (+ (* 3 a) (* 2 b) c) (+ 1 i))))
  (if (< n 3) 
      n
      (gi 0 1 2 2))
  )

;elegent iterative
(define (e n)
   (define (ei a b c i)
     (if (= i n )
         c
         (ei (+ a (* b 2) (* c 3)) a b (+ 1 i))))
  (ei 2 1 0 0))

(define foo 10)
(display (e foo))                  
(display (g foo))
(display (f foo))
