function [ salida ] = IntegracionTrapecio( matriz )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
h= matriz(2,1) -matriz(1,1); 
tam= size(matriz);
suma= matriz(1,2)+ matriz(tam(1), 2);
for m=2: tam(1)-1
    suma=suma+ 2*matriz(m,2);
end
salida=(h/2)* suma;
end

