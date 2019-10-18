;;;; Football - A realistic example
(define (domain g-football)

(:requirements :typing)

(:types ball - props
        attacking defending - location
        player opponent none - actor
        props actor - object
        true false - boolean)

(:predicates (posession-ball ?a - actor)
             (in-location ?p - props)
             (goal-scored ?b - boolean))

(:action pass-to-team
  :parameters (?a - actor)
  :precondition (possession-ball ?a)
  :effect (posession-ball ?a))

(:action shoot
  :parameters (?who - actor ?where - location)
  :precondition (and (possession-ball ?a)
                     ())
  :effect (and (possession-ball none) (goal-scored true)
  ))

(:action reset-player
  :parameters )

(:action intercept)
