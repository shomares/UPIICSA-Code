%Interpolacion Simple Main
clear all;
M= [1,1.342000000000000;2,3.755400000000000;3.500000000000000,4.183000000000000;4.212000000000000,5.033000000000000];
f= InterpolacionSimpleCompeta(M);
sx= M(:,1:1);
sy= M(:, 2:2);
k= 1:1:5;
ezplot(f,k )
hold on 
scatter(sx,sy)

