%planetas del sistema solar, clasificacion del planeta, masa con
% respecto a la tierra,distancia ordinal al sol
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

miembro(X,[X|_]).
miembro(X,[_|L]):-miembro(X,L).

longitud([],0).
longitud([_|Xs],L):-longitud(Xs,N), L is N+1.


% Consultas
lunas(Planeta):-satelites(Planeta,L), write(L).








