function [ salida ] = IntegracionSimpson38(pol,limS, limI, n)
    
    if(mod(n,3)==0)
        matriz= GetFuncionTabular(pol,limS, limI, n);
        h= (limS-limI)/n;
        tam= size(matriz);
        i= 0;
        resultado= matriz(1,2) + matriz(tam(1),2);
        for n=2:tam(1)-1
            if i==2 
                resultado= resultado + 2 *  matriz(n,2);
                i=0;
            else
                resultado= resultado + 3 * matriz(n,2);
                i=i+1;
            end
        end
         salida= (3 / 8) * h * resultado;
    else
        salida= 0;
    end

   
end

