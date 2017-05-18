%Super powers%
:-dynamic superpower/2.
:-dynamic team/2.
:-dynamic villain/1.
:-dynamic hero/1.
:-dynamic identity/2.

%Secret Identities%
identity(ironman, 'Tony Stark').
identity(spiderman, 'Peter Parker').
identity(captainAmerica, 'Steve Rogers').
identity(hulk, 'Bruce Banner').
identity(blackwidow, 'Natasha Romanova').
identity(hawkeye, 'Clint Barton').
identity(thor, 'Thor Son of Odin').
identity(starlord, 'Peter Quill').
identity(warmachine, 'James Rhodes').
identity(quicksilver, 'Pietro Maximof').
identity(scarletwitch, 'Wanda Maximof').
identity(wintersoldier, 'Bucky Barnes').
identity(ultron, 'Ultron Pym').
identity(_, unknown).
%Secret Identities%

superpower(ironman,[being_rich, smart, super_armor, flight], [1,2,4,2]) .
superpower(hulk,[super_strength, bulletproof], [5,5]).
superpower(thor,[god, lightning, flight], [5,4,2]).
superpower(starlord, [half_alien], [3]).
superpower(hawkeye, [trickshot], [2]).
superpower(captainamerica, [super_soldier, vibranium_shield], [3,4]).
superpower(magneto, [magnetism, electricity, bulletproof, flight], [5,5,5, 2]).
superpower(quicksilver, [superhuman_speed], [4]).
superpower(scarletwitch, [molecular_disturbances, alter_reality, force_field], [4,5,3]).
superpower(blackwidow, [slow_aging, augmented_inmune_system, physical_durability, super_strength, martial_arts], [3,3,2,5,2]).
superpower(wolverine, [regeneration, superhuman_acute_senses, bone_claws, adamantium_skeleton, martial_arts], [4,3,4,5]).
superpower(spiderman, [spider_senses, super_strength], [3,5]).
superpower(warmachine, [super_armor], [5]).
superpower(charlesxavier, [telepathy, mind_control], [3, 3]).
superpower(ultron, [super_strength, superhuman_speed, physical_durability, superhuman_acute_senses, mind_control, electricity, magnetism, regeneration, super_intelligence, adamantium_armor], [5, 4, 2, 3, 3, 5, 5, 4, 5, 5]).
superpower(loki, [god, bulletproof, super_strength, superhuman_speed, physical_durability, energy_manipulation, flight, mind_control, teleportation], [5, 5, 5, 4, 2, 5, 2, 3, 2]).
superpower(redskull, [super_strength, superhuman_speed, physical_durability, superhuman_acute_senses, super_intelligence, super_soldier, martial_arts, telepathy, dust_of_death], [5, 4, 2, 3, 5, 3, 5, 3, 3]) .
superpower(thanos, [super_strength, superhuman_speed, physical_durability, superhuman_acute_senses, energy_manipulation, telepathy, telekenisis, matter_manipulation, flight, super_intelligence, force_field], [5, 4, 2, 3, 5, 3, 3, 5, 2, 5, 3]).
superpower(wintersoldier, [super_strength, superhuman_acute_senses, electricity, extended_reach, super_soldier, martial_arts], [5, 3, 5, 2, 3, 5]).
superpower(ronan, [super_strength, superhuman_speed, physical_durability, superhuman_acute_senses, super_armor, universal_weapon, super_soldier], [5, 4, 2, 3, 4, 5, 3]) .
superpower(_, unkown, unkown).
%Super powers%
%Hero v Villain%

