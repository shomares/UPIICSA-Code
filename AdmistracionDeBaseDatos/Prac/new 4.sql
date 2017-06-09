INSERT INTO productos VALUES(2,'PRODUCTO1',10.01,12,1);
SELECT usuario, fecha, accion, accion_id FROM LOGS;

UPDATE productos set nombre='AA' WHERE product_id='2';
SELECT usuario, fecha, accion, accion_id FROM LOGS;


DELETE productos WHERE product_id=2;
SELECT usuario, fecha, accion, accion_id FROM LOGS;
