betterSelect(X, L1, L2, Index):- betterSelect(X,L1,L2,1,Index).
betterSelect(X, [X|L], L, Index, Index).
betterSelect(X, [Y|L1], [Y|L2], A, Index):-
    A1 is A+1,
    betterSelect(X, L1, L2, A1, Index).

pustyWiersz(0):-write("+\n").
pustyWiersz(N):-
    write("+-----"),
    N2 is N-1,
    pustyWiersz(N2).

czarne(Lista, _, Kolumna):-
    Kolumna2 is Kolumna-1,
    length(Lista, Kolumna2),
    write("|\n").
czarne(Lista, Wiersz, Kolumna):-
    betterSelect(Wiersz, Lista, _, Kolumna),
    write("|:###:"),
    Kolumna2 is Kolumna+1,
    biale(Lista, Wiersz, Kolumna2).
czarne(Lista, Wiersz, Kolumna):-
    write("|:::::"),
    Kolumna2 is Kolumna+1,
    biale(Lista, Wiersz, Kolumna2).

biale(Lista, _, Kolumna):-
    Kolumna2 is Kolumna-1,
    length(Lista, Kolumna2),
    write("|\n").
biale(Lista, Wiersz, Kolumna):-
    betterSelect(Wiersz, Lista, _, Kolumna),
    write("| ### "),
    Kolumna2 is Kolumna+1,
    czarne(Lista, Wiersz, Kolumna2).
biale(Lista, Wiersz, Kolumna):-
    write("|     "),
    Kolumna2 is Kolumna+1,
    czarne(Lista, Wiersz, Kolumna2).

board(_, 0).
board(Lista, Wiersz):-
    0 is Wiersz mod 2,
    length(Lista, Dlugosc),
    biale(Lista, Wiersz, 1),
    biale(Lista, Wiersz, 1),
    pustyWiersz(Dlugosc),
    Wiersz2 is Wiersz-1,
    board(Lista,Wiersz2).
board(Lista, Wiersz):-
    1 is Wiersz mod 2,
    length(Lista, Dlugosc),
    czarne(Lista, Wiersz, 1),
    czarne(Lista, Wiersz, 1),
    pustyWiersz(Dlugosc),
    Wiersz2 is Wiersz-1,
    board(Lista,Wiersz2).

board(Lista):-
    length(Lista, Dlugosc),
    pustyWiersz(Dlugosc),
    board(Lista, Dlugosc).

zla(X):-
    append(_, [Wi|L1], X),
    append(L2, [Wj|_], L1),
    length(L2, K),
    abs(Wi-Wj) =:= K + 1.

dobra(X):- \+zla(X).

hetmany(N, P):-
    numlist(1, N, L),
    permutation(L, P),
    dobra(P).