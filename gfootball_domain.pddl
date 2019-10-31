;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Google Football
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain GFOOTBALL)
  (:requirements :strips :typing)
  (:types ball team boolean - object
          quadrant goals - location
          )
  (:predicates (at ?y - location)
	       (possession ?y - team)
	       (goal_score ?x - boolean ?y - team)
	       (adjacent ?x - location ?y - location)
         (goal_pair ?g - goals ?t - team)
	       )

  (:action move-ball
	     :parameters (?from - quadrant ?to - quadrant ?possession - team)
	     :precondition (and (at ?from) (adjacent ?from ?to) (possession ?possession))
	     :effect
	       (and (not (at ?from)) (at ?to))
		 )

  (:action shoot-ball
       :parameters (?at - quadrant ?possession - team ?goal - goals)
       :precondition (and (at ?at) (adjacent ?at ?goal) (possession ?possession) (goal_pair ?goal ?possession))
       :effect
         (and (not (at ?at)) (at ?goal))
  	 )

  (:action tackle
      :parameters (?p_old - team ?p_new - team)
      :precondition (and (possession ?p_old))
      :effect
        (and (not (possession ?p_old)) (possession ?p_new))
  	 )
)
