function [ salida ] = DiferenciaY( tabla, grado)
    tablaAn= tabla(:,2:2);
    TAM= size(tablaAn);
    for n=1: grado
       tam= size(tablaAn);
        m= tam(1);
        tablaN= zeros( TAM(1) - n, 1  );
        while m>1
            res=tablaAn(m)-tablaAn(m-1);
            tablaN(m-1)= res;
            m= m-1;
        end
          tablaAn=tablaN; 
    end
    salida= tablaAn(1);
end

