road(a,b,10).
road(b,c,5).
road(a,c,10).
road(b,d,15).
road(c,d,10).
road(d,e,15).

go(X,Y,[]):-road(X,Y,_);road(Y,X,_).
go(X,Y,[H|T]):-go(X,H,[]),go(H,Y,T).

succesors([State,History,Moves],Succ):-
	findall(
	    [State1,[State1|History],NewMoves],

solveBFS([(State,History,Moves)|T],Moves):-goal(State).
solveBFS([(State,History,Moves)|T],OtherMoves):-
	succesors([State,History,Moves],Succ),
	append(T,Succ,NewFringe),
	solveBFS(NewFringe,OtherMoves).
