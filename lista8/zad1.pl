:-use_module(library(sgml)).
:-use_module(library(xpath)).
:-use_module(library(url)).

serwery(Plik,Serwery):-
	load_html(Plik,DOM,[]),
	findall(URL,znajdz_serwer(DOM,URL),URLS),
	setof(X,member(X,URLS),Serwery).

znajdz_serwer(DOM,Serwer):-
	xpath(DOM,//a(@href),HREF),
	parse_url(HREF,'http://localhost/',URL),
	URL=[protocol(http),host(Serwer),_].
