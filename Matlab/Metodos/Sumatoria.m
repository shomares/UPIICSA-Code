function[salida]= Sumatoria(tabla, grado)
salida=0;
tam= size(tabla);
    for m=1: tam(1)
        salida= salida+ power(tabla(m,1), grado);
    end
end