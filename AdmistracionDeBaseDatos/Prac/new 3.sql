create or replace trigger writelogInsert
  after insert on productos
	for each row
	declare
		idUsuario varchar(100);
		idAccion number;
		accionDesc varchar(100);
	begin
		SELECT user INTO idUsuario
		FROM dual;
		select accion_id into idAccion
		from accion where valor='ALTA';
		accionDesc:='ALTA DEL PRODUCTO '|| :new.product_id;
		INSERT INTO logs (usuario,accion_id, fecha, accion) values (idUsuario, idAccion, systimestamp,accionDesc );
   end;
/

create or replace trigger writelogUPDATE
  after update on productos
	for each row
	declare
		idUsuario varchar(100);
		idAccion number;
		accionDesc varchar(100);
	begin
		SELECT user INTO idUsuario
		FROM dual;
		select accion_id into idAccion
		from accion where valor='UPDATE';
		accionDesc:='MODIFICACION DE PRODUCTO '|| :old.product_id;
		INSERT INTO logs (usuario,accion_id, fecha, accion) values (idUsuario, idAccion, systimestamp,accionDesc );
   end;
/


create or replace trigger writelogDELETE
  after delete on productos
	for each row
	declare
		idUsuario varchar(100);
		idAccion number;
		accionDesc varchar(100);
	begin
		SELECT user INTO idUsuario
		FROM dual;
		select accion_id into idAccion
		from accion where valor='DELETE';
		accionDesc:='ELIMINACION DE PRODUCTO '|| :old.product_id;
		INSERT INTO logs (usuario,accion_id, fecha, accion) values (idUsuario, idAccion, systimestamp,accionDesc );
   end;
/





