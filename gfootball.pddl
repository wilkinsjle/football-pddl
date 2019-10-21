;;;; Football - A realistic example
(define (domain gfootball)

(:requirements :typing)

(:types corner freekick normal_play goalkick penalty throw_in kickoff - game_mode
        player opponent none - actor
        attacking defending centre - location
        goal_for goal_against goal_none - goal_score)

(:predicates (mode ?s - game_mode)
             (possession ?a - actor)
             (balllocation ?l - location)
             (goalscored ?g - goal_score)
)

(:action pass-to-team
  :parameters (?a - actor)
  :precondition (possession ?a)
  :effect (possession ?a))

(:action dribble_forward_from_defending_half
  :parameters (?a - actor)
  :precondition (and (possession ?a)
                (balllocation defending))
  :effect (and (possession ?a)
          (balllocation centre)))

(:action dribble_forward_from_centre
  :parameters (?a - actor)
  :precondition (and (possession ?a)
                (balllocation centre))
  :effect (and (possession ?a)
          (balllocation attacking)))

(:action tackle
    :parameters (?tackler - actor, ?possessor - actor)
    :precondition (possession ?possessor)
    :effect (and (possession ?tackler)
            (not (possession ?possessor))
            ))

(:action shoot-player
  :parameters (?a - actor ?l - location)
  :precondition (and (possession ?a)
                     (balllocation attacking))
  :effect (and (not (possession ?a))
          (possession none)
          (goalscored goal_for)))

(:action reset-play
  :precondition (and (possession none)
                (goalscored goal_for))
  :effect (and (possession player)
          (mode kickoff))
  )

(:action kickoff
  :parameters (?a - actor)
  :precondition (and (possession ?a)
                (mode kickoff))
  :effect (and (possession ?a)
          (possession player)
          (mode normal_play)
          (balllocation centre)))
  )
