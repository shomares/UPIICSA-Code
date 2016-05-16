function [ salida ] = InterpolacionSimple( tabla, valor)
% InterpolacionSimple Calcula la interpolacion a
% partir de dos datos cercanos al valor dentro de una tabla
    
  syms x;
  rango= GetRango(tabla, valor);
  
  %Formo la ecuacion
  eqn= zeros(2,2);
  sol= zeros(2,1);
  
  eqn(1,1) = tabla(rango(1,1), 1);
  eqn(1,2) = 1;
  
  eqn(2,1) = tabla(rango(1,2), 1);
  eqn(2,2) = 1;
  
  sol(1,1) = tabla(rango(1,1), 2);
  sol(2,1) = tabla(rango(1,2), 2);
 
  literal= linsolve(eqn, sol);
 
  %Calculo a partir de las literales
  salida= literal(1,1)* x + literal(2,1);
end

