%Interpolacion Lagrange Main
clear all;
M= [14,	68.7;
17,	64.2;
31,	44.1;
35,	38.9];

f= InterporlacionLagrange(M)
sx= M(:,1:1);
sy= M(:, 2:2);
k= 14:1:35;
ezplot(f,k )
hold on 
scatter(sx,sy)

