;Header and description

(define (domain space)
;:equality 
;remove requirements that are not needed (done i think)
    (:requirements :strips :typing :adl)

    (:types spaceship idx)
    (:predicates (on ?s - spaceship ?x - idx ?y - idx)
                 (less ?ia - idx ?ib - idx)
                 (one-less ?ia - idx ?ib - idx))
    ;define actions here
    (:action go-down
        :parameters (?sa - spaceship ?xab - idx ?ya - idx ?sb - spaceship ?yb - idx ?yo - idx)
        :precondition (and (on ?sa ?xab ?ya) (on ?sb ?xab ?yb) (one-less ?yo ?yb) (less ?ya ?yo)
                       (forall (?sk - spaceship ?ik - idx)
                            (not (and (less ?ya ?ik) (less ?ik ?yb) (on ?sk ?xab ?ik)))))
        :effect (and (not (on ?sa ?xab ?ya)) (on ?sa ?xab ?yo))
    )

    (:action go-up
        :parameters (?sa - spaceship ?xab - idx ?ya - idx ?sb - spaceship ?yb - idx ?yo - idx)
        :precondition (and (on ?sa ?xab ?ya) (on ?sb ?xab ?yb) (one-less ?yb ?yo) (less ?yo ?ya)
                       (forall (?sk - spaceship ?ik - idx)
                            (not (and (less ?yb ?ik) (less ?ik ?ya) (on ?sk ?xab ?ik)))))
        :effect (and (not (on ?sa ?xab ?ya)) (on ?sa ?xab ?yo))
    )

    (:action go-left
        :parameters (?sa - spaceship ?xa - idx ?yab - idx ?sb - spaceship ?xb - idx ?xo - idx)
        :precondition (and (on ?sa ?xa ?yab) (on ?sb ?xb ?yab) (one-less ?xb ?xo) (less ?xo ?xa)
                       (forall (?sk - spaceship ?ik - idx)
                            (not (and (less ?xb ?ik) (less ?ik ?xa) (on ?sk ?ik ?yab)))))
        :effect (and (not (on ?sa ?xa ?yab)) (on ?sa ?xo ?yab))
    )

    (:action go-right
        :parameters (?sa - spaceship ?xa - idx ?yab - idx ?sb - spaceship ?xb - idx ?xo - idx)
        :precondition (and (on ?sa ?xa ?yab) (on ?sb ?xb ?yab) (one-less ?xo ?xb) (less ?xa ?xo)
                       (forall (?sk - spaceship ?ik - idx)
                            (not (and (less ?xa ?ik) (less ?ik ?xb) (on ?sk ?ik ?yab)))))
        :effect (and (not (on ?sa ?xa ?yab)) (on ?sa ?xo ?yab))
    )
)