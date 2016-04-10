function [ salida ] = Delta( tabla )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
tam= size(tabla);
ant= tabla(2)- tabla(1);
for m=1 : tam(1)-1
    salida=  tabla(m+1) -tabla(m);
    if ant==salida
        ant= salida;
    else
        salida=0;
        break;
    end
end


end

