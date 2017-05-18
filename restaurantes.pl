buena_comida(el_meson).
buena_comida(casa_paco).
caro(el_meson).

razonable(Rest):-caro(Rest),!,fail.
razonable(Rest):-buena_comida(Rest).
