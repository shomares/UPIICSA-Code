empleado('Ortiz').
empleado('Zavala').
empleado('Gonzalez').
mecanografia('Ramos').
mecanografia('Flores').
mecanografia('Sanchez').
gerente('Jimenez').
gerente('Mejia').
gerente('Olguin').
%REGLAS--------------------------%
supervisa(X,Y):- gerente(X),empleado(Y).
supervisa(X,Y):- empleado(X),mecanografia(Y).
supervisa(X,Y):- gerente(X),mecanografia(Y).
