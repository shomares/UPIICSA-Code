function [ salida] = GetFuncionTabular(  pol,limS, limI, n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
matriz= zeros(n+1,2);
h= (limS- limI)/n;
x=0;
i=1;
j=0;

while x<limS
    x=  limI + j*h;
    matriz(i,1) = x; 
    matriz(i,2)= pol( x);
    j= j +1;
    i=i+1;
end
salida= matriz;

end

