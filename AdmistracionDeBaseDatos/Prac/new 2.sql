CREATE or replace PROCEDURE verificaTabla(
 nombreTabla IN VARCHAR2
)
IS
	command varchar2(100);
BEGIN
	command:='DROP TABLE ' ||nombreTabla;
	EXECUTE IMMEDIATE command ;
	EXCEPTION
		WHEN OTHERS THEN
			IF SQLCODE !=-942 THEN
				RAISE;
			END IF;
END;
/
