% canmove(x,[x,y],y,Distancia):-
%	road(x,y,Distancia);
%	road(y,x,Distancia).

canmove(x,[x,y],y,peso):-road(x,y,peso); road(y,x,peso).
solve(state,_,[],o):-goal(state).
solve(State,History,[Move|Moves],PTotal):-canmove(State,Move,State1,Peso),
	not(member(State1,History)),
	solve(State1,[State1|History],Moves,Ptemp),
	PTotal is Peso + Ptemp.
rutaMasCorta(ListR,PMin):-findall(Peso,solve(a,[a],_,Peso),ListP),
	minimo(ListP,PMin),
	findall(Ruta,solve(a,[a],Ruta,PMin),ListR).



