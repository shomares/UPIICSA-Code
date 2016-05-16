function [ salida] = InterpolacionSimpleCompeta(tabla)
%Interpolacion Simple Completa
%Calcula una estimado usando una interpolacion simple
%Utilizando todos los valores
    syms x;
    salida=0;
    tamano= size(tabla);
    eqn= zeros(tamano(1));
    sol= zeros(tamano(1), 1);
    for m = 1:tamano(1)
        for n= 1: tamano(1)
            eqn(m,n)= power(tabla(m,1),tamano(1)-n);
        end
    end
    
    for  m= 1:tamano(1)
        sol(m,1)= tabla(m,2);
    end
    
    solv= linsolve( eqn, sol);
    
    for m=1: size(solv)
        salida= salida+ (solv(m)*  x^(tamano(1)-m));
    end
    
    %k= 1 :1:5;
    
    %plot(k, double(subs(salida,x,k)))
    
    %explot(salida);
    
    
end

