function [ salida ] = Biseccion( pol, var,limI, limE)
derivada= diff(pol,var);
x=limI;
delta=1;
while delta>limE
   xi= x - (double(subs(pol, var, x)) / double(subs(derivada, var, x))); 
   delta= abs(x-xi);
   x=xi;
end
salida=x;
end

