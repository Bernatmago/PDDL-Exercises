(define (problem lunar-1) (:domain space)
(:objects red orange yellow green blue purple - spaceship
          idx0 idx1 idx2 idx3 idx4 - idx
)

;We define the diferent positions relations using less of and one less
(:init (less idx0 idx1) (less idx0 idx2) (less idx0 idx3) (less idx0 idx4)
       (less idx1 idx2) (less idx1 idx3) (less idx1 idx4)
       (less idx2 idx3) (less idx2 idx4)
       (less idx3 idx4)

       (one-less idx0 idx1)
       (one-less idx1 idx2)
       (one-less idx2 idx3)
       (one-less idx3 idx4)

       (on red idx0 idx0)
       (on yellow idx3 idx0)
       (on purple idx1 idx1)
       (on green idx3 idx3)
       (on orange idx1 idx4)
       
)

(:goal
    (on red idx2 idx2)
))
