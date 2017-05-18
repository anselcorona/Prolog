plato(cereales,110).
plato(berenjenas,155).
plato(leche,90).
plato(arroz,250).
plato(yuca,300).
plato(queso_frito,200).
plato(filete_res,185).
plato(pollo,150).
plato(quesillo,500).

come(juan,[arroz,pollo,quesillo]).
come(maria,[cereales,leche]).
come(pedro,[yuca,queso_frito]).
come(ana,[arroz,filete_res,berenjenas]).
come(oasting,[berenjenas,arroz]).

pertenece(X,[X|_]).
pertenece(X,[_|L]):-pertenece(X,L).


comearroz(Persona):-come(Persona,L),pertenece(arroz,L).

precios:-write('Dame tu nombre'),
	read(Persona),
	write('Platos'),
	nl,
	come(Persona,L),
	plato(Plato,Precio),
	pertenece(Plato,L),
	write(Plato)<tab(5),write(Precio),nl,
	fail.


