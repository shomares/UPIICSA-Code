--Primero sin sinonimo usuario1.producto
select * from usuario1.producto;
--Creo el sinonimo prd para usuario1.producto  
create synonym prd  for usuario1.producto;
--Hago select con el sinonimo
select * from prd;
--Hago un select aun sinonimo global
select * from Ventas;