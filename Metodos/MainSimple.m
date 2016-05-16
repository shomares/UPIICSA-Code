%Interpolacion Simple Main
clear all;

%SegundoEjercicio
M= [14,	68.7;
17,	64.2;
31,	44.1;
35,	38.9];


f0= InterpolacionSimple(M,27)
f= InterpolacionSimpleCompeta(M)

sx= M(:,1:1);
sy= M(:, 2:2);
k= 14:1:40;

ezplot(f0,k )
hold on
ezplot(f,k )
hold on 
scatter(sx,sy)




