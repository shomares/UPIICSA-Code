--COMO DBA le doy permisos a usuario1
	grant execute DBMS_LOCK to usuario1;

--Inserto Productos con una transaccion con el usuario1
DECLARE
	numeroProductos int; 
	valueProductos numeric;
BEGIN
	numeroProductos:= 1;
	loop
		valueProductos:= numeroProductos *2;
		numeroProductos:= numeroProductos + 1;
		INSERT INTO Producto (nombre,valor ) values ('Producto'||numeroProductos, numeroProductos * .2);
		 dbms_lock.sleep(5);
		exit when numeroProductos>100; 
	end loop;
END;
/
--usuario2
--Cambio con el usuario2 todos los productos que cuesten mas de 1000;
BEGIN
	update prd  SET valor= 200 where valor<200;
END;
/