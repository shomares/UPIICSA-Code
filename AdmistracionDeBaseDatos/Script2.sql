--COMRPRUEBO QUE LA TABLA Venta no exista
BEGIN 
	EXECUTE IMMEDIATE 'DROP TABLE Venta';
	EXCEPTION
		WHEN OTHERS THEN
			IF SQLCODE !=-942 THEN
				RAISE;
			END IF;
END;
--COMRPRUEBO QUE LA TABLA Producto no exista
/
BEGIN 
	EXECUTE IMMEDIATE 'DROP TABLE Producto';
	EXCEPTION
		WHEN OTHERS THEN
			IF SQLCODE !=-942 THEN
				RAISE;
			END IF;
END;
/
--CREO LAS TABLAS
	CREATE TABLE Producto (
		idProducto number primary key,
		nombre varchar2(100),
		valor numeric(6,2)
	);
	CREATE TABLE Venta(
		idVenta number primary key,
		cantidad int,
		idProducto number,
		constraint FK_PRODUCTO
			FOREIGN KEY (idProducto)
			references Producto(idProducto)
	);
--COMRPRUEBO QUE LA sequence NO EXISTA
BEGIN 
	EXECUTE IMMEDIATE 'DROP sequence productos_id_seq';
	EXCEPTION
		WHEN OTHERS THEN
			IF SQLCODE !=-2289 THEN
				RAISE;
			END IF;
END;
/
BEGIN 
	EXECUTE IMMEDIATE 'DROP sequence venta_id_seq';
	EXCEPTION
		WHEN OTHERS THEN
			IF SQLCODE !=-2289 THEN
				RAISE;
			END IF;
END;
/
--COMPRUEBO QUE LOS TRIGGERS NO EXISTAN
BEGIN 
	EXECUTE IMMEDIATE 'DROP trigger producto_id_trigger';
	EXCEPTION
		WHEN OTHERS THEN
			IF SQLCODE !=-4080 THEN
				RAISE;
			END IF;
END;
/
BEGIN 
	EXECUTE IMMEDIATE 'DROP trigger venta_id_trigger';
	EXCEPTION
		WHEN OTHERS THEN
			IF SQLCODE !=-4080 THEN
				RAISE;
			END IF;
END;
/
--Creo los autoincrementables
CREATE sequence producto_id_seq;
CREATE sequence venta_id_seq;


create trigger producto_id_trigger
  before insert on producto
	for each row
		begin
			select producto_id_seq.nextval
			into :new.idProducto
		from dual;
	end;
/

create trigger venta_id_trigger
  before insert on venta
	for each row
		begin
			select venta_id_seq.nextval
			into :new.idVenta
		from dual;
	end;
/
DECLARE
	numeroProductos int; 
	valueProductos numeric;
BEGIN
	numeroProductos:= 1;
	loop
		valueProductos:= numeroProductos *2;
		numeroProductos:= numeroProductos + 1;
		INSERT INTO Producto (nombre,valor ) values ('Producto'||numeroProductos, numeroProductos * .2);
		exit when numeroProductos>100; 
	end loop;
END;
/
--Le doy permisos al usuario2 de poder hacer selects y sinonimos
GRANT SELECT,UPDATE on Producto TO usuario2;
GRANT SELECT on Venta TO usuario2;
grant create synonym to usuario2;
--Le pongo un sinonimo global a Ventas
create public synonym Ventas for usuario1.venta;






