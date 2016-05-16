function [salida]= InterporlacionLagrange(tabla)
%Interpolaacion Lagrange
%Utiliza todos los valores de la tabla
syms x;
salida=0;
    tamano= size(tabla);
    for m=1: tamano(1)
        numerador=1;
        denominador=1;
        for n=1: tamano(1)
            if n~=m 
                numerador= numerador*(x- tabla(n,1)); 
                denominador=denominador * (tabla(m,1)- tabla(n,1)); 
            end
        end
        nuevo=(numerador/denominador) * tabla(m,2);
        salida= salida  + nuevo;
    end
    salida= simplify(salida);
end