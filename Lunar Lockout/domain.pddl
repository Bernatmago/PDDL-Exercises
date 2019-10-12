;Header and description

(define (domain space)
;:equality 
;remove requirements that are not needed (done i think)
    (:requirements :strips :typing :adl)

    (:types spaceship idx)
    (:predicates (on ?s - spaceship ?x - idx ?y - idx)
                 (less-of ?ia - idx ?ib - idx)
                 (one-less-of ?ia - idx ?ib - idx))
    ;define actions here
    (:action go-down
        :parameters (?sa - spaceship ?xab - idx ?ya - idx ?sb - spaceship ?yb - idx ?yo - idx)
        :precondition (and (on ?sa ?xab ?ya) (on ?sb ?xab ?yb) (one-less-of ?yo ?yb) (less-of ?ya ?yo)
                       (forall (?sk - spaceship ?ik - idx)
                            (not (and (less-of ?ya ?ik) (less-of ?ik ?yb) (on ?sk ?xab ?ik)))))
        :effect (and (not (on ?sa ?xab ?ya)) (on ?sa ?xab ?yo))
    )

    (:action go-up
        :parameters (?sa - spaceship ?xab - idx ?ya - idx ?sb - spaceship ?yb - idx ?yo - idx)
        :precondition (and (on ?sa ?xab ?ya) (on ?sb ?xab ?yb) (one-less-of ?yb ?yo) (less-of ?yo ?ya)
                       (forall (?sk - spaceship ?ik - idx)
                            (not (and (less-of ?yb ?ik) (less-of ?ik ?ya) (on ?sk ?xab ?ik)))))
        :effect (and (not (on ?sa ?xab ?ya)) (on ?sa ?xab ?yo))
    )

    (:action go-left
        :parameters (?sa - spaceship ?xa - idx ?yab - idx ?sb - spaceship ?xb - idx ?xo - idx)
        :precondition (and (on ?sa ?xa ?yab) (on ?sb ?xb ?yab) (one-less-of ?xb ?xo) (less-of ?xo ?xa)
                       (forall (?sk - spaceship ?ik - idx)
                            (not (and (less-of ?xb ?ik) (less-of ?ik ?xa) (on ?sk ?ik ?yab)))))
        :effect (and (not (on ?sa ?xa ?yab)) (on ?sa ?xo ?yab))
    )

    (:action go-right
        :parameters (?sa - spaceship ?xa - idx ?yab - idx ?sb - spaceship ?xb - idx ?xo - idx)
        :precondition (and (on ?sa ?xa ?yab) (on ?sb ?xb ?yab) (one-less-of ?xo ?xb) (less-of ?xa ?xo)
                       (forall (?sk - spaceship ?ik - idx)
                            (not (and (less-of ?xa ?ik) (less-of ?ik ?xb) (on ?sk ?ik ?yab)))))
        :effect (and (not (on ?sa ?xa ?yab)) (on ?sa ?xo ?yab))
    )
)