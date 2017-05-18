solve(true,1).
solve((A,B),CHAB):-solve(A,CHA),solve(B,CHB), CHAB is CHA + CHB.
solve(A,CH):-clause(A,B),solve(B,CH).

