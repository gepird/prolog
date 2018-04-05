istnieje(A, [A, _, _, _, _]).
istnieje(A, [_, A, _, _, _]).
istnieje(A, [_, _, A, _, _]).
istnieje(A, [_, _, _, A, _]).
istnieje(A, [_, _, _, _, A]).

polewej(L, R, [L, R, _, _, _]).
polewej(L, R, [_, L, R, _, _]).
polewej(L, R, [_, _, L, R, _]).
polewej(L, R, [_, _, _, L, R]).

srodek(A, [_, _, A, _, _]).

pierwszy(A, [A, _, _, _, _]).

obok(A, B, [B, A, _, _, _]).
obok(A, B, [_, B, A, _, _]).
obok(A, B, [_, _, B, A, _]).
obok(A, B, [_, _, _, B, A]).
obok(A, B, [A, B, _, _, _]).
obok(A, B, [_, A, B, _, _]).
obok(A, B, [_, _, A, B, _]).
obok(A, B, [_, _, _, A, B]).

%dom(kolor, narodowosc, zwierze, napoj, papierosy)

einstein(Domy):-
    pierwszy(dom(_, norweg, _, _, _), Domy),
    istnieje(dom(czerwony, anglik, _, _, _), Domy),
    polewej(dom(zielony, _, _, _, _), dom(bialy, _, _, _, _), Domy),
    istnieje(dom(_, dunczyk, _, herbata, _), Domy),
    obok(dom(_, _, _, _, light), dom(_, _, kot, _, _), Domy),
    istnieje(dom(zolty, _, _, _, cygara), Domy),
    istnieje(dom(_, niemiec, _, _, fajka), Domy),
    srodek(dom(_, _, _, mleko, _), Domy),
    obok(dom(_, _, _, _, light), dom(_, _, _, woda, _), Domy),
    istnieje(dom(_, _, ptaki, _, bezfiltra), Domy),
    istnieje(dom(_, szwed, psy, _, _), Domy),
    obok(dom(_, norweg, _, _, _), dom(niebieski, _, _, _, _), Domy),
    obok(dom(_, _, konie, _, _), dom(zolty, _, _, _, _), Domy),
    istnieje(dom(_, _, _, piwo, mentolowe), Domy),
    istnieje(dom(zielony, _, _, kawa, _), Domy),
    istnieje(dom(_, _, rybki, _, _), Domy).

rybki(Who):-
    einstein(Domy),
    member(dom(_, Who, rybki, _, _), Domy).