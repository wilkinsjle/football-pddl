(define (problem gfootball-goal)
  (:domain gfootball)
  (:objects
    corner freekick normal_play goalkick penalty throw_in kickoff - game_mode
    player opponent none - actor
    attacking defending centre - location
    goal_for goal_against goal_none - goal_score)
    
  (:init (mode kickoff)
         (possession player)
         (balllocation centre)
         (goalscored goal_none))
  (:goal (goalscored goal_for)))
