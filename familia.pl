padres(fabio,silvio).
padres(elena,silvio).
padres(fabio,rosalba).
padres(elena,rosalba).
padres(rosalba, jorge).
padres(rosalba,julia).
padres(rosalba,saul).
padres(ivan, saul).
padres(ivan,jorge).
padres(ivan,julia).

padres(fabio, rosalba).
hombre(jorge).
hombre(ivan).
hombre(saul).
hombre(silvio).
mujer(julia).
mujer(rosalba).
mujer(elena).

es_abuelo(X,Z):-padres(X,Y),padres(Y,Z).
abuela(X,Y):-es_abuelo(X,Y),mujer(X).
abuelo(X,Y):-es_abuelo(X,Y),hombre(X).
madre(X,Y):-padres(X,Y),mujer(X).
padre(X,Y):-padres(X,Y),hombre(X).
hermano(X,Y):-padres(P,X),padres(P,Y),hombre(X).
hermana(X,Y):-padres(P,X),padres(P,Y),mujer(X).
sobrina(X,Y):-padres(P,X),hermano(P,Y),mujer(X).
