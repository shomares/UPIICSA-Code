function [ salida ] = IntegracionTrapecioAnalitico( pol,limS, limI, n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
matriz= GetFuncionTabular(pol, limS, limI, n);
salida= IntegracionTrapecio(matriz);
end
