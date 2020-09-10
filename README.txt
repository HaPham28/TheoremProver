Instructions for compiling and running:

Run lisp: (for example in linux.cs.tamu.edu)

./.../lisp

Load function definitions:

(load "dupeclause.lsp")
(load "sunify.lsp")
(load "theorems.lsp")
(load "prover.lsp")

To test the theorems:

(two-pointer *howling* 6)
(two-pointer *rr* 7)
(two-pointer *customs* 7)
(two-pointer *harmonia* 7)
(two-pointer *test* 5)

Additional informations about the program:
file "theorems.lsp" contains the theorems writting in lisp.
file "dupeclause.lsp" contains lisp codes to check duplicate clauses
file "sunify.lsp" contains lisp codes to get unification
file "prover.lsp" is the main code to prove the theorems.