lista([libro(dumas, programacionc, 500, estudio),libro(dumas, mosqueteros, 800, diversion),libro(dumas, otrotitulo, 200, misterio)]).

p([libro(dumas,_,_,_) | _]).
p([_|Cola]):- p(Cola).
