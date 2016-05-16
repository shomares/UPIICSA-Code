function [ salida ] = AnalisisMatriz( MatrizValorReal, MatrizAproximacion)
errorRelativo= ErrorRelativoMatriz(MatrizValorReal, MatrizAproximacion);
resultado= zeros(1,2);
resultado(1,1)= std(errorRelativo);
resultado(1,2)= median(errorRelativo);
salida=resultado;
end
