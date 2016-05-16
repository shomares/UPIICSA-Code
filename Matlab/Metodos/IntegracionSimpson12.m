function [ salida ] = IntegracionSimpson12(pol,limS, limI, n)
    if(mod(n,2)==0)
        matriz= GetFuncionTabular(pol,limS, limI, n);
        h= (limS-limI)/n;
        tam= size(matriz);
        resultado= matriz(1,2) + matriz(tam(1),2);
        for n=2:tam(1)-1
            if mod(n,2)==0 
                resultado= resultado + 4 *  matriz(n,2);
            else
                resultado= resultado + 2 * matriz(n,2);
            end
        end
    else
        %Error
    end

    salida= (1 / 3) * h * resultado;

end

