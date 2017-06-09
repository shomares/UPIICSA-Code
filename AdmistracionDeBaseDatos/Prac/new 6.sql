CREATE or replace PROCEDURE insertProducto(
    product_id in numeric,
	nombre in varchar2,
	costoNeto in NUMBER
)
IS
	IVA NUMBER(9,2);
	promocion number(1);
BEGIN
	IVA:= costoNeto * .16;
	IF(costoNeto>100) THEN
		promocion:=1;
	ELSE
		promocion:=0;
	end if;
	INSERT INTO productos VALUES(product_id,nombre,costoNeto,IVA,promocion);
	
END;
/
BEGIN
	insertProducto(2001, 'PRODUCTO1', 100);
	insertProducto(2002, 'PRODUCTO2', 1001);
end;
/