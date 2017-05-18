bebidasalcoolicas(vino).
bebidasalcoolicas(cerveza).

legusta(maria,pasta).
legusta(juan,carne).
legusta(juan,vino).
legusta(jose,vino).
legusta(jose,carne).
legusta(jose,cerveza).


%reglas
legusta(juan,X):-legusta(maria,X).
legusta(juan,X):-legusta(X,pasta).
legusta(juan,X):-bebidasalcoolicas(Y),legusta(X,Y).
