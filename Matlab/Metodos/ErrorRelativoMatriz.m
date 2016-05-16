function [ salida ] = ErrorRelativoMatriz( MatrizValorReal, MatrizAproximacion)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
t= size(MatrizValorReal);
resultado= zeros(t(1),1);
for i=1 : t(1)
    resultado(i)= ErrorRelativo( MatrizValorReal(i,2), MatrizAproximacion(i,2));
end
salida= resultado;
end
