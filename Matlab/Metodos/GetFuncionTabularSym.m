function [ salida ] = GetFuncionTabularSym(Funcion,MatrizValorReal )
tam= size(MatrizValorReal);
resultado= zeros(tam(1),2);
for i=1: tam(1)
   resultado(i,1)= MatrizValorReal(i,1);  
   resultado(i,2)= eval(subs(Funcion,MatrizValorReal(i,1)));
end
salida=resultado;

end

