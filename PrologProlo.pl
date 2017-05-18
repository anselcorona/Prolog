anadir_a_cola(X,[],[X]).
anadir_a_cola(X,[Y|Ys],[Y|Zs]):-anadir_a_cola(X,Ys,Zs).

concatenar([],Ys,Ys).
concatenar([X|Xs],Ys,[X|Zs]):-concatenar(Xs,Ys,Zs).

concatenarDif1(L1-R1,L2-R2,L3-R3):- R1=L2,L3=L1, R3=R2.
concatenarDif2(A-B,B-C,A-C).

p:-q,r.
q:-s.
r.
s.
x:-y.


p(X):-q(X).
p(b):-r(b),s(b).
q(a).

solve(A):-A.


solve(true).

solve((A,B)):- solve(A), solve(B).

solve(A):- clause(A,B),solve(B).
