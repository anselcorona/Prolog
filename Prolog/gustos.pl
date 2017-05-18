bebidasalcoholicas(vino).
bebidasalcoholicas(cerveza).

legusta(maria,pasta).
legusta(juan,carne).
legusta(juan,vino).
legusta(jose,pasta).
legusta(jose,carne).
legusta(jose,cerveza).

%reglas
legusta(juan,X):-legusta(maria,X).
legusta(juan,X):-legusta(X,pasta).
legusta(juan,X):-bebidasalcoholicas(Y),legusta(X,Y).
