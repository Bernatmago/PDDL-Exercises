;Header and description

(define (domain room)

    (:requirements :typing :fluents :disjunctive-preconditions)

    (:types robot ghost pos goal)
    (:predicates (robot-on ?r - robot ?p - pos)
                 (up ?p0 -pos ?p1 - pos)
                 (left ?p0 -pos ?p1 - pos)
                 (ghost-on ?g - ghost ?p - pos)
                 (ghost-last ?g - ghost ?p - pos)
                 (done ?go - goal)
    )
    (:functions
        ;(total-cost) - number
        (t-robot ?r - robot) - number
        (t-ghost ?g - ghost ?p - pos) - number
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
    (:action wait
        :parameters (?r - robot ?p0 - pos)
        :precondition (robot-on ?r ?p0)
        :effect (and (not(robot-on ?r ?p0))(robot-on ?r ?p0)
                     ;(increase (total-cost) 2)
                     (increase (t-robot ?r) 1))
    )
    (:action found
        :parameters (?r - robot ?p0 - pos ?g - ghost ?go - goal)
        :precondition (or(and (robot-on ?r ?p0)(ghost-on ?g ?p0)
                              (=(t-robot ?r)(t-ghost ?g ?p0)))
                         (and (robot-on ?r ?p0)(ghost-last ?g ?p0)
                              (>=(t-robot ?r)(t-ghost ?g ?p0)))                      )
        :effect (done ?go)
    )   
)