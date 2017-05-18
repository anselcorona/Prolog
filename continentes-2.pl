%continente, area (km2) y poblacion total aproximada (al año 2008)
continente(africa,30370000,922011000).
continente(europa,10180000,731000000).
continente(asia,43810000,3879000000).
continente(america,42330000,910000000).
continente(oceania,9008500,32000000).
continente(antartida,13720000,1000).

% Franjas que delimitan los territorios entre continentes vecinos

limite(africa,europa,estrecho_gibraltar).
limite(asia,africa,itsmo_suez).
limite(asia,america,estrecho_bering).
limite(oceania,asia,linea_wallace).
limite(asia,europa,depresion_kuma_manych).

% Composición de las franjas delimitadoras
mar(estrecho_gibraltar).
mar(estrecho_bering).
mar(depresion_kuma_manych).
mar(linea_wallace).
tierra(depresion_kuma_manych).
tierra(itsmo_suez).

%cantidad paises reconocidos por continente
paises_reconocidos(africa,55).
paises_reconocidos(europa,50).
paises_reconocidos(asia,49).
paises_reconocidos(america,35).
paises_reconocidos(oceania,14).
paises_reconocidos(antartida,0).


%cantidad de territorios dependientes por continente
dependencias(africa,2).
dependencias(europa,3).
dependencias(asia,6).
dependencias(america,25).
dependencias(oceania,16).
dependencias(antartida,0).

%cantidad de paises no reconocidos por continente
paises_no_reconocidos(africa,2).
paises_no_reconocidos(europa,7).
paises_no_reconocidos(asia,6).
paises_no_reconocidos(america,0).
paises_no_reconocidos(oceania,0).
paises_no_reconocidos(antartida,0).

%reglas:
%a) densidad poblacional mayor a:


densidad_poblacion_continente(Cantidad_Personas,Continente):- continente(X,Area,Poblacion), Y is Poblacion/Area, Y>Cantidad_Personas, Continente = X.


%LIMITES

limite_continente_es(Continente, Tipo_Limite):- limite(X,_,Z), Continente = X, mar(Z), not(tierra(Z)), Tipo_Limite = 'Franja Maritima'.
limite_continente_es(Continente, Tipo_Limite):- limite(X,_,Z), Continente = X, tierra(Z), not(mar(Z)), Tipo_Limite = 'Franja Terrestre'.
limite_continente_es(Continente, Tipo_Limite):- limite(_,Y,Z), Continente = Y, mar(Z), not(tierra(Z)), Tipo_Limite = 'Franja Maritima'.
limite_continente_es(Continente, Tipo_Limite):- limite(_,Y,Z), Continente = Y, tierra(Z), not(mar(Z)), Tipo_Limite = 'Franja Terrestre'.
limite_continente_es(Continente, Tipo_Limite):- limite(X,_,Z), Continente = X, mar(Z), tierra(Z), Tipo_Limite = 'Depresion'.

%DEPENDENCIAS

contiene_tasa_alta_dependencias(Continente):-
	paises_reconocidos(Z, X),
	paises_no_reconocidos(Z, Y),
	dependencias(Z, Dependencias),
	Z\='antartida',
	Total is (X+Y),
	Tasa_Dependencias is ((Dependencias/Total)*100),
	Tasa_Dependencias>70,
	Continente = Z.





