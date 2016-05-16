function [ salida ] = GetRango( tabla, valor)
% GetRango Obtiene el rango de una funcion 
% en las variables independientes
salida= zeros(1,2);
tamano= size(tabla);
  for m = 1:tamano(1)
      if valor>=tabla(m)
          salida(1,2)= m+1;
      end
  end
  
  if salida(1,2)>m 
      salida(1,2)= m;
  end
  salida(1,1)= salida(1,2)-1;
end

