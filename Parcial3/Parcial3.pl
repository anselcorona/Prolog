

planeta(mercurio,[telurico],0.06,1).
planeta(venus,[telurico],0.82,2).
planeta(tierra,[telurico],1,3).
planeta(marte,[telurico],0.11,4).
planeta(jupiter,[gigante,gaseoso],318,5).
planeta(saturno,[gigante,gaseoso],95,6).
planeta(urano,[gigante,helado],14.6,7).
planeta(neptuno,[gigante,helado],17.2,8).

%satelites de los planetas

satelites(mercurio,[]).
satelites(venus,[]).
satelites(tierra,[luna]).
satelites(marte,[]).
satelites(jupiter,[io,europa,ganimedes,calisto]).
satelites(saturno,[titan,tetis,dione,rea,japeto,mimas,encelado]).
satelites(urano,[miranda,ariel,umbriel,titania,oberon]).
satelites(neptuno,[triton]).

% periodos de rotacion de los planetas en dias

rotacion(mercurio,58.6).
rotacion(venus,43).
rotacion(tierra,1).
rotacion(marte,1.03).
rotacion(jupiter,0.414).
rotacion(saturno,0.426).
rotacion(urano,0.718).
rotacion(neptuno,0.6745).

% periodos orbitales de los planetas en años

traslacion(mercurio,0.24).
traslacion(venus,0.615).
traslacion(tierra,1).
traslacion(marte,1.88).
traslacion(jupiter,11.86).
traslacion(saturno,29.46).
traslacion(urano,84.01).
traslacion(neptuno,164.79).

tiempo_traslacion(Planeta,X) :-
	satelites(Planeta, L),
	length(L, Cantidad),
	Cantidad > 1,
	traslacion(Planeta, X).

%%Parte grafica XPCE

:- pce_image_directory('./').

resource(sol, image, image('planetas/sol.gif')).
resource(mercurio, image, image('planetas/mercurio.gif')).
resource(venus, image, image('planetas/venus.gif')).
resource(tierra, image, image('planetas/tierra.gif')).
resource(marte, image, image('planetas/marte.gif')).
resource(jupiter, image, image('planetas/jupiter.gif')).
resource(saturno, image, image('planetas/saturno.gif')).
resource(urano, image, image('planetas/urano.gif')).
resource(neptuno, image, image('planetas/neptuno.gif')).
resource(fondo, image, image('planetas/space.jpg')).
resource(fondo2, image, image('planetas/space2.jpg')).


consultar_traslacion(Planeta) :-
	new(Fondo, bitmap(resource(fondo2))),
	new(Sol, bitmap(resource(sol))),
	new(Img_planeta, bitmap(resource(Planeta))),
	new(Picture, picture('hola', size(Fondo?width, Fondo?height))),

	new(Angle_label, bitmap(resource(tierra))),

	send(Picture, display, Fondo),

%	send(Picture, display, Angle_label, point(0, 0)),

	send(Picture, display, Sol, point(Fondo?center_x - Sol?width/2, Fondo?center_y - Sol?height/2)),
	send(Picture, display, Img_planeta, point(Sol?x + 144, Fondo?center_y - 64)),

	send(Picture, scrollbars, none),

	traslacion(Planeta, Anno),
	rotacion(Planeta, Dia),
	atom_concat('periodo de rotacion: ', Dia, Per_dia),
	atom_concat('periodo de tralacion: ', Anno, Per_anno),

	new(Timer, timer(1, message(
				@prolog,
				trasladar,
				Img_planeta,
				Angle_label
			    ))
	),
	send(Timer, start, repeat),


	send(new(Dialog, dialog), append, label(dia,Per_dia)),
	send(Dialog, append, label(anno, Per_anno)),
	send(Dialog, below(Picture)),

	send(Picture, open_centered).


