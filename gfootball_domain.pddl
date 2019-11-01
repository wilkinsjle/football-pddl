;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Google Football
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain GFOOTBALL)
  (:requirements :strips :typing)
  (:types team boolean - object
          quadrant goals corner centre outs - location
          )
  (:predicates (at ?y - location)
	       (possession ?y - team)
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

  (:action kickoff
      :parameters (?from - centre ?to - quadrant ?possession - team)
      :precondition (and (at ?from) (possession ?possession) (adjacent ?from ?to))
      :effect
        (and (not (at ?from)) (at ?to))
 	    )

  (:action corner-kick
      :parameters (?from - corner ?to - quadrant ?possession - team)
      :precondition (and (at ?from) (possession ?possession) (adjacent ?from ?to))
      :effect
        (and (not (at ?from)) (at ?to))
      )

  (:action kick-out-of-bounds
      :parameters (?from - quadrant ?to - outs ?possession - team ?opponent - team)
      :precondition (and (at ?from) (possession ?possession) (adjacent ?from ?to))
      :effect
        (and (not (at ?from)) (at ?to) (not (possession ?possession)) (possession ?opponent))
      )

  (:action throw-in ;relaxing the fact that you can throw into differen quadrant.
      :parameters (?from - outs ?to - quadrant ?possession - team)
      :precondition (and (at ?from) (possession ?possession) (adjacent ?from ?to))
      :effect
        (and (not (at ?from)) (at ?to) (possession ?possession))
    )

  (:action intercept
      :parameters (?p_old - team ?p_new - team)
      :precondition (and (possession ?p_old))
      :effect
        (and (not (possession ?p_old)) (possession ?p_new))
  	 )

  ;need to think about whose perspective the actions are being done from? should be in the perspective of the trainer agent!

  ;Human will make actions according to google football, trainer agent will have to make moves/plans according to this.

  ;should be left player right player agnostic.

)
