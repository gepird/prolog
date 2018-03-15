prime(LO, HI, N) :- N>=2, between(LO, HI, N), \+ (X is floor(sqrt(N)), between(2,X,D), (N mod D)=:=0).
