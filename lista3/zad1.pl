suma(0,[]).
suma(Suma, [X|Lista]) :-
    suma(Suma2, Lista),
    Suma is X+Suma2.
srednia(0,[]).
srednia(Srednia, Lista) :- 
    suma(Suma, Lista),
    length(Lista, Dlugosc),
    Srednia is Suma/Dlugosc.
wariancja(Wariancja, Lista) :-
    srednia(Srednia, Lista),
    length(Lista, Dlugosc),
    sumaWariancyjna(Suma, Lista, Srednia),
    Wariancja is Suma/Dlugosc.
sumaWariancyjna(0,[], _).
sumaWariancyjna(Suma, [X|Lista], Srednia):-
    sumaWariancyjna(Suma2, Lista, Srednia),
    Suma is Suma2+(X-Srednia)*(X-Srednia).
