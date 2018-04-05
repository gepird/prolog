wyrazenie([X],X,X).
wyrazenie(Lista, Wartosc, Wyrazenie):-
    append(Lewo, Prawo, Lista),
    length(Lewo, DlugoscLewo),
    DlugoscLewo>0,
    length(Prawo, DlugoscPrawo),
    DlugoscPrawo>0,
    wyrazenie(Lewo, WartoscLewo, WyrazenieLewo),
    wyrazenie(Prawo, WartoscPrawo, WyrazeniePrawo),
    zlozenie(WartoscLewo, WyrazenieLewo, WartoscPrawo, WyrazeniePrawo, Wartosc, Wyrazenie).

zlozenie(WartoscLewo, WyrazenieLewo, WartoscPrawo, WyrazeniePrawo, Wartosc, Wyrazenie):-
    Wartosc is WartoscLewo+WartoscPrawo,
    Wyrazenie=WyrazenieLewo+WyrazeniePrawo.

zlozenie(WartoscLewo, WyrazenieLewo, WartoscPrawo, WyrazeniePrawo, Wartosc, Wyrazenie):-
    Wartosc is WartoscLewo*WartoscPrawo,
    Wyrazenie=WyrazenieLewo*WyrazeniePrawo.

zlozenie(WartoscLewo, WyrazenieLewo, WartoscPrawo, WyrazeniePrawo, Wartosc, Wyrazenie):-
    Wartosc is WartoscLewo-WartoscPrawo,
    Wyrazenie=WyrazenieLewo-WyrazeniePrawo.

zlozenie(WartoscLewo, WyrazenieLewo, WartoscPrawo, WyrazeniePrawo, Wartosc, Wyrazenie):-
    WartoscPrawo=\=0,
    Wartosc is WartoscLewo/WartoscPrawo,
    Wyrazenie=WyrazenieLewo/WyrazeniePrawo.