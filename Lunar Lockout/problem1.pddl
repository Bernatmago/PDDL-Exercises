(define (problem lunar-1) (:domain space)
(:objects red orange yellow green blue purple - spaceship
          idx0 idx1 idx2 idx3 idx4 - idx
)

;We define the diferent positions relations using less of and one less
(:init (less-of idx0 idx1) (less-of idx0 idx2) (less-of idx0 idx3) (less-of idx0 idx4)
       (less-of idx1 idx2) (less-of idx1 idx3) (less-of idx1 idx4)
       (less-of idx2 idx3) (less-of idx2 idx4)
       (less-of idx3 idx4)

       (one-less-of idx0 idx1)
       (one-less-of idx1 idx2)
       (one-less-of idx2 idx3)
       (one-less-of idx3 idx4)

       (on orange idx4 idx0)
       (on green idx2 idx1)
       (on purple idx1 idx2)
       (on yellow idx3 idx3)
       (on red idx4 idx4)
       
)

(:goal
    (on red idx2 idx2)
))