villain(ultron).
villain(loki).
villain(redskull).
villain(thanos).
villain(wintersoldier).
villain(ronan).
villain(themandarin).
villain(magneto).
hero(ironman).
hero(spiderman).
hero(captainamerica).
hero(hulk).
hero(blackwidow).
hero(hawkeye).
hero(thor).
hero(starlord).
hero(warmachine).
hero(quicksilver).
hero(scarletwitch).
hero(wolverine).
hero(charlesxavier).
hero(gamora).
hero(groot).
hero(mrfantastic).
hero(thething).
hero(invisibleWoman).
hero(vision).
hero(djidjelly).
%Hero v Villain%
%Teams%
team(avengers, [captainamerica, blackwidow, hulk, ironman, hawkeye, thor, wolverine, vision, spiderman, spiderwoman, redhulk, thething, quicktilver, scarletwitch]).
team(fFour, [mrfantastic, thething, invisiblewoman, thehumantorch]).
team(guardian, [groot, admawarlock, drax, gamora, rocketracoon, starlord, mantis, majorvictory, bug, jackflag, cosmo, moondreagon]).
team(mutantForce, [magneto, burner, lifter, mandrill, peeper, shocker, slither, mystic]).
team(xMen, [wolverine, storm, charlesxavier, cyclops, marvelgirl, beast, iceman, sentinel, colossus]).
%Doesnt work at present form%
independent(X) :- hero(X), team(_,  L), not(member(X, L)), !.
independent(X) :- villain(X), team(_, L), not(member(X, L)), !.
%Sirve solo si conoces a todos los carsacteres%
independent2(X) :- hero(X), team(_, L), member(X, L), !, fail.
independent2(X) :- villain(X), team(_, L), member(X, L), !, fail.
independent2(_).
whatteam(X, Team) :- team(Team, L), member(X, L).
%Team%
%Character Strength%
sum([X | []], X):-!.
sum([X | L], R1) :- sum(L, R2), R1 is X + R2.
power(X, Y):- superpower(X, _, Pow), sum(Pow, Y).
auxilary([], 0):-!.
auxilary([X | L], Res) :- level(X, N1), auxilary(L, N2), Res is N1 + N2.
teampower(X, R1) :- team(X, L1),auxilary(L1, R1).
%Character Strength%
%Character Bios%
character(Per, hero, independent, Level, Power, Abilities) :-
	hero(Per),
	independent(Per),
	level(Per, Level),
	power(Per, Power),
	superpower(Per, Abilities, _), !.
character(Per, hero, Team, Level, Power, Abilities) :-
	hero(Per),
	whatteam(Per, Team),
	level(Per, Level),
	power(Per, Power),
	superpower(Per, Abilities, _), !.
character(Per, villain, independent, Level, Power, Abilities) :-
	villain(Per),
	independent(Per),
	level(Per, Level),
	power(Per, Power),
	superpower(Per, Abilities, _), !.
character(Per, villain , Team, Level, Power, Abilities) :-
	villain(Per),
	findall(X, whatteam(Per, X), Team),
	level(Per, Level),
	power(Per, Power),
	superpower(Per, Abilities, _), !.
character(Per, hero, independent, unknown, unknown, unknown) :-
	hero(Per),
	independent(Per), !.
character(Per, hero, Team, unknown, unknown, unknown) :-
	hero(Per),
	findall(X, whatteam(Per, X), Team), !.
character(Per, villain, independent, unknown, unknown, unknown):-
	villain(Per),
	independent(Per), !.
character(Per, villain, Team, unknown, unknown, unknown) :-
	villain(Per),
	findall(X, whatteam(Per, X), Team), !.
character(_, unknown, unknown, unknown, unknown, unknown).
%No funciona como deberia: corto y fallo%
allbios :- character(Per, Moral, Afiliation, Level, Power, Abilities),
	write('Name: '),
	write(Per), nl,
	write('Moral: '),
	write(Moral), nl,
	write('Afiliation: '),
	write(Afiliation), nl,
	write('Level: '),
	write(Level), nl,
	write('Power: '),
	write(Power), nl,
	write('Abilities: '),
	write(Abilities),
	nl,!, fail.
%Character Bios



%Abilities%

member_(X, [X | _]).
member_(X,[_ | L]):- member_(X, L).

armor(X) :- member_(X, [super_armor, bulletproof, adamantium_armor, force_field]).

element(X) :- member_(X, [vibranium_shield, adamantium_skeleton, universal_weapon]).

energy(X) :- member_(X, [lightning, magnetism, electricity, energy_manipulation]).

health(X) :- member_(X, [slow_aging, augmented_inmune_system, regeneration]).

mutation(X) :- member_(X, [superhuman_speed, superhuman_acute_senses, bone_claws, spider_senses, teleportation]).

psychic(X) :- member_(X, [molecular_disturbances, alter_reality, telepathy, mind_control, super_intelligence, telekenisis, matter_manipulation]).

special(X) :- member_(X, [being_rich, smart, trickshot, martial_arts, flight, dust_of_death, extended_reach]).

strength(X) :- member_(X,[super_strength, super_soldier, physical_durability]).

%type(X) :- member(X, [god, half_alien]).















%Character Level%

level(X, 5) :- superpower(X, L, _),
	member_(P1, L), armor(P1),
	member_(P2, L), mutation(P2),
	member_(P3, L), P3 = regeneration, !.
level(X, 5) :- superpower(X, L, _),
	member_(P1, L), energy(P1),
	member_(P2, L), P2 = god,!.
level(X, 5) :- superpower(X, L, _),
	member_(P1, L), energy(P1),
	member_(P2, L), energy(P2),
	P1 \= P2, !.
level(X, 5) :- superpower(X, L, _),
	member_(P1, L), armor(P1),
	member_(P2, L), strength(P2), !.
