(define (problem robot) (:domain room)
(:objects p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 - pos
          r - robot
          g - ghost
)
;Cells distribution
;p0 p1 p2 p3
;p4 p5 p6 p7
;p8 p9 p10 p11
;p12 P13 ;p14 ;p15

(:init (up p0 p4)(up p1 p5)(up p2 p6)(up p3 p7)
       (up p4 p8)(up p5 p9)(up p6 p10)(up p7 p11)
       (up p8 p12)(up p9 p13)(up p10 p14)(up p11 p15)

       (left p0 p1)(left p1 p2)(left p2 p3)
       (left p4 p5)(left p5 p6)(left p6 p7)
       (left p8 p9)(left p9 p10)(left p10 p11)
       (left p12 p13)(left p13 p14)(left p14 p15)
       (=(total-cost) 0)
       (robot-on r p0)
       (=(t-robot r) 0)
       (ghost-on g p15)
       (=(t-ghost g p15) 0)
       (ghost-on g p11)
       (=(t-ghost g p11) 1)
       (ghost-on g p10)
       (=(t-ghost g p10) 2)
       (ghost-last g p10)
)
(:goal (done r))
(:metric minimize (total-cost)))
