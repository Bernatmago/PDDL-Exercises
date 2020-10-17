;Header and description

(define (domain room)

    (:requirements :typing :fluents)

    (:types robot ghost pos goal)
    (:predicates (robot-on ?r - robot ?p - pos)
                 (up ?p0 -pos ?p1 - pos)
                 (left ?p0 -pos ?p1 - pos)
                 (ghost-on ?g - ghost ?p - pos)
                 (done ?go - goal)
    )
    (:functions
        ;(total-cost) - number
        (t-robot ?r - robot) - number
    )
    ;define actions here
    (:action move-right
        :parameters (?r - robot ?p0 - pos ?p1 - pos)
        :precondition (and (robot-on ?r ?p0) (left ?p0 ?p1))
        :effect (and (robot-on ?r ?p1) (not(robot-on ?r ?p0))
                     ;(increase (total-cost) 2)
                     (increase (t-robot ?r) 1))
    )
    (:action move-left
        :parameters (?r - robot ?p0 - pos ?p1 - pos)
        :precondition (and (robot-on ?r ?p0) (left ?p1 ?p0))
        :effect (and (robot-on ?r ?p1) (not(robot-on ?r ?p0))
                     ;(increase (total-cost) 2)
                     (increase (t-robot ?r) 1))
    )  
    (:action move-down
        :parameters (?r - robot ?p0 - pos ?p1 - pos)
        :precondition (and (robot-on ?r ?p0) (up ?p0 ?p1))
        :effect (and (robot-on ?r ?p1) (not(robot-on ?r ?p0))
                     ;(increase (total-cost) 2)
                     (increase (t-robot ?r) 1))
    )
    (:action move-up
        :parameters (?r - robot ?p0 - pos ?p1 - pos)
        :precondition (and (robot-on ?r ?p0) (up ?p1 ?p0))
        :effect (and (robot-on ?r ?p1) (not(robot-on ?r ?p0))
                     ;(increase (total-cost) 2)
                     (increase (t-robot ?r) 1))
    )
    (:action finish
        :parameters (?r - robot ?p0 - pos ?g - ghost ?go - goal)
        :precondition (and (robot-on ?r ?p0) (ghost-on ?g ?p0))
        :effect (done ?go)
    )
    (:action wait-action
        :parameters (?r - robot ?p0 - pos)
        :precondition (robot-on ?r ?p0)
        :effect (and(robot-on ?r ?p0)(increase (t-robot ?r) 1))
    )        
)
    