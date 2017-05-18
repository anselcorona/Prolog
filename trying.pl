

%plato(nombre,[ingredientes],precio)

codigo(p001,'Mangu con Queso').
codigo(p002,'Mangu con Huevo').
codigo(p003, 'Mangu con Salami').
codigo(p004,'Tres Golpes').
codigo(p005, 'Americano').
codigo(p006, 'Fit').
codigo(p007, 'Mofongo de Chicharron').
codigo(p008, 'Mofongo de Pollo').
codigo(p009, 'Mofongo Volcan').
codigo(p010, 'Mofongo 4 Quesos').
codigo(p011, 'Quesillo').
codigo(p012, 'Pechuga en Salsa de Hongos').
codigo(p013, 'Piña Colada').
codigo(p014, 'Maikitos Fruit Tonic').
codigo(p015, 'Virgin Maikitos').
codigo(p016, 'Cantinflas').

plato(p001, [platano,queso,mantequilla], 125).
plato(p002, [platano,huevo,mantequilla], 115).
plato(p003, [platano,salami,mantequilla], 100).
plato(p004, [platano,salami,queso,huevo,mantequilla], 135).
plato(p005, [huevo,tocineta,pancake,mantequilla], 150).
plato(p006, [yogurt,huevo,pina,melon,sandia,harina,huevo,leche], 175).
plato(p007, [platano,chicharron,queso,ajo], 275).
plato(p008, [platano,pollo,ajo,queso], 275).
plato(p009, [platano,chicharron,tomate,queso,albahaca,ajo], 350).
plato(p010, [platano,pollo,leche,queso,ajo], 325).
plato(p011, [leche,azucar,ron,huevo,caramelo], 75).
plato(p012, [pollo,leche,hongos,cebolla,platano,ajo,queso], 375).
plato(p013, [pina,carnation,coco,pina], 195).
plato(p014, [gin,tonic,fresa,kiwi,manzana], 225).
plato(p015, [naranja,pina,fresa],175).
plato(p016, [chocolate,harina], 100).

tipo_plato(p001,desayuno).
tipo_plato(p002,desayuno).
tipo_plato(p003,desayuno).
tipo_plato(p004,desayuno).
tipo_plato(p005,desayuno).
tipo_plato(p006,desayuno).
tipo_plato(p007,cena).
tipo_plato(p007,almuerzo).
tipo_plato(p008,cena).
tipo_plato(p008,almuerzo).
tipo_plato(p009,cena).
tipo_plato(p009,almuerzo).
tipo_plato(p010,cena).
tipo_plato(p010,almuerzo).
tipo_plato(p011,postre).
tipo_plato(p012,cena).
tipo_plato(p012,almuerzo).
tipo_plato(p013,bebida).
tipo_plato(p014,bebida).
tipo_plato(p015,bebida).
tipo_plato(p016,postre).


%ingredientes(nombre, tipo, alergenico, tipo_alergia).
ingrediente(salami, carne, no_aplica).
ingrediente(huevo, carne, huevo).
ingrediente(tocineta, carne, no_aplica).
ingrediente(chicharron, carne, no_aplica).
ingrediente(pollo, carne, no_aplica).
ingrediente(pancake, cereal, gluten).
ingrediente(harina, cereal, gluten).
ingrediente(yogurt, lacteos, lactosa).
ingrediente(leche, lacteos, lactosa).
ingrediente(carnation, lacteos, lactosa).
ingrediente(queso, lacteos, lactosa).
ingrediente(mantequilla, lacteos, lactosa).
ingrediente(platano, verdes, no_aplica).
ingrediente(ajo, verdes, no_aplica).
ingrediente(tomate, verdes, no_aplica).
ingrediente(albahaca, verdes, no_aplica).
ingrediente(hongos, verdes,no_aplica).
ingrediente(cebolla, verdes, no_aplica).
ingrediente(coco, verdes, no_aplica).
ingrediente(kiwi, verdes, no_aplica).
ingrediente(fresa, verdes, no_aplica).
ingrediente(manzana, verdes, no_aplica).
ingrediente(naranja, verdes, no_aplica).
ingrediente(pina, verdes, no_aplica).
ingrediente(melon, verdes, no_aplica).
ingrediente(sandia, verdes, no_aplica).
ingrediente(azucar, dulces, no_aplica).
ingrediente(caramelo, dulces, no_aplica).
ingrediente(tonic, agua, no_aplica).
ingrediente(gin, alcohol, alcohol).
ingrediente(ron, alcohol, alcohol).
glutenfree(Lista):-findall(Nombre, (codigo(Plato,Nombre),
                 plato(Plato, L, _),
                 ingrediente(X, _, gluten),
                 not(member(X,L))), Lista).
vegetariano(Lista):- findall(Nombre, (codigo(Plato,Nombre),
                 plato(Plato, L, _),
                 ingrediente(X, carne, _),
                 not(member(X,L))), Lista).
eggfree(Lista):- findall(Nombre, (codigo(Plato,Nombre),
                 plato(Plato, L, _),
                 ingrediente(X, _, huevo),
                 not(member(X,L))), Lista).
lactosefree(Lista):- findall(Nombre, (codigo(Plato,Nombre),
                 plato(Plato, L, _),
                 ingrediente(X, _, lactosa),
                 not(member(X,L))), Lista).
sugarfree(Lista):- findall(Nombre, (codigo(Plato,Nombre),
                 plato(Plato, L, _),
                 ingrediente(X, dulces, _),
                 not(member(X,L))), Lista).
alcoholfree(Lista):- findall(Nombre, (codigo(Plato,Nombre),
                 plato(Plato, L, _),
                 ingrediente(X, _, alcohol),
                 not(member(X,L))), Lista).

printlist([X|List]) :-
write(X),nl,
printlist(List).

%Reglas suggest/2(Presupuesto, Comida1):
%discriminan solo por Presupuesto.
suggest(Presupuesto, Comida):-
        findall(Nombre,(tipo_plato(X,Comida),
        plato(X,_,Precio),
        Precio =<Presupuesto,
        codigo(X,Nombre)),Result),
        printlist(Result).

%suggest/3(Presupuesto, Comida1, Comida2):
suggest(Presupuesto,Comida1,Comida2):-
findall((Nombre1,Nombre2),(tipo_plato(X,Comida1),
        plato(X,_,Precio1),
        codigo(X,Nombre1),
	tipo_plato(X2,Comida2),
	plato(X2,_,Precio2),
	codigo(X2,Nombre2),
	(Precio1+Precio2)=<Presupuesto),Result),
printlist(Result).

%suggest/4(Presupuesto, Comida1, Comida2, Comida3)
suggest(Presupuesto, Comida1, Comida2, Comida3):-
findall((Nombre1,Nombre2,Nombre3),(
tipo_plato(X,Comida1),
plato(X,_,Precio1),
codigo(X,Nombre1),
tipo_plato(X2,Comida2),
plato(X2,_,Precio2),
codigo(X2,Nombre2),
tipo_plato(X3,Comida3),
plato(X3,_,Precio3),
codigo(X3,Nombre3),
(Precio1+Precio2+Precio3)=<Presupuesto),Result),
printlist(Result).


