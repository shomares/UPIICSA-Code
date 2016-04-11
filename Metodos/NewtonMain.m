%Interpolacion Newton Main
clear all;
M = ...
  [1 3;
   1.5 7;
   2 20;
   2.5 50;
   3 100;
   3.5 190];

f= InterpolacionNewton(M);
sx= M(:,1:1);
sy= M(:, 2:2);
k= 1:.5  :4;
ezplot(f,k )
hold on 
scatter(sx,sy)