level(X, 5) :- superpower(X, L, _),
	member_(P1, L), psychic(P1),
	member_(P2, L), psychic(P2),
	P1 \= P2, !.
%level(X, 4) :- level(X, 5), !, fail.
level(X, 4) :- superpower(X, L, _),
	member_(P1, L), element(P1),
	member_(P2, L), strength(P2), !.
level(X, 4) :- superpower(X, L, _),
	member_(P1, L), armor(P1),
	member_(P2, L), special(P2), !.
level(X, 4) :- superpower(X, L, _),
	member_(P1, L), health(P1),
	member_(P2, L), special(P2), !.
level(X, 4) :- superpower(X, L, _),
	member_(P1, L), mutation(P1),
	member_(P2, L), mutation(P2),
	P1 \= P2, !.
%level(X, 3) :- level(X, 4), !, fail.
level(X, 3) :- superpower(X, L, _),
	member_(P, L), mutation(P), !.
level(X, 3) :- superpower(X, L, _),
	member_(P, L), P = half_alien, !.
level(X, 3) :- superpower(X, L, _),
	member_(P, L), psychic(P), !.
%level(X, 2) :- level(X, 3), !, fail.
level(X, 2) :- superpower(X, L, _),
	member_(P1, L), armor(P1),
	member_(P2, L), special(P2), !.
%level(X, 1) :- level(X, 2), !, fail.
level(_, 1).
%Character Level%
%Category%
category(X, armor):- armor(X), !.
category(X, elemental) :- element(X), !.
category(X, energy) :- energy(X), !.
category(X, health) :- health(X), !.
category(X, mutation) :- mutation(X), !.
category(X, psychic) :- psychic(X), !.
category(X, special) :- special(X), !.
category(X, strength) :- strength(X), !.
category(_, unknown).
%Category%
%Fight%
winsover(X, Y, Y) :- level(X, L1), level(Y, L2), L1 < L2, !.
winsover(X, Y, X) :- level(X, L1), level(Y, L2), L1 > L2, !.
winsover(X, Y, Y) :-
	level(X, L1), level(Y, L2),
	L1 = L2,
	superpower(X, _, P1), sum(P1, R1),
	superpower(Y, _, P2), sum(P2, R2),
	R1 < R2, !.
winsover(X, Y, X) :-
	level(X, L1), level(Y, L2),
	L1 = L2,
	superpower(X, _, P1), sum(P1, R1),
	superpower(Y, _, P2), sum(P2, R2),
	R1 > R2, !.
winsover(_,_, tie).
%Fight%
%Battle%
teamwin(X, Y, X) :- teampower(X, P1), teampower(Y, P2), P1 > P2, !.
teamwin(X, Y, Y) :- teampower(X, P1), teampower(Y, P2), P1 < P2, !.
teamwin(_,_, tie).
%Battle%
%New Superhero%
registrar :-
	write('Introduce el superheroe: '),
	read(Hero),
	write('Introduce su poder: '),
	read(Poder),
	write('Introduce el nivel de su poder: '),
	read(Nivel),
	open('supers.txt', append, ID),
	tell(ID),
	write(ID, 'superPower('),
	write(ID, Hero),
	write(ID, ', \''),
	write(ID, Poder),
	write(ID, '\', '),
	write(ID, Nivel),
	write(ID, ').'),
	told.
%New Superhero%
/* pausa <- detiene la ejecuci¢n del programa hasta que se pulse una tecla */
pausa :- nl,skip(10).
salida:- pausa, halt.
seesuperpowers(Per, Pow) :- superpower(Per, L, _), member(Pow, L).
biografia_graph(Hero):-
	character(Hero,Moral,Afiliation,_,_,_),
	identity(Hero,Name),
	new(P, browser('HERO SECRET FILE')),
	send(P,append,'Identidad secreta:'),
	send(P, append, Name),
	send(P, display, new(bitmap('32x32/books.xpm')), point(100,100)),
        send(P,append,'Moral:'),
	send(P, append, Moral),
	send(P,append,'Afiliacion:'),
	send(P, append, Afiliation),
	send(P, open).
teams_graph(Team):-
	team(Team,Members)
	,new(P,browser('TEAM MEMBERS')),
	send(P,append,'\tEquipo:'),
	send(P,append,Team),
	send(P,append,'\tMembers'),
	send_list(P,append,Members),
	send(P,open).
biografia_graph_stat(Hero):-
	character(Hero,_,_,Level,Power,Abilities),
	identity(Hero,Name),
	whatteam(Hero,Team),
	new(P, browser('HERO SECRET FILE')),
	send(P,append,'Identidad secreta:'),
	send(P, append, Name),
	send(P,append,'Power:'),
	send(P, append,Power),
	send(P,append,'Danger Level:'),
	send(P, append,Level),
	send(P, append,'Team:'),
	send(P, append, Team),
	send(P,append,'Abilities:'),
	send_list(P,append,Abilities),
	send(P, open).
