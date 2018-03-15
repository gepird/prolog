srodkowy(L,X) :- append([_], List1, L), append(List2, [_], List1), (List2=[X]; srodkowy(List2, X)).
