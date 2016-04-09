function[salida]= InterpolacionMinimosCuadrados(tabla, grado)
    syms x;
   
    eqn= zeros(grado);
    sol= zeros(grado,1);
    tam= size(tabla);
    salida=0;
    %Primero formamos las ecuaciones
    %Luego lo demas
    m= grado;
    refGrado=0;
    while m>0
        gradoPol= refGrado;
        n= grado;
        while n>0
            if n==grado
                refGrado= gradoPol+1;
            end
            if gradoPol>0
                eqn(m,n)= Sumatoria(tabla, gradoPol);
            else
                eqn(m,n)= tam(1);
            end
           gradoPol= gradoPol+1;
           n=n-1; 
        end
        m= m-1;
    end
    m= grado;
    while m>0
           sol((grado-m) +1 ,1)= SumatoriaXY(tabla,m-1);
           m=m-1;
    end
    
    solv= linsolve(eqn,sol);
    m= grado;
    while m>0
        salida= salida+ (solv( grado-m +1 )*  (x^(m-1)));
        m= m-1;
    end
     
end