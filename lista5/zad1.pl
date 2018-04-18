skaner(Strumien, Tokeny):-
    get_char(Strumien, C),
    skaner(Strumien, Tokeny, C).

skaner(_, [], end_of_file).
skaner(Strumien, Tokeny, ZnakPoczatkowy):- 
    char_type(ZnakPoczatkowy, space),
    get_char(Strumien, C), !,
    skaner(Strumien, Tokeny, C).

skaner(Strumien, [int(Liczba)|Tokeny], ZnakPoczatkowy):-
    char_type(ZnakPoczatkowy, digit),
    wydzielLiczbe(Strumien, StringLiczba, ZnakPoczatkowy, KolejnyZnak),
    atom_number(StringLiczba, Liczba),
    skaner(Strumien, Tokeny, KolejnyZnak).
skaner(Strumien, [id(ID)|Tokeny], ZnakPoczatkowy):-
    char_type(ZnakPoczatkowy, upper),
    wydzielID(Strumien, ID, ZnakPoczatkowy, KolejnyZnak),
    skaner(Strumien, Tokeny, KolejnyZnak).
skaner(Strumien, [key(SlowoKluczowe)|Tokeny], ZnakPoczatkowy):-
    char_type(ZnakPoczatkowy, lower),
    wydzielSlowoKluczowe(Strumien, PotencjalneSlowoKluczowe, ZnakPoczatkowy, KolejnyZnak), !,
    poprawneSlowoKluczowe(PotencjalneSlowoKluczowe),
    atom_string(SlowoKluczowe, PotencjalneSlowoKluczowe),
    skaner(Strumien, Tokeny, KolejnyZnak).
skaner(Strumien, [sep(Separator)|Tokeny], ZnakPoczatkowy):-
    znak_specjalny(ZnakPoczatkowy),
    wydzielSeparator(Strumien, PotencjalnySeparator, ZnakPoczatkowy, KolejnyZnak), !,
    poprawnySeparator(PotencjalnySeparator),
    atom_string(Separator, PotencjalnySeparator),
    skaner(Strumien, Tokeny, KolejnyZnak).

poprawneSlowoKluczowe('read').
poprawneSlowoKluczowe('write').
poprawneSlowoKluczowe('if').
poprawneSlowoKluczowe('then').
poprawneSlowoKluczowe('else').
poprawneSlowoKluczowe('fi').
poprawneSlowoKluczowe('while').
poprawneSlowoKluczowe('do').
poprawneSlowoKluczowe('od').
poprawneSlowoKluczowe('and').
poprawneSlowoKluczowe('or').
poprawneSlowoKluczowe('mod').

poprawnySeparator(';').
poprawnySeparator('+').
poprawnySeparator('-').
poprawnySeparator('*').
poprawnySeparator('/').
poprawnySeparator('(').
poprawnySeparator(')').
poprawnySeparator('<').
poprawnySeparator('>').
poprawnySeparator('=<').
poprawnySeparator('>=').
poprawnySeparator(':=').
poprawnySeparator('=').
poprawnySeparator('/=').

wydzielLiczbe(_, '', ZnakPoczatkowy, ZnakPoczatkowy):-
    \+char_type(ZnakPoczatkowy, digit).
wydzielLiczbe(Strumien, Liczba, ZnakPoczatkowy, KolejnyZnak):-
    get_char(Strumien, C), !,
    wydzielLiczbe(Strumien, Liczba2, C, KolejnyZnak),
    atom_concat(ZnakPoczatkowy, Liczba2, Liczba).

wydzielID(_, '', ZnakPoczatkowy, ZnakPoczatkowy):-
    \+char_type(ZnakPoczatkowy, upper).
wydzielID(Strumien, ID, ZnakPoczatkowy, KolejnyZnak):-
    get_char(Strumien, C), !,
    wydzielID(Strumien, ID2, C, KolejnyZnak),
    atom_concat(ZnakPoczatkowy, ID2, ID).

wydzielSlowoKluczowe(_, '', ZnakPoczatkowy, ZnakPoczatkowy):-
    \+char_type(ZnakPoczatkowy, lower).
wydzielSlowoKluczowe(Strumien, SlowoKluczowe, ZnakPoczatkowy, KolejnyZnak):-
    get_char(Strumien, C), !,
    wydzielSlowoKluczowe(Strumien, SlowoKluczowe2, C, KolejnyZnak),
    atom_concat(ZnakPoczatkowy, SlowoKluczowe2, SlowoKluczowe).

wydzielSeparator(_, '', ZnakPoczatkowy, ZnakPoczatkowy):-
    \+znak_specjalny(ZnakPoczatkowy).
wydzielSeparator(Strumien, Separator, ZnakPoczatkowy, KolejnyZnak):-
    get_char(Strumien, C), !,
    wydzielSeparator(Strumien, Separator2, C, KolejnyZnak),
    atom_concat(ZnakPoczatkowy, Separator2, Separator).

znak_specjalny(';').
znak_specjalny('+').
znak_specjalny('-').
znak_specjalny('*').
znak_specjalny('/').
znak_specjalny('(').
znak_specjalny(')').
znak_specjalny('<').
znak_specjalny('>').
znak_specjalny('=').
znak_specjalny(':').