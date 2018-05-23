:-consult('zad1.pl').

split(IN,OUT1,OUT2):-split(IN,OUT1,OUT2,1).
split(IN,OUT1,OUT2,1):-
	freeze(IN,(
		  IN=[]->OUT1=[],OUT2=[];
		  IN=[H|T],OUT1=[H|NOUT1],split(T,NOUT1,OUT2,2))).
split(IN,OUT1,OUT2,2):-
	freeze(IN,(
		   IN=[]->OUT1=[],OUT2=[];
		   IN=[H|T],OUT2=[H|NOUT2],split(T,OUT1,NOUT2,1))).

merge_sort(In,OUT):-freeze(In, merge_sort2(In,OUT)).

merge_sort2([],[]).
merge_sort2([H|T],OUT):-freeze(T,
			       (T=[])->(OUT=[H]);
			       (split([H|T],OUT1,OUT2),
				merge_sort(OUT1,OUT11),
				merge_sort(OUT2,OUT22),
				merge(OUT11,OUT22,OUT))).


