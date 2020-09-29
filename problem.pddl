(define (problem p1)
	(:domain farmer)
	(:objects wolf goat  cabbage 
	 		boat
	  		bank-1  bank-2)
	(:init
	    (land bank-1)
	    (land bank-2)
	    
	    (ship boat)
	    (Wolf wolf)
	    (Cabbage cabbage)
	    (Goat goat)
	    
		(on wolf bank-1)
		(on goat bank-1)
		(on cabbage bank-1)
		(on boat bank-1)
		
		(sameLand bank-1 bank-1)
		(sameLand bank-2 bank-2)
	)
	(:goal
		(and
		(on wolf bank-2)
		(on goat bank-2)
		(on cabbage bank-2)
		(on boat bank-2)
		)
	)
)