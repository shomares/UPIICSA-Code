--COMRPRUEBO QUE EL  TABLESPACE NO EXISTE
BEGIN 
	EXECUTE IMMEDIATE 'DROP TABLESPACE examen INCLUDING CONTENTS AND DATAFILES';
	EXCEPTION
		WHEN OTHERS THEN
			IF SQLCODE !=-959 THEN
				RAISE;
			END IF;
END;
/ 
CREATE TABLESPACE examen DATAFILE 'examen.f' SIZE 10M
		EXTENT MANAGEMENT LOCAL UNIFORM SIZE 128K;
--COMRPRUEBO QUE EL USUARIO 1 NO EXISTE
BEGIN 
	EXECUTE IMMEDIATE 'DROP USER USUARIO1 CASCADE';
	EXCEPTION
		WHEN OTHERS THEN
			IF SQLCODE !=-1918 THEN
				RAISE;
			END IF;
END;
/ 
CREATE USER USUARIO1
DEFAULT TABLESPACE examen
QUOTA 20M on examen
identified by 123;


--COMRPRUEBO QUE EL USUARIO 2 NO EXISTE
BEGIN 
	EXECUTE IMMEDIATE 'DROP USER USUARIO2 CASCADE';
	EXCEPTION
		WHEN OTHERS THEN
			IF SQLCODE !=-1918 THEN
				RAISE;
			END IF;
END;
/ 
CREATE USER USUARIO2
DEFAULT TABLESPACE examen
QUOTA 20M on examen
identified by 123;


--DAMOS PERMISOS DE ACCESO--------
--EL USUARIO1 ES DBA-------------
GRANT ALL PRIVILEGE TO usuario1;
--EL USUARIO2 NO ES DBA----------
GRANT CONNECT TO usuario2;












