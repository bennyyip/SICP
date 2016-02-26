#lang racket

 (define (random-in-range low high) 
   (let ((range (- high low))) 
     (+ low (* (random) range))))

(define (estimate-integral x1 x2 y1 y2 P trials)
  (define (in-rectangle)
    (P (random-in-range x1 x2) (random-in-range y1 y2)))
  (* (monte-carlo trials in-rectangle) (- x2 x1) (- y2 y1)))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
          (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (P x y) 
  (<= (+ (expt (- x 5.) 2.) 
        (expt (- y 7.) 2.)) 
     (expt 3. 2.))) 

(define pi-approx
  (/ (estimate-integral 2. 8. 4. 10. P (expt 2 20))
     9))

