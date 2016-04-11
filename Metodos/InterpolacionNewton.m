function [ salida ] = InterpolacionNewton(tabla)
    syms x;
    delt= Delta(tabla);
    
    if delt>0 
        k= (x- tabla(1,1) )/ delt;
        tam= size(tabla);
        f=0;
        for m=1: tam(1)
            if m==1
                f= tabla(1,2);
            else
                termino= k;
                for n=1: m-2
                    termino= termino *(k -n);
                end
                termino = termino/factorial(m-1);
                termino= (termino) * DiferenciaY(tabla,(m-1));
                f= f + termino;
            end
        end
        salida=simplify(f);
    else
        ME = MException('myComponent:inputError','No valida para newton', delt);
        throw(ME)
    end
end

