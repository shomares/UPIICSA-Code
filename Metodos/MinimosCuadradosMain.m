%Interpolacion Minimos Cuadrados
clear all;
M= [-5,.4;-3,-.1;-1,-.2;0,-.3; 1,-.3; 2, .1; 4, .4];
f= InterpolacionMinimosCuadrados(M,6);
sx= M(:,1:1);
sy= M(:, 2:2);
k= -5:1:10;
ezplot(f,k )
hold on 
scatter(sx,sy)

