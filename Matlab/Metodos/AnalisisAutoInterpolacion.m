function [ salida ] = AnalisisAutoInterpolacion(MatrizValorReal, error)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
tam= size(MatrizValorReal);
grado= tam(1)+1;

medias= zeros(0);

if(tam(1)<10)
    resultado= InterpolacionLagrange(MatrizValorReal);
else
    %Vamos a usar la Interpolacion por minimos cuadrados
    %Sin saber el grado de la funcion
    i= 2;
    
    while i<=grado
        resultado= InterpolacionMinimosCuadrados(MatrizValorReal, i);
        analisis= AnalisisFuncion(MatrizValorReal, resultado);       
        if(analisis(2)<=error)
            break;
        else
            if i==2
                soluciones=[resultado;resultado];
            else
                 soluciones(i,1)= resultado; 
            end
                
            medias(i)= analisis(2);
        end     
        i=i+1;
    end
    
    if  (i==grado+1)
        %Llego al final
        i=0;
        menor= min(medias);
        while(i<=grado)
           if(menor==medias(i))
               resultado= soluciones(i,1);
           end 
        end
    end
    
end
salida= resultado;
end
