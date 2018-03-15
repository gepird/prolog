ojciec(zbigniew, jan).
ojciec(jan, jas).
ojciec(jan, agata).
ojciec(jan, dzesika).
matka(anna, jas).
matka(anna, agata).
matka(anna, dzesika).
mezczyzna(zbigniew).
mezczyzna(jan).
mezczyzna(jas).
kobieta(anna).
kobieta(agata).
kobieta(dzesika).
rodzic(X,Y) :- matka(X,Y); ojciec(X,Y).

jest_matka(X) :- matka(X,_).
jest_ojcem(X) :- ojciec(X,_).
jest_synem(X) :- mezczyzna(X), rodzic(_,X).
siostra(X,Y) :- kobieta(X), rodzic(R,X), rodzic(R,Y), X\=Y.
dziadek(X,Y) :- mezczyzna(X), rodzic(X,R), rodzic(R, Y).
rodzenstwo(X,Y) :- rodzic(R,X), rodzic(R,Y), X\=Y.