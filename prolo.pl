conoce(juan,maria).
conoce(maria,jose).
conoce(maria,ana).
conoce(pedro,jose).



habla_de(A,B) :- conoce(A,B).
habla_de(A,C) :- conoce(A,B),habla_de(B,C).

