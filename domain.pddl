; Domain description
; Describe the relations and transitions that can occur
; This one describes the Wold Goat Cabbge puzzle
(define (domain farmer) ; Domain name must match problem's

  ; Define what the planner must support to execute this domain
  ; Only domain requirements are currently supported
  (:requirements
    :strips                 ; basic preconditions and effects
    :negative-preconditions ; to use not in preconditions
    :equality               ; to use = in preconditions
    ; :typing               ; to define type of objects and parameters
  )

  ; Define the relations
	(:predicates
		(on ?x ?bank)
		(land ?x)
		(ship ?boat)
		(Wolf ?x)
		(Goat ?x)
		(Cabbage ?x)
		(sameLand ?from ?to)
		(close ?from ?to)
	)
	
  	(:action move-Goat
		:parameters (?x ?y ?z  ?boat ?from ?to)
		:precondition
		(and(Wolf ?x)
		    (Goat ?y)
		    (Cabbage ?z)
		    
		    (ship ?boat)
		    (land ?from)
		    (land ?to)
		    (on ?y ?from)
		    (on ?boat ?from)
		    (not(sameLand ?from ?to))
		    (not(close ?from ?to))
		    )
		:effect(and
		        (on ?y ?to)
		        (on ?boat ?to)
		        (not(on ?boat ?from))
		        (not(on ?y ?from)))
	)
	(:action move-wolf
		:parameters (?x ?y ?z  ?boat ?from ?to)
		:precondition(and
		(Wolf ?x)
		(Goat ?y)
		(Cabbage ?z)
		
		(ship ?boat)
		(land ?from)
		(land ?to)
		(on ?x ?from)
		(on ?boat ?from)
		(not(sameLand ?from ?to))
		(not(close ?from ?to))

		(not(and (on ?y ?from)(on ?z ?from)))
		)
		:effect(and(on ?x ?to)(not(on ?x ?from))
		            (on ?boat ?to)(not(on ?boat ?from)))
	)
	(:action move-cabbage
		:parameters (?x ?y ?z  ?boat ?from ?to)
		:precondition(and
		(Wolf ?x)
		(Goat ?y)
		(Cabbage ?z)
		
		(ship ?boat)
		(land ?from)
		(land ?to)
		(on ?z ?from)
		(on ?boat ?from)
		(not(sameLand ?from ?to))
		(not(close ?from ?to))

		(not(and (on ?y ?from)(on ?x ?from)))
		)
		:effect(and(on ?z ?to)
	        (on ?boat ?to)(not(on ?z ?from))
		    (not(on ?boat ?from)))
	)
	(:action move-empty
		:parameters (?x ?y ?z  ?boat ?from ?to)
		:precondition(and
		(Wolf ?x)
		(Goat ?y)
		(Cabbage ?z)
		
		(ship ?boat)
		(land ?from)
		(land ?to)
		(on ?boat ?from)
		(not(sameLand ?from ?to))
		(not(close ?from ?to))
		(not(and (on ?y ?from)(on ?x ?from)))
		(not(and (on ?y ?from)(on ?z ?from)))
		)
		:effect(and(on ?boat ?to)(not(on ?boat ?from)))
	)

  ; Other transitions can be defined here
)
