maximum([X|L],M):-
    maximum(L,X,M).
maximum([],M,M).
maximum([X|L],M1,M):-
    (X>M1-> M2 is X; M2 is M1),
    maximum(L,M2,M).

jestTablicaMaxow([], [], _).
jestTablicaMaxow([X|Lista], [MaxDlaX|Maxy], BiezacaSuma):-
    Y is BiezacaSuma+X,
    (Y<0 ->
        NowaSuma = X;
        NowaSuma = Y
    ),
    MaxDlaX=NowaSuma,
    jestTablicaMaxow(Lista, Maxy, NowaSuma).

max_sum(Lista, Suma):-
    jestTablicaMaxow(Lista, Maxy, 0),
    maximum(Maxy, Suma).