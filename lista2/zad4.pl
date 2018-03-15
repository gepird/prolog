ma(ala, kot).
ma(ala, pies).
daje(1,ala,kot,jacek).
daje(2,jacek,kot,ala).
daje(7,ala,kot,jacek).
daje(11,jacek,kot,ala).

ma(Kiedy,Kto,Co):- ma(Kto,Co),\+  (daje(_,Kto,Co,_) ), between(0,inf,Kiedy).
ma(Kiedy,Kto,Co):- ma(Kto,Co), daje(X,Kto,Co,_),\+ (daje(Y,Kto,Co,_),Y<X),between(0,X,Kiedy).
ma(Kiedy, Kto, Co):- daje(X,_,Co,Kto),daje(Z,Kto,Co,_),Z>X,X_1 is X+1,\+ (daje(Y,Kto,Co,_),Y>=X_1,Y<Z),between(X_1, Z, Kiedy). %dostaje i oddaje   
ma(Kiedy, Kto, Co):- daje(X,_,Co,Kto),X_1 is X+1,\+ (daje(Y,Kto,Co,_),Y>=X_1),between(X_1, inf, Kiedy). %dostaje i nie oddaje