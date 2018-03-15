jednokrotnie(X,L) :- member(X,L), select(X, L, ListWithoutX), \+member(X,ListWithoutX).

dwukrotnie(X,L) :- member(X,L), select(X, L, ListWithoutX), jednokrotnie(X, ListWithoutX).