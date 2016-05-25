function [ salida ] = AnalisisAutoInterpolacion(MatrizValorReal, error)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
tam= size(MatrizValorReal);
grado= tam(1)+1;
medias= zeros(0);

if grado>20
    grado=10;
end

if(tam(1)<10)
    resultado= InterpolacionLagrange(MatrizValorReal);
else
    %Vamos a usar la Interpolacion por minimos cuadrados
    %Sin saber el grado de la funcion
   
    izq=0;der=grado;
    i=2; j=0;
    while(izq<=der)
        pivote= (der+izq)/2;
        pivote= pivote - mod(pivote,1);
        if pivote==0
            pivote=1;
        end
        resultado= InterpolacionMinimosCuadrados(MatrizValorReal, pivote);
        analisis= AnalisisFuncion(MatrizValorReal, resultado);       
        if(analisis(2)<=error)
            break;
        else
            if i==2
                soluciones=[resultado;resultado];
            else
                 soluciones(i,1)= resultado; 
            end
            medias(i-1)= analisis(2);
            izq=pivote+1;
            i= i+1;
            j=pivote;
        end
    end
    
    if  (j==grado)
        %Llego al final
        i=1;
        menor= min(medias);
        while(i<=grado)
           if(menor==medias(i))
               resultado= soluciones(i,1);
               break;
           end 
           i= i+1;
        end
    end
    
end
salida= resultado;
end
