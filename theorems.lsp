;---------------------------------------------------------------------------
;
; Theorems
;
;---------------------------------------------------------------------------

(defvar *howling*   '((1 ((howl z)) ((hound z)))
                    (2 nil ((have x y) (cat y) (have x z) (mouse z)))
                    (3 nil ((ls w) (have w v) (howl v)))
                    (4 ((have (john) (a))) nil)
                    (5 ((cat (a)) (hound (a))) nil)
                    (6 ((mouse (b))) nil)    ;; goal clause begins here
                    (7 ((ls (john))) nil)
                    (8 ((have (john) (b))) nil)))

(defvar *rr* 	'( (1   ( (rr (a)) )   	( (coyote y) )   )
		   (2	( (chase z (a)) ) ( (coyote z) )   )	
		   (3   ( (smart x) )   ( (rr x) (beep x) )   )
		   (4   nil ( (coyote w) (rr u) (catch w u) (smart u) )    )
		   (5   ( (frustrated s) (catch s t) ) ( (coyote s) (rr t) 
				(chase s t) )    )
		   (6   ( (beep r) )  ( (rr r) )   )
		   (7   ( ( coyote (b)) ) nil   ) ;; goal clause begins here
		   (8   nil ( (frustrated (b)) )   )     ) )

(defvar *customs* '( (1 ( (v x) (s x (f x)) )
		      ( (e x) ) )
		   (2 ( (v y) (c (f y)) )
		      ( (e y) ) )
		   (3 ( (e (a)) ) nil )
		   (4 ( (d (a)) ) nil )
		   (5 ( (d z) )   ( (s (a) z) ) )
		   (6 nil   ( (d w) (v w) ) )
		   (7 nil  ( (d r) (c r) ) )   )    ) ;; goal clause begins here
		   
		   
(defvar *harmonia* '(
    (1 ( (Grandparent x y) )  ( (Parent x z) (Parent z y) )     )
    (2 ( (Parent x y))  ((Mother x y))   )
    (3 ( (Parent x y))  ((Father x y))  )
    (4 ( (Father (Zeus) (Ares) ) ) nil    )
    (5 ( (Mother (Hera) (Ares) ) ) nil    )
    (6 ( (Father (Ares) (Harmonia)) ) nil )
    (7 nil  ((Grandparent x (Harmonia)))  ) ;; goal clause begins here
    )
)

(defvar *test* '( (1 nil ((late x)(enroll x y)))
    (2 ((enroll x (a))) ((happy x)))
    (3 ((hungry x) (happy x)) nil)
    (4 ((late (b))) nil)
    (5 nil ((hungry (b))))  ;; goal clause begins here
    )
)		