ask_value(Name) :-
        new(D, dialog('Register')),
        send(D, append(new(NameItem, text_item(name)))),
        send(D, append(button(ok, message(D, return, NameItem?selection)))),
        send(D, append(button(cancel, message(D, return, @nil)))),
        send(D, default_button(ok)),
        get(D, confirm, Name),
        free(D),
        Rval \== @nil,
        Name = Rval.
opciones(X):-
(
    (X = bios) ->
        ask_value(Name),biografia_graph(Name);
    (X = equipos) ->
        ask_value(Team),teams_graph(Team);
    (X = stats) ->
        ask_value(Name2),biografia_graph_stat(Name2);
    (X = batallas) ->
	bat_diag(Per1,Per2),wins_message(Per1,Per2);
    (X = assert) ->
        assert_diag(Hero,Identity,Team,Power,HeroOrVillain),
    insertar(Hero,Identity,Team,Power,HeroOrVillain),write('PASO'),exito

).

exito:-!.

bat_diag(A,B) :-
    new(D, dialog('Vamos a ver quien gana!')),
    send(D, append(new(NameItem,   text_item('Personaje1')))),
    send(D, append(new(InstItem,   text_item('Personaje2')))),
    send(D, append(button('Comprobar', message(D, return, '1')))),
    send(D, show(true)),
    get(D, confirm, _Rvalue),
    get(NameItem,selection,A),
    get(InstItem,selection,B),
    free(D).
assert_diag(Hero,Identity,Team,Power,HeroOrVillain) :-
    new(D, dialog('Insert heroe!')),
    send(D, append(new(HeroItem,   text_item('Name')))),
    send(D, append(new(IdentItem,   text_item('Scret Identity')))),
    send(D, append(new(TeamItem,   text_item('Team')))),
    send(D, append(new(PowItem,   text_item('Power')))),
    send(D, append(new(HoVitem,   text_item('Hero or Villan?')))),
    send(D, append(button('Comprobar', message(D, return, '1')))),
    send(D, show(true)),
    get(D, confirm, _Rvalue),
    get(HeroItem,selection,Hero),
    get(IdentItem,selection,Identity),
    get(TeamItem,selection,Team),
    get(PowItem,selection,Power),
    get(HoVitem,selection,HeroOrVillain),
    free(D).
wins_message(Hero,Hero1):-
	winsover(Hero1,Hero,X),
	new(P, browser('Batallas Marvel')),
	send(P,append,'El ganador entre'),
	send(P, append, Hero),
	send(P,append,' y '),
	send(P, append,Hero1),
	send(P,append,'es: '),
	send(P, append,X),
	send(P, open).

insertar(Hero,Identity,Team,Power,HeroOrVillain):-
	(   (HeroOrVillain= hero)->asserta(hero(Hero));
	    (HeroOrVillain= villain)->asserta(villain(Hero))
	),
	(   atom_string(Identity,T),asserta(identity(Hero,T))),
	asserta(team(Team,Hero)),
	asserta(superpower(Hero,Power)).

%------------------------------------------%
%------------------------------------------%
dialog(marvelc,
       [ object        :=
	   Marvelc,
	 parts         :=
	   [ Marvelc := dialog('Marvelc'),
	     Choice  := menu(choice, choice),
	     Aceptar := button(aceptar)
	   ],
	 modifications :=
	   [ Choice  := [ value_font :=
			    @helvetica_roman_18,
			  layout     :=
			    vertical,
			  columns    :=
			    1,
			  alignment  :=
			    right,
			  append     :=
			    [ menu_item(bios, @default, 'Bios', @off, @nil, '\\eb'),
			      menu_item(stats, @default, 'Stats', @off, @nil, '\\es'),
			      menu_item(equipos,
					@default,
					'Equipos',
					@off,
					@nil,
					'\\ee'),
			      menu_item(batallas,
					@default,
					'Batallas',
					@off,
					@nil,
					'\\et'),
			      menu_item(assert, @default, 'Assert', @off, @nil, '\\ea')			    ]
			],
	     Aceptar := [ reference := point(0, 31)
			]
	   ],
	 layout        :=
	   [ right(Choice, Aceptar)
	   ],
	 behaviour     :=
	   [ Aceptar := [ message := message(@prolog,opciones
					     ,
					     Choice?selection)
			]
	   ]
       ]).
menu:-
        make_dialog(D, marvelc),
	send(D,open),
	get(D)
	.
















