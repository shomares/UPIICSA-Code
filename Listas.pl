vocales([a,e,i,o,u]).
numero([1,2,3,4,5]).
animales([leon,tigre,lince,puma]).
%operaciones
elimina(X,[X|T],T).
elimina(X,[H|T],[H|T1]):-elimina(X,T,T1).
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]) :- concatenar(L1,L2,L3).
longitud([],0).
longitud([_|T],N):-longitud(T,N0),N is N0+1.
pertenece(X,[X|_]):-!.
pertenece(X,[_|R]):-pertenece(X,R).
ultimo([X],X).
ultimo([_|Y],X):-ultimo(Y,X).
reverse([X|X5],Y5,Z5):-reverse(X5,[X|Y5],Z5).
reverse([],Y5,Y5).
palindrome(X5):-reverse(X5,[],X5).
inver(L1,L2):-inver(L1,L2,[]).
inver([],L,L).
inver([H|T],L,S):-inver(T,L,[H|S]).

