le(1,1).
le(2,2).
le(3,3).
le(4,4).
le(1,2).
le(1,3).
le(1,4).
le(2,3).
le(2,4).

zwrotny :- \+ ((le(X,_); le(_,X)), \+ (le(X,X))).
przechodni :- \+ ((le(X,Y), le(Y,Z)), \+ (le(X,Z))).
slabo_antysymetryczny :- \+ ((le(X,Y), le(Y,X)), X\=Y).

czesciowy_porzadek :- zwrotny, przechodni, slabo_antysymetryczny.