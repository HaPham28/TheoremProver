
; get a new clause (without number the clause) after resolving two clause
(defun makeNew (u v del)
    (progn (setq u1 (cdr (member del (second u) :test #'equal)))
            (setq v1 (cdr (member del (third v) :test #'equal)))
            (setq u2 (reverse (cdr (member del (reverse (second u)) :test #'equal))))
            (setq v2 (reverse (cdr (member del (reverse (third v)) :test #'equal))))
		    
		    (setq v3 (reverse (append u2 u1)))
		    (setq u3 (reverse (append v2 v1)))
		    (setq x (second v))
		    (setq y (third u))
		    (dolist (n v3)
			    (if (not (member n x :test #'equal))
				    (setq x (append (list n) x ) )
				)
			)
		    (dolist (m u3)
			    (if (not (member m y :test #'equal))
				    (setq y (append (list m) y ) )
			    )
		    )
            (setq z (list x y))
            (return-from makeNew z)
    
    )
)
; get a list of variables in a clause
(defun varlist (u)
    (setq varu nil)
	(dolist (pred (cdr u) )
	    (dolist (m pred)
	        (setq varu (append varu (varsin m)))
	    )
	)
	(return-from varlist varu)
)
; get a clause with new variable
(defun vnewvar (u v)
    (setq uvar (varlist u))
    (setq vvar (varlist v))
    (setq varlist nil)
        (dolist (n vvar)
        
            (if (not (member n uvar :test #'equal))
                nil
                (setq varlist (append varlist (list n)))
            )
        )
    (if (not varlist)
        nil
        (dolist (x varlist) (setq v (subst (intern (symbol-name (gensym))) x v))
        )
    )
    
    
    (return-from vnewvar v)
        

)
;resolve 2 clause if possible
(defun supplement(u v)
    (setq v (vnewvar u v))
    (setq suplist nil)
    (dolist (pred (second u))
        (dolist (predd (third v))
            (if (equal (first pred)(first predd))
                (progn 
					(setq uni (unify pred predd))
                    (if (not uni)
                        nil
			(progn
                            (setq suplist (append suplist (list (makeNew (sublis uni u :test #'equal) (sublis uni v :test #'equal) (sublis uni pred :test #'equal)))))
                        )
                    )
                )
            )
        )
    
    )
    (return-from supplement suplist)
)
;check if a clause already exist
(defun checkDupe (cls v)
   (dolist (u cls)
        (if (and (dupe u v) (dupe v u))
            (return-from checkDupe nil)
        )
   
   )
   (return-from checkDupe T)

)


;prove a theorem
(defun two-pointer (cls i)
    (format t "***********PROOF ************")
    (terpri)
	(dolist (k cls) (progn (write k) (terpri)))
    (setq end (first (first(last cls))))
    (setq suplist nil)
    (do ((y (- i 1) (+ y 1))
            (z end (first (first(last cls))))
        )
        ((= y z)(- y z))
        (do ((x 0 (+ x 1)))
            ((= x y)(- x y))
            (progn
                ;(format t "check ~2d and ~2d ~%" (nth x cls) (nth y cls))
                (setq front (supplement (nth x cls) (nth y cls)))
                (setq back (supplement (nth y cls) (nth x cls)))
                (setq suplist (append front back))
                (if (not suplist)
                    nil
                    (dolist (valid suplist)
                        (progn (setq new (push (+ (first(first(last cls))) 1) valid))
                                (if (checkDupe cls new)
                                    (progn
                                        (setq cls (append cls (list new)))
                                    
                                        (format t "$~3d:	(~3d,~3d) ~%" (first(last cls)) (first (nth x cls)) (first (nth y cls)))
                                    
                                    
                                        (if (and (not (second new)) (not (third new)))
                                            (progn (write "Theorem is proved") (terpri)
                                                (return-from two-pointer cls)
                                            )
                                        )
                                    
                                    )
                                )
                    
                        )
                    )
                )
            )
        )
    )
)

;(write (two-pointer *howling* 6))
;(write (two-pointer *rr* 7))
;(write (two-pointer *customs* 7))
;(write (two-pointer *harmonia* 7))
;(write (two-pointer *test* 5))