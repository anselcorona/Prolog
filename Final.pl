
%plato(nombre,comida,[ingredientes],tipo, precio).

plato('Mangu con Queso', desayuno, [platano,queso,mantequilla], no_aplica, 125).
plato('Mangu con Huevo', desayuno, [platano,huevo,mantequilla], no_aplica, 115).
plato('Mangu con Salami', desayuno, [platano,salami,mantequilla], no_aplica, 100).
plato('Tres Golpes', desayuno, [platano,salami,queso,huevo,mantequilla], no_aplica, 135).
plato('Americano', desayuno, [huevo,tocineta,pancake,mantequilla], no_aplica, 150).
plato('Fit', desayuno, [yogurt,huevo,pina,melon,sandia,harina,huevo,leche], no_aplica, 175).
plato('Mofongo Chicharron', cena, [platano,chicharron,queso,ajo], plato_fuerte, 275).
plato('Mofongo Pollo', cena, [platano,pollo,ajo,queso], plato_fuerte, 275).
plato('Mofongo Volcan', cena, [platano,chicharron,tomate,queso,albahaca,ajo], plato_fuerte, 350).
plato('Mofongo 4 Quesos', cena, [platano,pollo,leche,queso,ajo], plato_fuerte, 325).
plato('Quesillo', cena, [leche,azucar,ron,huevo,caramelo], postre, 75).
plato('Pechuga en Salsa de Hongos', comida, [pollo,leche,hongos,cebolla,platano,ajo,queso], plato_fuerte, 375).
plato('Pina Colada', bebida, [pina,carnation,coco,pina], no_aplica, 195).
plato('Fruit Tonic', bebida, [gin,tonic,fresa,kiwi,manzana], no_aplica, 225).
plato('Virgin Maikitos', bebida, [naranja,pina,fresa], bebida, no_aplica,175).

%ingredientes(nombre, tipo, alergenico, tipo_alergia).

ingredientes(salami, carne, no_alergenico, no_aplica).
ingredientes(huevo, carne, alergenico, huevo).
ingredientes(tocineta, carne, no_alergenico, no_aplica).
ingredientes(chicharron, carne, no_alergenico, no_aplica).
ingredientes(pollo, carne, no_alergenico, no_aplica).
ingredientes(pancake, cereal, alergenico, gluten).
ingredientes(harina, cereal, alergenico, gluten).
ingredientes(yogurt, lacteos, alergenico, lactosa).
ingredientes(leche, lacteos, alergenico, lactosa).
ingredientes(carnation, lacteos, alergenico, lactosa).
ingredientes(queso, lacteos, alergenico, lactosa).
ingredientes(mantequilla, lacteos, alergenico, lactosa).
ingredientes(platano, verdes, no_alergenico, no_aplica).
ingredientes(ajo, verdes, no_alergenico, no_aplica).
ingredientes(tomate, verdes, no_alergenico, no_aplica).
ingredientes(albahaca, verdes, no_alergenico, no_aplica).
ingredientes(hongos, verdes, no_alergenico,no_aplica).
ingredientes(cebolla, verdes, no_alergenico, no_aplica).
ingredientes(coco, verdes, no_alergenico, no_aplica).
ingredientes(kiwi, verdes, no_alergenico, no_aplica).
ingredientes(fresa, verdes, no_alergenico, no_aplica).
ingredientes(manzana, verdes, no_alergenico, no_aplica).
ingredientes(naranja, verdes, no_alergenico, no_aplica).
ingredientes(pina, verdes, no_alergenico, no_aplica).
ingredientes(melon, verdes, no_alergenico, no_aplica).
ingredientes(sandia, verdes, no_alergenico, no_aplica).
ingredientes(azucar, dulces, no_alergenico, no_aplica).
ingredientes(caramelo, dulces, no_alergenico, no_aplica).
ingredientes(tonic, agua, no_alergenico, no_aplica).
ingredientes(gin, alcohol, no_alergenico, no_aplica).
ingredientes(ron, alcohol, no_alergenico, no_aplica).

%plato(nombre,comida,[ingredientes],tipo, precio).

glutenfree(Plato):- plato(Plato, _, L, _, _),
					ingredientes(X, _, _, gluten),
					member(X,L).
vegetariano(Plato):- plato(Plato, _, L, _, _),
					ingredientes(X, carne, _, _),
					member(X,L).
eggfree(Plato):- plato(Plato, _, L, _, _),
					ingredientes(X, _, _, huevo),
					member(X,L).
lactosefree(Plato):- plato(Plato, _, L, _, _),
					ingredientes(X, _, _, lactosa),
					member(X,L).
sugarfree(Plato):- plato(Plato,_,L,_,_),
					ingredientes(X, dulces,_,_),
					member(X,L).
alcoholfree(Plato):- plato(Plato,_,L,_,_),
					ingredientes(X, alcohol,_,_),
					member(X,L).









