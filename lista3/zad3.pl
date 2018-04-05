betterSelect(X, L1, L2, Index):- betterSelect(X,L1,L2,0,Index).
betterSelect(X, [X|L], L, Index, Index).
betterSelect(X, [Y|L1], [Y|L2], A, Index):-
    A1 is A+1,
    betterSelect(X, L1, L2, A1, Index).

even_permutation(Lista, Permutacja):-
    permutacja(Lista, Permutacja, LiczbaInwersji, 0),
    LiczbaInwersji mod 2 =:= 0.

odd_permutation(Lista, Permutacja):-
    permutacja(Lista, Permutacja, LiczbaInwersji, 0),
    LiczbaInwersji mod 2 =:= 1.

permutacja([], [], LiczbaInwersji, LiczbaInwersji).
permutacja(Lista, [X|Permutacja2], LiczbaInwersji, Licznik):-
    betterSelect(X, Lista, Lista2, Index),
    Licznik2 is Licznik+Index,
    permutacja(Lista2, Permutacja2, LiczbaInwersji, Licznik2).