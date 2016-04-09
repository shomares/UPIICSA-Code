%Interpolacion Lagrange Main
clear all;
M= [1,-1.0;1.5,0.25;2,2;2.5,4.25];
f= InterporlacionLagrange(M);
sx= M(:,1:1);
sy= M(:, 2:2);
k= 1:1:3;
ezplot(f,k )
hold on 
scatter(sx,sy)

