/*left_of(rower, aparat).
left_of(olowek, klepsydra).
left_of(olowek, motyl).
left_of(motyl, ryba).
above(rower, olowek).
above(aparat, motyl).*/
left_of(3,4).
left_of(0,1).
above(1,2).
above(2,3).
above(4,5).
above(5,6).

right_of(Object1, Object2) :- left_of(Object2, Object1).
below(Object1, Object2) :- above(Object2, Object1).

recursive_left_of(Object1, Object2) :- left_of(Object1, Object2); (left_of(Object1, X), recursive_left_of(X, Object2)).
recursive_above(Object1, Object2) :- above(Object1, Object2); (above(Object1, X), recursive_above(X, Object2)).
higher(Object1, Object2) :- (X=Object1; recursive_left_of(Object1, X); recursive_left_of(X, Object1)), above(X, Y),
    (Y=Object2; recursive_left_of(Y, Object2); recursive_left_of(Object2, Y); higher(Y, Object2)).