
SELECT idatributo, nbatributo FROM atributos
where nbatributopadre is null



SELECT idatributo, count(*) frecuencia, nbatributo FROM instancias ins
INNER JOIN  atributos att in (att.idatributo= ins.idatributo)
where nbatributopadre IN (SELECT idatributo  FROM atributos
							where nbatributopadre is null
						);
group by idatributo,nbatributo


 