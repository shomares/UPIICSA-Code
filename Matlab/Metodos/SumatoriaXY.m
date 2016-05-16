function[salida]= SumatoriaXY(tabla, grado)
    tam= size(tabla);
    salida=0;
    for m=1: tam
        salida= salida+ (power(tabla(m,1), grado) * tabla(m,2));
    end
end