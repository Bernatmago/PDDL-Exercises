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

       (on orange idx0 idx0)
       (on green idx2 idx0)
       (on purple idx4 idx0)
       (on yellow idx0 idx2)
       (on blue idx0 idx4)
       (on red idx4 idx4)
       
)

(:goal
    (on red idx2 idx2)
))