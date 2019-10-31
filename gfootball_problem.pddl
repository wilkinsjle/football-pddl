(define (problem GFOOTBALL-simple-move)
  (:domain GFOOTBALL)
  (:objects
    q1 q2 q3 q4 - quadrant
    g1 g2 - goals
    for against - team
    true false - boolean)
  (:INIT (at q1)
         (possession against)
         (goal_score false for)
         (goal_score false against)
         (adjacent q1 q2)
         (adjacent q2 q3)
         (adjacent q3 q4)
         (adjacent q1 g1)
         (adjacent q4 g2)
         (goal_pair g1 against)
         (goal_pair g2 for)
         )
  (:goal (AND (at g2)))
)
