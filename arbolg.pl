progenitor(juan,jose).
progenitor(juan,ana).
progenitor(maria,ana).
progenitor(jose,pedro).
progenitor(jose,laura).
progenitor(ana,rosa).
hombre(juan).
hombre(jose).
hombre(pedro).
mujer(ana).
mujer(laura).
mujer(maria).
mujer(rosa).

%Reglas
hijo(Hijo,Padre):-progenitor(Padre,Hijo).
hermano(Hermano1,Hermano2):-progenitor(Padre,Hermano1), progenitor(Padre,Hermano2).
primo(Primo1,Primo2):-progenitor(Padre1,Primo1),progenitor(Padre2,Primo2),hermano(Padre1,Padre2).
abuelo(Abuelo,Nieto):-progenitor(Abuelo,Padre),progenitor(Padre,Nieto).
tio(Tio,Sobrino):-progenitor(Padre,Sobrino), hermano(Tio,Padre), hombre(Tio).
tia(Tia, Sobrino):-progenitor(Padre,Sobrino), hermano(Tia, Padre), mujer(Tia).



