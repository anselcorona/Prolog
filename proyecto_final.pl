%Este ha de ser nuestro proyecto final basado en una pequena aplicacion
% que sea capaz de sugerir a un potencial cliente uno o varios platos
% que cumplan con sus preferencias e indicaciones.

% Se tratara de implementar la interfaz grafica XPCE para el desarrollo
% de este proyecto.

:- dynamic plato/4.
:- dynamic bebida/3.
:- dynamic precio/2.
:- dynamic ingredientes/3.

%Hechos
plato(P01, desayuno, [platano,queso,mantequilla], no_aplica).
plato(P02, desayuno, [platano,huevo,mantequilla], no_aplica).
plato(P03, desayuno, [platano,salami,mantequilla], no_aplica).
plato(P04, desayuno, [platano,salami,queso,huevo,mantequilla], no_aplica).
plato(P05, desayuno, [huevo,tocineta,pancake,mantequilla], no_aplica).
plato(P06, desayuno, [yogurt,huevo,pina,melon,sandia,pancake], no_aplica).
plato(P07, cena, [platano,chicharron,queso,ajo], plato_fuerte).
plato(P08, cena, [platano,pollo,ajo,queso], plato_fuerte).
plato(P09, cena, [platano,chicharron,tomate,queso,albahaca,ajo], plato_fuerte).
plato(P10, cena, [platano,pollo,leche,queso,ajo], plato_fuerte).
plato(P11, cena, [leche,azucar,ron,huevo,caramelo], postre).
plato(P12, almuerzo, [pollo,leche,hongos,salsa_china,cebolla,platano,ajo,queso]).

tipo_plato(P01, desayuno).
tipo_plato(P02, desayuno).
tipo_plato(P03, desayuno).
tipo_plato(P04, desayuno).
tipo_plato(P05, desayuno).
tipo_plato(P06, desayuno).
tipo_plato(P07, cena).
tipo_plato(P08, cena).
tipo_plato(P09, cena).
tipo_plato(P10, cena).
tipo_plato(P11, cena).
tipo_plato(P12, almuerzo).

bebida(B01, [concentrado_pina,carnation,crema_coco,pina], no_alcohol).
bebida(B02, [gin,agua_tonica,fresa,kiwi,manzana], alcohol).
bebida(B03, [naranja,pina,fresa], no_alcohol).

precio(P01, 125).
precio(P02, 115).
precio(P03, 100).
precio(P04, 135).
precio(P05, 150).
precio(P06, 175).
precio(P07, 275).
precio(P08, 275).
precio(P09, 350).
precio(P10, 325).
precio(P11, 75).
precio(P12, 375).
precio(B01, 195).
precio(B02, 225).
precio(B03, 175).



%Declarando la directiva que carga la libreria de XPCE.
%:- use_module(library(pce)).
:- pce_image_directory('./').

%imagenes del proyecto
resource(logo_portada, image, image('maikitos/logotipo_maikitosbydemoya.jpg')).

entrada():-
	new(Logo_portada, bitmap(resource(logo_portada))),
	new(Portada, picture('Maikitos By De Moya', size(Logo_portada?width, Logo_portada?height))),
	send(Portada, display, Logo_portada),
	send(Portada, open_centered),
	send(Portada, scrollbars, none),
	new(Dialog_boton, dialog),
	send(Dialog_boton, append, button(entrada, message(@prolog, main))),
	send(Dialog_boton, below, Portada).




:-entrada.

main():-
		



