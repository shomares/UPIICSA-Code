classdef Tabla
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        arreglo
    end
    
    methods
        function salida= SumatoriaXY(obj, grado)
            tam= size(tabla);
            salida=0;
            for m=1: tam
                salida= salida+ (power(obj.arreglo(m,1), grado) * obj.tabla(m,2));
            end
        end
    end
    
end

