merge(IN1,IN2,OUT):-
	freeze(IN1,freeze(IN2,merge2(IN1,IN2,OUT))).

merge2([],IN2,IN2):-!.
merge2(IN1,[],IN1):-!.
merge2([H1|T1], [H2|T2], OUT):-
    (H1=<H2->
        OUT=[H1|NOUT], merge(T1,[H2|T2],NOUT);
        OUT=[H2|NOUT], merge([H1|T1],T2,NOUT)
    ).