trasladar(Planeta, Angle_label) :-
	get(Angle_label, x, Angulo),
	D is 80,
	traslacion(Planeta, Anno),
	T is 1/Anno*0.1,
	Xcomp is D*cos(Angulo),
	Ycomp is D*sin(Angulo),
	send(Planeta, x, Planeta?x + Xcomp),
	get(Planeta, x, X),
	send(@prolog, writeln, X),
	send(Planeta, y, Planeta?y + Ycomp),
	Angle_aument is 2*pi/T*0.1,
	send(Angle_label, x, Angle_label?x + Angle_aument).

oneforall :-
	new(Frame, frame('Consultas del sistema solar')),
	%parte de las lunas
	new(Dialog_lunas, dialog('Consultar lunas', size(400, 400))),
	send(Dialog_lunas, append, new(Combo, menu('lunas de', cycle))),
	send(Dialog_lunas, append, new(Lista_lunas, list_browser)),
	send(Combo, append, menu_item('-Seleccione el planeta-',
				      message(Lista_lunas, clear))),
	send(Lista_lunas, right_side, Combo?right_side),
	forall(planeta(Planet, _, _, _),
	       send(Combo, append,
		    menu_item(Planet, and(message(Lista_lunas, clear),
					  message(@prolog,
						  agregar_lunas,
						  @arg1,
						  Lista_lunas
						 )
					 )
			     )
		   )
	      ),
	%boton de rotacion
	send(Dialog_lunas, append,
	     button(mostrar_rotacion,
		    message(@prolog,
			    consultar_traslacion,
			    Combo?selection))),


	%parte de las masas
	new(Dialog_masas, dialog('Consultar masas', size(640, 480))),
	new(Lista_masas, list_browser),
	send(Dialog_masas, append, new(Checks, menu(planetas_a_comparar, toggle))),
	send(Checks, layout, vertical),
	send(Dialog_masas, append, Lista_masas, right),
	forall(planeta(Planet, _, _, _),
	       send(Checks, append,
		    menu_item(Planet, and(message(Lista_masas, clear),
					  message(@receiver?selection,
					  for_all,
					  message(@prolog,
						  agregar_masa_planeta, @arg1, Lista_masas)))))),
	send(Dialog_masas, append,
	     button(comparar_masas,
				message(@prolog,
					mostrar_cmp_masas,
					Checks?selection))),

	send(Frame, append, Dialog_lunas),
	send(Frame, append, Dialog_masas),
	send(Dialog_masas, right(Dialog_lunas)),

	send(Frame, open_centered).


%Muestra la lista de Planetas: chain
mostrar_cmp_masas(Planetas):-
	new(Dia, dialog('Comparacion de masas')),
	new(Fondo, bitmap(resource(fondo))),
	send(Dia, background, Fondo),
	chain_list(Planetas, Lista),
	forall(member(X, Lista),
	       (
		   planeta(X, _, Masa, _),
		   zoom(X, Masa+20, Zoomed),
		   new(Planet, bitmap(Zoomed)),
		   send(Dia, append, Planet, right),
		   new(_, constraint(Planet, Dia, identity(center_y)))
	       )
	),
	send(Dia, open_centered).

%Agrega la masa de Planeta a la Lista: list_browser
agregar_masa_planeta(Planeta, Lista) :-
	planeta(Planeta, _, Masa, _),
	atomic_list_concat([Planeta, ': ', Masa], Etiqueta),
	send(Lista, append, Etiqueta).

%Agrega las lunas del Planeta a la Lista: list_browser
agregar_lunas(Planeta, Lista) :-
	send(Lista, clear),
	satelites(Planeta, Satelites),
	(   Satelites == []
	->  send_list(Lista, append, "No tiene lunas")
	;   send_list(Lista, append, Satelites)
	).

%Escala las imagenes al comparar masas
zoom(Im, Factor, Magnified) :-
	new(Bitmap, image(resource(Im))),
	Xfactor is Factor,
	NW is round(1 * Xfactor),
	NH is round(1 * Xfactor),
	get(Bitmap, scale, size(NW, NH), Magnified).



:- oneforall.















