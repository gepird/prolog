le(1,1).
le(2,2).
le(3,3).
le(4,4).
le(1,2).
le(1,3).
le(1,4).
le(2,3).
le(2,4).

maksymalny(X) :- le(X,X), \+ (le(X,Y), Y\=X).
minimalny(X) :- le(X,X), \+ (le(Y,X), Y\=X).
najwiekszy(X) :- le(X,X), \+ ((le(Y,Y),\+(le(Y,X)))).
najmniejszy(X) :- le(X,X), \+ ((le(Y,Y),\+(le(X,Y)))).