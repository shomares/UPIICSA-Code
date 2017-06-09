BEGIN
	verificaTabla('productos');
end;
/
CREATE TABLE productos
( 
	product_id numeric(10) not null primary key,
	nombre varchar2(100),
	costoNeto NUMBER(9,2),
	IVA NUMBER(9,2),
	promocion number(1)
);

BEGIN
	verificaTabla('accion');
end;
/
create table accion(
	accion_id number primary key,
	valor varchar2(100)
);

create sequence accion_id_seq;

create or replace trigger accion_emp_id
  before insert on accion
	for each row
		begin
			select accion_id_seq.nextval
			into :new.accion_id
		from dual;
	end;
/

BEGIN
	verificaTabla('logs');
end;
/

create table logs(
	log_id number primary key,
	usuario varchar2(100),
	fecha TIMESTAMP,
	accion varchar(100),
	accion_id number,
	CONSTRAINT fk_accion
    FOREIGN KEY (accion_id)
    REFERENCES accion(accion_id)
);
create sequence logs_id_seq;

create or replace trigger logs_id
  before insert on logs
	for each row
		begin
			select logs_id_seq.nextval
			into :new.log_id
		from dual;
	end;
/

INSERT INTO accion(valor) values('ALTA');
INSERT INTO accion(valor) values('UPDATE');
INSERT INTO accion(valor) values('DELETE');




