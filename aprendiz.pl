:-dynamic cierto/1.
:-dynamic falso/1.
:-dynamic tamano/2.
:-dynamic tipo/2.

coloca(P, alto)	:- pasteleria(P), tamano(P, pequeno).
coloca(P, medio) :- pasteleria(P), tamano(P, grande).
coloca(P, medio) :- plato_fuerte(P).
coloca(P, bajo) :- coccion_lenta(P).
pasteleria(P) :- tipo(P, pastel).
pasteleria(P) :- tipo(P, pan).
plato_fuerte(P) :- tipo(P, carne).
coccion_lenta(P) :- tipo(P, postre).

resuelve(true) :- !.
resuelve( (A,B)) :- !, resuelve(A), resuelve(B).
resuelve(A) :- falso(A), !, fail.
resuelve(A) :- cierto(A), !.
resuelve(A) :- clause(A,B), resuelve(B).
resuelve(A) :- preguntable(A), pregunta(A, Resp), responde(Resp, A).

pregunta(A, Resp) :- visualiza_pregunta(A), read(Resp).
visualiza_pregunta(A) :- write(A), write('(si/no/)? ').

responde(si, A) :- !, assert(cierto(A)).
responde(no, A ) :- !, assert(falso(A)), fail.

preguntable(tamano(_,_)).
preguntable(tipo(_,_)).
