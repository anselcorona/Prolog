progenitor(juan,jose).
progenitor(juan,ana).
progenitor(maria,ana).
progenitor(jose,pedro).
progenitor(jose,laura).

%Reglas

hijo(Hijo,Padre):-progenitor(Padre,Hijo).
hermano(Hermano1,Hermano2):-progenitor(Padre,Hermano1),progenitor(Padre,Hermano2).
