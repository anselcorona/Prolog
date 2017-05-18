
%regla para el primer ejercicio.
tipotermino(Termino,Tipo):- var(Termino), Tipo = variable.
tipotermino(Termino,Tipo):- atom(Termino), Tipo = atomo.
tipotermino(Termino,Tipo):- number(Termino), Tipo = numero.
tipotermino(Termino,Tipo):- atomic(Termino), Tipo = constante.

%Segundo ejercicio
balneario(granAlmirante).
balneario(rIUBachata).
balneario(rIUMerengue).
balneario(sosuaByTheSea).
balneario(bayahibe).
balneario(bahiaPrincipeCayoLevantado).
balneario(casaMarinaReef).
balneario(casaMarinaBeach).
balneario(casaSosua).
balneario(alicia).
balneario(playaSosua).
balneario(rincon).
balneario(sosua).

% piscina/3 (nombre,tipo,ubicacion), hotelnormal para un hotel standard,
% hoteltodoincluido para un hotel todo incluido y la ubicacion que
% define la region en la que esta ubicado.

piscina(granAlmirante,hotelnormal,norte).
piscina(rIUBachata,hoteltodoincluido,norte).
piscina(rIUMerengue,hoteltodoincluido,norte).
piscina(sosuaByTheSea,hotelnormal,norte).
piscina(bayahibe,hotelnormal,este).
piscina(bahiaPrincipeCayoLevantado,hotelnormal,norte).
piscina(casaMarinaReef,hoteltodoincluido,norte).
piscina(casaMarinaBeach,hoteltodoincluido,norte).
piscina(casaSosua,casa,norte).
piscina(apartamentoPuertoBahia,casa,norte).
piscina(apartamentoSamana,casa,norte).

%Rios, sin ubicacion ya que no afecta a la condicion

rio(cabinJarabacoa).
rio(sosua).

%Playas, sin ubicacion porque no afectan a la condicion

playa(alicia).
playa(playaSosua).
playa(rincon).


% regla nada/1, recibe como parametro un lugar y retorna el valor de
% verdad de la proposicion "A Ambiorix le gusta nadar en Lugar"

nada(Lugar):- balneario(Lugar),piscina(Lugar,hoteltodoincluido,norte),!,fail.
nada(Lugar):-balneario(Lugar).



%Tercer ejercicio.
monedas([]).
monedas([x]).
monedas([x,x]).
monedas([x,x,x]).
monedas([x,x,x,x]).
monedas([]).

regla:- monedas(X), length(X,Y), write(Y), nl, fail.

%cuarto ejercicio.
bola(fresa).
bola(vanilla).
bola(chocolate).
bola(habichuelas_con_dulce).
barquilla(T,M,B):-bola(T), bola(M), bola(B).
asertarcono:-barquilla(T,M,B), T = M, T = B, M = B,
	asserta(cono([T,M,B])),!.

%Quinto ejercicio.
min(N1, N2, N1):- N1=<N2, !.
min(N1, N2, N2):- N2=<N1.
