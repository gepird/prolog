arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osiagalny(X,Y) :- osiagalny(X,Y,[X]).
osiagalny(X,Y,Visited) :- arc(X,Y); (arc(X,Z), \+member(Z,Visited), append([Z],Visited, NewVisited), osiagalny(Z,Y,NewVisited)).