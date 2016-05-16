function [ salida ] = AnalisisFuncion( MatrizValorReal, Funcion)
tam= size(MatrizValorReal);
MatrizAproximacion = GetFuncionTabularSym(Funcion,MatrizValorReal ); 
resultado= AnalisisMatriz(MatrizValorReal,MatrizAproximacion);
salida=resultado;
end
