clear all;
f= @(x)exp((sin(tan(x))^2));
x= IntegracionTrapecioAnalitico(f, 3,2, 10)
x=IntegracionTrapecioAnalitico(f, 3,2, 50)
x= IntegracionTrapecioAnalitico(f, 3,2, 100)
