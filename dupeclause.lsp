;----------------------------------------------------------------------------
; 
; dupe : check if two given clauses are duplicates 
; 
;   does not care if the clause numbers are same or different
;
;----------------------------------------------------------------------------
;
;; NOTE: You need to run (and (dupe u v) (dupe v u)) to get the correct 
;; result!

(defun dupe (u v)
   (and (identical (second u) (second v))
        (identical (third u) (third v))))

;----------------------------------------------------------------------------
; 
; identical : check if two set of predicates are literally the same
;
;----------------------------------------------------------------------------
(defun identical (u v) 
   (if (not (eq (length u) (length v)))
      nil
      (dolist (pred u T)
         (if (not (member pred v :test 'equal)) 
            (return-from identical nil)
	  )
      )
   )
)
