--1. Obtenga los tipos de avión, el doble de su envergadura y el cuadrado de su longitud para aquellos aviones con longitud menor que la media y que realizan vuelos con origen o destino en una ciudad que comience por la letra 'M', ordenándolos de mayor a menor envergadura.

select aviones.tipo, aviones.envergadura*2, aviones.logitud^2 from aviones having aviones.longitud<avg(longitud) where exists (select vuelos.origen, vuelos.destino from vuelos where (vuelos.origen like "M%" or vuelos.destino like "M%") and aviones.tipo=vuelos.tipo_avion)

+------+-----------------+------------+ 
| tipo | (envergadura*2) | Longitud^2 | 
+------+-----------------+------------+ 
| M87  |           65.80 |  1576.0900 | 
| M80  |           65.72 |  2032.2064 | 
| D9S  |           56.84 |  1321.3225 | 
| CS5  |           51.62 |   457.9600 | 
+------+-----------------+------------+ 

---2. Obtenga las tres primeras letras de los orígenes y destinos de los vuelos realizados por aviones con longitud mayor que la media y envergadura menor que 2/3 la máxima envergadura, ordenados alfabéticamente por destino.

---SubSelect
select left(origen,3),left(destino,3) from vuelos where tipo_avion in(select tipo from aviones where longitud>(select avg(longitud)from aviones) and envergadura<(2/3*(select max(envergadura)from aviones))) order by destino;

---JOIN
select left(vuelos.origen,3),left(vuelos.destino,3) from aviones,vuelos where aviones.tipo=vuelos.tipo_avion and aviones.longitud>(select avg(aviones.longitud) from aviones)and aviones.envergadura<(2/3*(select max(aviones.envergadura) from aviones)) order by vuelos.destino;

---EXIST
select left(origen,3),left(destino,3) from vuelos where exists(select * from aviones where tipo=tipo_avion and longitud>(select avg(longitud)from aviones)and envergadura<(2/3)*(select max(envergadura) from aviones))order by destino;


+----------------+-----------------+ +
| left(origen,3) | left(destino,3) | 
+----------------+-----------------+ 
| BIL            | AMS             | 
| BIL            | AMS             | 
| MAD            | BAR             | 
| MAD            | BAR             | 
| MAD            | BAR             | 
| BIL            | BAR             | 
| BAR            | BIL             | 
| MAD            | BUE             | 
| MAD            | CAS             | 
| LIS            | GRA             | 
| MAD            | LIS             | 
| PAR            | MAD             | 
| ROM            | MAD             | 
| BAR            | MAD             | 
| SAN            | MAD             | 
| BAR            | MAD             | 
| SEV            | MAD             | 
| BAR            | MAD             | 
| BAR            | MAD             | 
| SAN            | MAD             | 
| BIL            | MAD             | 
| BIL            | MAD             | 
| BIL            | MAD             | 
| BAR            | MAL             | 
| BAR            | MAL             | 
| MAD            | PAR             | 
| MAD            | ROM             | 
| BAR            | SAN             | 
| MAD            | SAN             | 
| BAR            | SEV             | 
+----------------+-----------------+ 
30 rows in set (0.00 sec)

---3. Obtenga los dos primeros caracteres de los números de vuelo y el origen de los vuelos a los que corresponden partes con número de parte entre 400 y 450 y que recorren distancias mayores que la media, ordenándolos alfabéticamente por origen. 

---SubSelect
select distinct left(num_vuelo,2),origen from vuelos where num_vuelo in(select num_vuelo from partes where num_parte between 400 and 450) and (distancia>(select avg(distancia) from vuelos)) order by destino;

---JOIN

select distinct left(vuelos.num_vuelo,2),vuelos.origen from vuelos, partes where vuelos.num_vuelo=partes.num_vuelo and (partes.num_parte between 400 and 450) and (vuelos.distancia>(select avg(vuelos.distancia) from vuelos)) order by vuelos.destino;

---EXIST
select distinct left(num_vuelo,2),origen from vuelos 
where exists(select * from partes where vuelos.num_vuelo=partes.num_vuelo 
and num_parte between 400 and 450 
and distancia>(select avg(distancia) from vuelos)) 
order by destino;

+-------------------+-----------+ 
| left(num_vuelo,2) | origen    | 
+-------------------+-----------+ 
| IB                | ALICANTE  | 
| AO                | ALMERIA   | 
| IB                | ALMERIA   | 
| AO                | AMSTERDAM | 
| IB                | AMSTERDAM | 
| IB                | BARCELONA | 
| IB                | BILBAO    | 
+-------------------+-----------+ 
7 rows in set (0.01 sec)

---4. Obtenga los números de vuelo, las tres primeras letras del origen y las tres primeras letras del destino para los vuelos realizados por aviones cuyo alcance sea mayor que la media de todos y con longitud menor que 2/3 la máxima longitud, ordenándolos por número de vuelo. 

---SubSelect
select num_vuelo,left(origen,3),left(destino,3) from vuelos 
where tipo_avion in
    (select tipo from aviones 
    where alcance>(select avg(alcance) from aviones)
    and longitud<(2/3)*(select max(longitud) from aviones))
order by num_vuelo;

---JOIN
select vuelos.num_vuelo,left(vuelos.origen,3),left(vuelos.destino,3) from vuelos,aviones 
where vuelos.tipo_avion=aviones.tipo 
    and aviones.alcance>(select avg(alcance) from aviones) 
    and longitud<(2/3)*(select max(longitud) from aviones)
order by vuelos.num_vuelo;

---EXIST
select num_vuelo,left(origen,3),left(destino,3) from vuelos
where exists(select * from aviones where vuelos.tipo_avion=aviones.tipo
and alcance>(select avg(alcance) from aviones)
    and longitud<(2/3)*(select max(longitud) from aviones))
order by num_vuelo;

+-----------+----------------+-----------------+ 
| num_vuelo | left(origen,3) | left(destino,3) | 
+-----------+----------------+-----------------+ 
| AR1386    | BUE            | BOG             | 
+-----------+----------------+-----------------+ 
1 row in set (0.00 sec) 


---5. Recupere todas las características de los aviones que nunca han pasado por Barcelona. 

---SubSelect
select * from aviones
where tipo not in(select distinct tipo_avion from vuelos
where origen like "BARCE%"
or destino like "BARCE%");

---EXISTS
select * from aviones
where not exists(select * from vuelos
where aviones.tipo=vuelos.tipo_avion
and (origen like "BARCE%"
or destino like "BARCE%"));

+------+ 
| tipo | 
+------+ 
| 310  | 
| 340  | 
| 737  | 
| 73S  | 
| 74M  | 
| 74S  | 
| AB2  | 
| AB3  | 
| ATR  | 
| CS5  | 
| D10  | 
| DC9  | 
| M88  | 
+------+ 
13 rows in set (0.01 sec) 




---6. Indique los tipos de avión, el doble de su longitud y su envergadura, para los aviones con envergadura mayor que la media y que realicen vuelos desde o hacia Madrid, ordenándolos de mayor a menor longitud. 
 
---SubSelect
select distinct tipo,2*longitud, envergadura from aviones
where envergadura>(select avg(envergadura) from aviones)
and tipo in (select tipo_avion from vuelos 
where origen like "Mad%" or destino like "mad%")
order by longitud desc;

---JOIN
select distinct aviones.tipo,2*(aviones.longitud),aviones.envergadura from aviones,vuelos
where aviones.envergadura>(select avg(aviones.envergadura) from aviones)
and (aviones.tipo=vuelos.tipo_avion
and (vuelos.origen like "Madr%" or vuelos.destino like "madr%"))
order by longitud desc;

---EXIST
select distinct tipo,2*longitud, envergadura from aviones
where envergadura>(select avg(envergadura) from aviones)
and exists (select * from vuelos 
where aviones.tipo=vuelos.tipo_avion
and (origen like "Mad%" or destino like "mad%"))
order by longitud desc;


+------+------------+-------------+ 
| tipo | 2*longitud | envergadura | 
+------+------------+-------------+ 
| 747  |     141.02 |       59.64 | 
| 32S  |     127.40 |       60.30 | 
| D10  |     110.70 |       50.39 | 
| AB3  |     107.14 |       44.84 | 
+------+------------+-------------+ 
4 rows in set (0.00 sec) 
 
 
 
---7. Obtenga, para cada destino, la mayor distancia recorrida hacia él, por vuelos realizados por aviones con longitud mayor que la media, ordenados alfabéticamente. 

---SubSelect
select destino,max(distancia) from vuelos
where tipo_avion in(select tipo from aviones
where longitud>(select avg(longitud) from aviones))
group by destino
order by destino;

---JOIN
select vuelos.destino, max(vuelos.distancia) from vuelos,aviones
where vuelos.tipo_avion=aviones.tipo
and aviones.longitud>(select avg(aviones.longitud)from aviones)
group by vuelos.destino
order by vuelos.destino;

---EXIST
select destino,max(distancia) from vuelos
where exists(select * from aviones
where vuelos.tipo_avion=aviones.tipo 
and longitud>(select avg(longitud)from aviones))
group by destino
order by destino;

+------------------------+----------------+ 
| destino                | max(distancia) | 
+------------------------+----------------+ 
| ALICANTE               |           2700 | 
| ALMERIA                |           2700 | 
| AMSTERDAM              |           3000 | 
| BARCELONA              |            840 | 
| BERLIN                 |           2670 | 
| BILBAO                 |            600 | 
| BUENOS AIRES           |           NULL | 
| CANCUN                 |           NULL | 
| CARACAS                |           3240 | 
| CASABLANCA             |            240 | 
| GRAN CANARIA           |           2640 | 
| LA HABANA              |           2130 | 
| LISBOA                 |             60 | 
| LONDRES                |           2700 | 
| MADRID                 |           2010 | 
| MALAGA                 |            750 | 
| PARIS                  |            900 | 
| ROMA                   |           1320 | 
| SANTIAGO DE COMPOSTELA |            900 | 
| SEVILLA                |            750 | 
+------------------------+----------------+ 
20 rows in set (0.01 sec) 
 

---8. Obtenga, para cada origen, la menor distancia recorrida desde él por vuelos realizados por aviones con menos butacas que la media, ordenados alfabéticamente. 

---SubSelect
select origen,min(distancia) from vuelos
where tipo_avion in (select tipo from aviones
where butacas<(select avg(butacas)from aviones))
group by origen
order by origen;

---JOIN
select vuelos.origen,min(vuelos.distancia) from vuelos,aviones
where vuelos.tipo_avion=aviones.tipo
and aviones.butacas<(select avg(aviones.butacas)from aviones)
group by vuelos.origen
order by vuelos.origen;

---EXIST
select origen,min(distancia) from vuelos
where exists (select * from aviones
where vuelos.tipo_avion=aviones.tipo
and butacas<(select avg(butacas)from aviones))
group by origen
order by origen;

 
+------------------------+----------------+ 
| origen                 | min(distancia) | 
+------------------------+----------------+ 
| ALICANTE               |            300 | 
| ALMERIA                |            240 | 
| AMSTERDAM              |           1380 | 
| BARCELONA              |            330 | 
| BILBAO                 |            330 | 
| BUENOS AIRES           |           2520 | 
| CASABLANCA             |           3810 | 
| FUERTEVENTURA          |            210 | 
| GRAN CANARIA           |            180 | 
| LA CORU+æA             |            600 | 
| LISBOA                 |           1500 | 
| MADRID                 |             60 | 
| PALMA MALLORCA         |            660 | 
| PARIS                  |            930 | 
| ROMA                   |            840 | 
| SANTIAGO DE CHILE      |            900 | 
| SANTIAGO DE COMPOSTELA |            600 | 
| SEVILLA                |            330 | 
| TENERIFE               |            180 | 
+------------------------+----------------+ 
19 rows in set (0.01 sec) 
 
---9. Indique el total de plazas reservadas existentes para cada número de vuelo de Iberia. 

---SubSelect
select num_vuelo, sum(plazas) from reservas
where substr(num_vuelo,1,2) in
(select code from companias 
where  nombre like "IBERIA")
group by num_vuelo;

---JOIN
select reservas.num_vuelo, sum(reservas.plazas) from reservas,companias
where substr(reservas.num_vuelo,1,2)=companias.code
and companias.nombre like "IBERIA"
group by reservas.num_vuelo;

---EXIST
select num_vuelo, sum(plazas) from reservas
where exists
(select * from companias 
where substr(reservas.num_vuelo,1,2)=companias.code
and nombre like "IBERIA")
group by num_vuelo;

+-----------+-------------+ 
| num_vuelo | sum(plazas) | 
+-----------+-------------+ 
| IB0103    |         255 | 
| IB0543    |         193 | 
| IB0554    |          70 | 
| IB0557    |          70 | 
| IB0845    |         420 | 
| IB1000    |         231 | 
| IB2614    |         408 | 
+-----------+-------------+ 
7 rows in set (0.00 sec) 
 
 
---10. Indique a cuántos destinos diferentes se vuela desde cada uno de los orígenes, mostrando la salida ordenada de mayor a menor número de destinos. 

---SOLO 1 MANERA (SOLO UNA TABLA).
select distinct origen,count(distinct destino) from vuelos
group by origen
order by count(distinct destino) desc;

+------------------------+-------------------------+ 
| origen                 | count(distinct destino) | 
+------------------------+-------------------------+ 
| BARCELONA              |                      10 | 
| MADRID                 |                       9 | 
| BUENOS AIRES           |                       7 | 
| ALICANTE               |                       6 | 
| GRAN CANARIA           |                       5 | 
| BILBAO                 |                       5 | 
| ALMERIA                |                       4 | 
| AMSTERDAM              |                       3 | 
| TENERIFE               |                       3 | 
| LISBOA                 |                       2 | 
| FUERTEVENTURA          |                       2 | 
| LA CORU+æA             |                       2 | 
| ROMA                   |                       2 | 
| SANTIAGO DE CHILE      |                       1 | 
| CASABLANCA             |                       1 | 
| SANTIAGO DE COMPOSTELA |                       1 | 
| SEVILLA                |                       1 | 
| PALMA MALLORCA         |                       1 | 
| PARIS                  |                       1 | 
| LA HABANA              |                       1 | 
+------------------------+-------------------------+ 
20 rows in set (0.00 sec) 
 
 
---11. Indique cuántos tipos de aviones diferentes salen de cada origen de la tabla vuelos, mostrando la salida ordenada de mayor a menor número de aviones. Sólo nos interesan aquellos orígenes de los que salen más de tres tipos de aviones diferentes. 

---SOLO 1 MANERA (SOLO UNA TABLA).
select vuelos.origen,count(distinct vuelos.tipo_avion) from vuelos
group by vuelos.origen
having count(distinct vuelos.tipo_avion)>3
order by count(distinct vuelos.tipo_avion) desc;



+--------------+----------------------------+ 
| origen       | count(distinct tipo_avion) | 
+--------------+----------------------------+ 
| MADRID       |                          8 | 
| BARCELONA    |                          6 | 
| BUENOS AIRES |                          5 | 
| ALICANTE     |                          4 | 
| ALMERIA      |                          4 | 
| GRAN CANARIA |                          4 | 
| BILBAO       |                          4 | 
+--------------+----------------------------+ 
7 rows in set (0.00 sec) 
 
 
--12. ¿Cuántas horas de salida diferentes hay para cada tramo (origen - destino) de la tabla vuelos? 

---SOLO 1 MANERA (SOLO UNA TABLA).
select vuelos.origen,vuelos.destino,count(distinct vuelos.hora_salida) from vuelos
group by vuelos.destino,vuelos.origen;


+------------------------+------------------------+-------+ 
| origen                 | destino                | Horas | 
+------------------------+------------------------+-------+ 
| AMSTERDAM              | ALICANTE               |     2 | 
| BARCELONA              | ALICANTE               |     2 | 
| BILBAO                 | ALICANTE               |     1 | 
| AMSTERDAM              | ALMERIA                |     1 | 
| BARCELONA              | ALMERIA                |     1 | 
| ALICANTE               | AMSTERDAM              |     3 | 
| BILBAO                 | AMSTERDAM              |     2 | 
| BUENOS AIRES           | AMSTERDAM              |     2 | 
| ALICANTE               | BARCELONA              |     4 | 
| ALMERIA                | BARCELONA              |     1 | 
| BILBAO                 | BARCELONA              |     2 | 
| BUENOS AIRES           | BARCELONA              |     1 | 
| LA CORU+æA             | BARCELONA              |     1 | 
| MADRID                 | BARCELONA              |     5 | 
| ROMA                   | BARCELONA              |     2 | 
| ALICANTE               | BERLIN                 |     1 | 
| ALICANTE               | BILBAO                 |     1 | 
| BARCELONA              | BILBAO                 |     2 | 
| BUENOS AIRES           | BOGOTA                 |     1 | 
| MADRID                 | BUENOS AIRES           |     1 | 
| SANTIAGO DE CHILE      | BUENOS AIRES           |     2 | 
| BUENOS AIRES           | CANCUN                 |     1 | 
| BUENOS AIRES           | CARACAS                |     1 | 
| MADRID                 | CASABLANCA             |     1 | 
| GRAN CANARIA           | FUERTEVENTURA          |     2 | 
| ALICANTE               | GRAN CANARIA           |     1 | 
| FUERTEVENTURA          | GRAN CANARIA           |     2 | 
| LISBOA                 | GRAN CANARIA           |     1 | 
| TENERIFE               | GRAN CANARIA           |     2 | 
| BARCELONA              | HANOVER                |     1 | 
| GRAN CANARIA           | HIERRO                 |     1 | 
| TENERIFE               | HIERRO                 |     1 | 
| BARCELONA              | LA CORU+æA             |     2 | 
| BUENOS AIRES           | LA CORU+æA             |     1 | 
| MADRID                 | LA CORU+æA             |     2 | 
| MADRID                 | LA HABANA              |     1 | 
| BARCELONA              | LANZAROTE              |     1 | 
| GRAN CANARIA           | LANZAROTE              |     2 | 
| MADRID                 | LISBOA                 |     2 | 
| ALMERIA                | LONDRES                |     1 | 
| ALICANTE               | MADRID                 |     2 | 
| ALMERIA                | MADRID                 |     1 | 
| AMSTERDAM              | MADRID                 |     2 | 
| BARCELONA              | MADRID                 |     6 | 
| BILBAO                 | MADRID                 |     3 | 
| BUENOS AIRES           | MADRID                 |     2 | 
| GRAN CANARIA           | MADRID                 |     2 | 
| LA CORU+æA             | MADRID                 |     1 | 
| LA HABANA              | MADRID                 |     1 | 
| LISBOA                 | MADRID                 |     1 | 
| PALMA MALLORCA         | MADRID                 |     2 | 
| PARIS                  | MADRID                 |     3 | 
| ROMA                   | MADRID                 |     2 | 
| SANTIAGO DE COMPOSTELA | MADRID                 |     3 | 
| SEVILLA                | MADRID                 |     2 | 
| TENERIFE               | MADRID                 |     1 | 
| BARCELONA              | MALAGA                 |     3 | 
| BILBAO                 | MALAGA                 |     1 | 
| ALMERIA                | MELILLA                |     1 | 
| CASABLANCA             | PARIS                  |     1 | 
| MADRID                 | PARIS                  |     2 | 
| MADRID                 | ROMA                   |     2 | 
| BARCELONA              | SANTIAGO DE COMPOSTELA |     3 | 
| MADRID                 | SANTIAGO DE COMPOSTELA |     2 | 
| BARCELONA              | SEVILLA                |     2 | 
| FUERTEVENTURA          | TENERIFE               |     2 | 
| GRAN CANARIA           | TENERIFE               |     2 | 
+------------------------+------------------------+-------+ 
67 rows in set (0.00 sec) 
 
 
---13. Obtenga, para cada número de vuelo, el total de plazas reservadas de los vuelos que recorren distancias mayores que la media de las distancias recorridas por vuelos de la misma compaña. Sólo nos interesan aquellos vuelos en los que el total de plazas reservadas es mayor que la media de plazas reservadas para los vuelos de Iberia. 

---JOIN
select sum(reservas.plazas) from reservas, vuelos 
where reservas.num_vuelo=vuelos.num_vuelo 
and vuelos.distancia>(select avg(distancia) from vuelos)
group by reservas.num_vuelo;

---EXIST
select reservas.num_vuelo,reservas.plazas from reservas where exists
(select * from vuelos,companias where reservas num_vuelo=vuelos.num_vuelo 
and substr(vuelos.num_vuelo,1,2)=companias.code 
and distancia>(select avg(distancia) from vuelos 
where substr(num_vuelo,1,2)=companias.code)) 
and reservas.plazas>(select avg(plazas) from reservas 
where substr(reservas.num_vuelo,1,2)=(select code from companias 
where nombre="Iberia"));

Empty set (0.01 sec) 
 
 
---14. Obtenga la hora de salida más temprana para cada uno de los orígenes de los vuelos realizados por aviones con un alcance menor que 2/3 de la media del alcance de los otros aviones. 

---SubSelect
select origen,min(hora_salida) from vuelos
where tipo_avion in(select tipo from aviones
where alcance<(2/3) * (select avg(alcance) from aviones))
group by origen
order by origen;

---JOIN
select vuelos.origen,min(vuelos.hora_salida) from vuelos,aviones
where vuelos.tipo_avion=aviones.tipo
and aviones.alcance<(2/3) * (select avg(aviones.alcance) from aviones)
group by vuelos.origen
order by vuelos.origen;

---EXIST
select origen,min(hora_salida) from vuelos
where exists(select * from aviones
where  vuelos.tipo_avion=aviones.tipo
and alcance<(2/3) * (select avg(alcance) from aviones))
group by origen
order by origen;

+------------------------+------------------+ 
| origen                 | min(hora_salida) | 
+------------------------+------------------+ 
| ALICANTE               | 08:05:00         | 
| ALMERIA                | 09:25:00         | 
| AMSTERDAM              | 11:20:00         | 
| BARCELONA              | 07:35:00         | 
| BILBAO                 | 10:55:00         | 
| CASABLANCA             | 15:05:00         | 
| FUERTEVENTURA          | 08:45:00         | 
| GRAN CANARIA           | 06:50:00         | 
| LA CORU+æA             | 09:35:00         | 
| LISBOA                 | 09:05:00         | 
| MADRID                 | 07:50:00         | 
| PALMA MALLORCA         | 07:50:00         | 
| PARIS                  | 07:05:00         | 
| ROMA                   | 18:50:00         | 
| SANTIAGO DE CHILE      | 07:00:00         | 
| SANTIAGO DE COMPOSTELA | 07:10:00         | 
| SEVILLA                | 18:15:00         | 
| TENERIFE               | 08:00:00         | 
+------------------------+------------------+ 
18 rows in set (0.00 sec) 
 
---15. Obtenga los números de parte de los partes que corresponden a vuelos que recorren una distancia mayor que la media de la distancia de los otros vuelos. 

---SubSelect
select num_parte from partes 
where num_vuelo in (select num_vuelo from vuelos
where distancia> (select avg(distancia) from vuelos));

---JOIN
select partes.num_parte from partes, vuelos
where partes.num_vuelo=vuelos.num_vuelo
and  vuelos.distancia> (select avg(vuelos.distancia) from vuelos);

---EXIST
select num_parte from partes 
where exists (select * from vuelos
where partes.num_vuelo=vuelos.num_vuelo
and distancia> (select avg(distancia) from vuelos));
 
+-----------+ 
| num_parte | 
+-----------+ 
|       408 | 
|       409 | 
|       413 | 
|       414 | 
|       415 | 
|       416 | 
|       417 | 
|       418 | 
|       419 | 
|       393 | 
|       394 | 
|       395 | 
|       396 | 
|       397 | 
|       402 | 
|       425 | 
|       444 | 
|       445 | 
|       455 | 
|       461 | 
|       471 | 
|       472 | 
|       478 | 
|       479 | 
|       490 | 
|       497 | 
|       498 | 
|       506 | 
|       507 | 
|       518 | 
+-----------+ 
30 rows in set (0.01 sec) 
 
 
 
---16. Obtenga el número de butacas de aquellos aviones con más butacas que la media de los otros aviones y envergadura menor que la media de las diferentes envergaduras de los otros aviones. 

---SOLO 1 MANERA (SOLO UNA TABLA).

select aviones.butacas from aviones,
where aviones.butacas>(select avg(aviones.butacas) from aviones)
and aviones.envergadura < (select avg(aviones.envergadura) from aviones);

+---------+ 
| butacas | 
+---------+ 
|     200 | 
+---------+ 
1 row in set (0.00 sec) 
 
 
---17. Obtenga la longitud de aquellos aviones con longitud menor que la media de los otros aviones y capacidad mayor que la media de las diferentes capacidades de los otros aviones. 

select aviones.longitud from aviones
where aviones.longitud<(select avg(aviones.longitud))
and aviones.butacas> (select avg(aviones.butacas) from aviones);

Empty set (0.00 sec) 
 
--18. Obtenga la longitud de los aviones que realizan vuelos que recorren distancias mayores que la media de las distancias de los vuelos recorridos por la misma compaña. 

---SubSelect
select distinct longitud from aviones
where tipo in (select tipo_avion from vuelos 
where distancia>(select avg(distancia)from vuelos
where substr(num_vuelo,1,2)=substr(num_vuelo,1,2)));

---JOIN
select distinct aviones.longitud from aviones,vuelos v1
where aviones.tipo=v1.tipo_avion
and distancia>(select avg(distancia) from vuelos v2 where substr(v1.num_vuelo,1,2)=substr(v2.num_vuelo,1,2));

---EXIST
select distinct longitud from aviones
where exists
(select * from vuelos v1
where distancia>(select avg(distancia) from vuelos v2
where substr(v1.num_vuelo,1,2)=substr(v2.num_vuelo,1,2))
and aviones.tipo=v1.tipo_avion);

+----------+ 
| longitud | 
+----------+ 
|    63.70 | 
|    46.66 | 
|    48.03 | 
|    47.32 | 
|    21.40 | 
|    53.57 | 
|    55.35 | 
|    36.35 | 
|    39.70 | 
|    45.08 | 
|    27.12 | 
+----------+ 
11 rows in set (0.03 sec) 
 
 
 
---19. Saliendo en el primer vuelo Sevilla - Madrid, averigüe la hora de salida del primer vuelo que se puede coger en Madrid con destino a Barcelona. 

---SOLO 1 MANERA (SOLO UNA TABLA).

select min(hora_salida) from vuelos 
where origen like "Mad%"
and destino like "Barc%"
and hora_salida>
(select min(hora_llegada) from vuelos
where origen like "sevi%" 
and destino like "Madr%");

+------------------+ 
| min(hora_salida) | 
+------------------+ 
| 10:00:00         | 
+------------------+ 
1 row in set (0.00 sec) 
 
 
 
---20. Obtenga el total de plazas reservadas para vuelos de Iberia cada día entre cada dos ciudades, ordenados de mayor a menor número de plazas reservadas. 

---SOLO 1 MANERA (SOLO UNA TABLA).
select reservas.fecha,vuelos.origen,vuelos.destino,sum(reservas.plazas) from reservas,vuelos
where reservas.num_vuelo=vuelos.num_vuelo
and substr(reservas.num_vuelo,1,2)=(select code from companias where nombre like "IBE%") group by fecha,origen,destino;

+------------+------------------------+------------------------+---------------+ 
 
| fecha      | origen                 | destino                | SUM(R.plazas) | 
 
+------------+------------------------+------------------------+---------------+  
| 2001-03-30 | SEVILLA                | MADRID                 |           255 | 
 
| 2001-02-05 | MADRID                 | BARCELONA              |           231 | 
 
| 2001-02-04 | BARCELONA              | MADRID                 |           227 | 
 
| 2001-02-04 | MADRID                 | BARCELONA              |           215 | 
 
| 2001-02-03 | MADRID                 | BARCELONA              |           193 | 
 
| 2001-02-03 | BARCELONA              | MADRID                 |           193 | 
 
| 2001-02-03 | SANTIAGO DE COMPOSTELA | MADRID                 |           120 | 
 
| 2001-02-02 | SANTIAGO DE COMPOSTELA | MADRID                 |            73 | 
 
| 2001-03-25 | MADRID                 | SANTIAGO DE COMPOSTELA |            70 | 
 
| 2001-03-30 | SANTIAGO DE COMPOSTELA | MADRID                 |            70 | 
 
+------------+------------------------+------------------------+---------------+ 
 
10 rows in set (0.00 sec)


---21. Obtenga los diferentes recorridos que se pueden realizar desde una ciudad hasta Madrid y haciendo escala llegar a otra ciudad. 

---SOLO 1 MANERA (SOLO UNA TABLA).
select v1.origen,v1.destino,v2.destino from vuelos v1,vuelos v2
where v1.destino like "madr%" 
and v2.destino in (select v2.destino from vuelos v2
where origen like "madrid")
group by v1.origen,v1.destino,v2.destino;

select v1.origen,v1.destino,v2.destino from vuelos v1,vuelos v2
where v1.destino like "madr%" 
and v2.origen like "Madr%"
group by v1.origen,v1.destino,v2.destino;


+------------------------+---------+------------------------+ 
| origen                 | destino | destino                | 
+------------------------+---------+------------------------+ 
| LA CORU+æA             | MADRID  | BARCELONA              | 
| LA CORU+æA             | MADRID  | BUENOS AIRES           | 
| LA CORU+æA             | MADRID  | CASABLANCA             | 
| LA CORU+æA             | MADRID  | LA CORU+æA             | 
| LA CORU+æA             | MADRID  | LA HABANA              |  
| LA CORU+æA             | MADRID  | LISBOA                 | 
| LA CORU+æA             | MADRID  | PARIS                  | 
| LA CORU+æA             | MADRID  | ROMA                   | 
| LA CORU+æA             | MADRID  | SANTIAGO DE COMPOSTELA | 
| PALMA MALLORCA         | MADRID  | BARCELONA              | 
| PALMA MALLORCA         | MADRID  | BUENOS AIRES           | 
| PALMA MALLORCA         | MADRID  | CASABLANCA             | 
| PALMA MALLORCA         | MADRID  | LA CORU+æA             | 
| PALMA MALLORCA         | MADRID  | LA HABANA              | 
| PALMA MALLORCA         | MADRID  | LISBOA                 | 
| PALMA MALLORCA         | MADRID  | PARIS                  | 
| PALMA MALLORCA         | MADRID  | ROMA                   | 
| PALMA MALLORCA         | MADRID  | SANTIAGO DE COMPOSTELA | 
| ALMERIA                | MADRID  | BARCELONA              | 
| ALMERIA                | MADRID  | BUENOS AIRES           | 
| ALMERIA                | MADRID  | CASABLANCA             | 
| ALMERIA                | MADRID  | LA CORU+æA             | 
| ALMERIA                | MADRID  | LA HABANA              | 
| ALMERIA                | MADRID  | LISBOA                 | 
| ALMERIA                | MADRID  | PARIS                  | 
| ALMERIA                | MADRID  | ROMA                   | 
| ALMERIA                | MADRID  | SANTIAGO DE COMPOSTELA | 
| ALICANTE               | MADRID  | BARCELONA              | 
| ALICANTE               | MADRID  | BUENOS AIRES           | 
| ALICANTE               | MADRID  | CASABLANCA             | 
| ALICANTE               | MADRID  | LA CORU+æA             | 
| ALICANTE               | MADRID  | LA HABANA              | 
| ALICANTE               | MADRID  | LISBOA                 | 
| ALICANTE               | MADRID  | PARIS                  | 
| ALICANTE               | MADRID  | ROMA                   | 
| ALICANTE               | MADRID  | SANTIAGO DE COMPOSTELA | 
| BUENOS AIRES           | MADRID  | BARCELONA              | 
| BUENOS AIRES           | MADRID  | BUENOS AIRES           | 
| BUENOS AIRES           | MADRID  | CASABLANCA             | 
| BUENOS AIRES           | MADRID  | LA CORU+æA             | 
| BUENOS AIRES           | MADRID  | LA HABANA              | 
| BUENOS AIRES           | MADRID  | LISBOA                 | 
| BUENOS AIRES           | MADRID  | PARIS                  | 
| BUENOS AIRES           | MADRID  | ROMA                   | 
| BUENOS AIRES           | MADRID  | SANTIAGO DE COMPOSTELA | 
| SEVILLA                | MADRID  | BARCELONA              | 
| SEVILLA                | MADRID  | BUENOS AIRES           | 
| SEVILLA                | MADRID  | CASABLANCA             | 
| SEVILLA                | MADRID  | LA CORU+æA             | 
| SEVILLA                | MADRID  | LA HABANA              | 
| SEVILLA                | MADRID  | LISBOA                 | 
| SEVILLA                | MADRID  | PARIS                  | 
| SEVILLA                | MADRID  | ROMA                   | 
| SEVILLA                | MADRID  | SANTIAGO DE COMPOSTELA | 
| BILBAO                 | MADRID  | BARCELONA              | 
| BILBAO                 | MADRID  | BUENOS AIRES           | 
| BILBAO                 | MADRID  | CASABLANCA             | 
| BILBAO                 | MADRID  | LA CORU+æA             | 
| BILBAO                 | MADRID  | LA HABANA              | 
| BILBAO                 | MADRID  | LISBOA                 | 
| BILBAO                 | MADRID  | PARIS                  | 
| BILBAO                 | MADRID  | ROMA                   | 
| BILBAO                 | MADRID  | SANTIAGO DE COMPOSTELA | 
| SANTIAGO DE COMPOSTELA | MADRID  | BARCELONA              | 
| SANTIAGO DE COMPOSTELA | MADRID  | BUENOS AIRES           | 
| SANTIAGO DE COMPOSTELA | MADRID  | CASABLANCA             | 
| SANTIAGO DE COMPOSTELA | MADRID  | LA CORU+æA             | 
| SANTIAGO DE COMPOSTELA | MADRID  | LA HABANA              | 
| SANTIAGO DE COMPOSTELA | MADRID  | LISBOA                 | 
| SANTIAGO DE COMPOSTELA | MADRID  | PARIS                  | 
| SANTIAGO DE COMPOSTELA | MADRID  | ROMA                   | 
| SANTIAGO DE COMPOSTELA | MADRID  | SANTIAGO DE COMPOSTELA | 
| GRAN CANARIA           | MADRID  | BARCELONA              | 
| GRAN CANARIA           | MADRID  | BUENOS AIRES           | 
| GRAN CANARIA           | MADRID  | CASABLANCA             | 
| GRAN CANARIA           | MADRID  | LA CORU+æA             | 
| GRAN CANARIA           | MADRID  | LA HABANA              | 
| GRAN CANARIA           | MADRID  | LISBOA                 | 
| GRAN CANARIA           | MADRID  | PARIS                  | 
| GRAN CANARIA           | MADRID  | ROMA                   | 
| GRAN CANARIA           | MADRID  | SANTIAGO DE COMPOSTELA | 
| BARCELONA              | MADRID  | BARCELONA              | 
| BARCELONA              | MADRID  | BUENOS AIRES           | 
| BARCELONA              | MADRID  | CASABLANCA             | 
| BARCELONA              | MADRID  | LA CORU+æA             | 
| BARCELONA              | MADRID  | LA HABANA              | 
| BARCELONA              | MADRID  | LISBOA                 | 
| BARCELONA              | MADRID  | PARIS                  | 
| BARCELONA              | MADRID  | ROMA                   | 
| BARCELONA              | MADRID  | SANTIAGO DE COMPOSTELA | 
| TENERIFE               | MADRID  | BARCELONA              | 
| TENERIFE               | MADRID  | BUENOS AIRES           | 
| TENERIFE               | MADRID  | CASABLANCA             | 
| TENERIFE               | MADRID  | LA CORU+æA             | 
| TENERIFE               | MADRID  | LA HABANA              | 
| TENERIFE               | MADRID  | LISBOA                 | 
| TENERIFE               | MADRID  | PARIS                  | 
| TENERIFE               | MADRID  | ROMA                   | 
| TENERIFE               | MADRID  | SANTIAGO DE COMPOSTELA | 
| LISBOA                 | MADRID  | BARCELONA              | 
| LISBOA                 | MADRID  | BUENOS AIRES           | 
| LISBOA                 | MADRID  | CASABLANCA             | 
| LISBOA                 | MADRID  | LA CORU+æA             | 
| LISBOA                 | MADRID  | LA HABANA              | 
| LISBOA                 | MADRID  | LISBOA                 | 
| LISBOA                 | MADRID  | PARIS                  | 
| LISBOA                 | MADRID  | ROMA                   |  
| LISBOA                 | MADRID  | SANTIAGO DE COMPOSTELA | 
| AMSTERDAM              | MADRID  | BARCELONA              | 
| AMSTERDAM              | MADRID  | BUENOS AIRES           | 
| AMSTERDAM              | MADRID  | CASABLANCA             | 
| AMSTERDAM              | MADRID  | LA CORU+æA             | 
| AMSTERDAM              | MADRID  | LA HABANA              | 
| AMSTERDAM              | MADRID  | LISBOA                 | 
| AMSTERDAM              | MADRID  | PARIS                  | 
| AMSTERDAM              | MADRID  | ROMA                   | 
| AMSTERDAM              | MADRID  | SANTIAGO DE COMPOSTELA | 
| PARIS                  | MADRID  | BARCELONA              | 
| PARIS                  | MADRID  | BUENOS AIRES           | 
| PARIS                  | MADRID  | CASABLANCA             | 
| PARIS                  | MADRID  | LA CORU+æA             | 
| PARIS                  | MADRID  | LA HABANA              | 
| PARIS                  | MADRID  | LISBOA                 | 
| PARIS                  | MADRID  | PARIS                  | 
| PARIS                  | MADRID  | ROMA                   | 
| PARIS                  | MADRID  | SANTIAGO DE COMPOSTELA | 
| ROMA                   | MADRID  | BARCELONA              | 
| ROMA                   | MADRID  | BUENOS AIRES           | 
| ROMA                   | MADRID  | CASABLANCA             | 
| ROMA                   | MADRID  | LA CORU+æA             | 
| ROMA                   | MADRID  | LA HABANA              | 
| ROMA                   | MADRID  | LISBOA                 | 
| ROMA                   | MADRID  | PARIS                  | 
| ROMA                   | MADRID  | ROMA                   | 
| ROMA                   | MADRID  | SANTIAGO DE COMPOSTELA | 
| LA HABANA              | MADRID  | BARCELONA              | 
| LA HABANA              | MADRID  | BUENOS AIRES           | 
| LA HABANA              | MADRID  | CASABLANCA             | 
| LA HABANA              | MADRID  | LA CORU+æA             | 
| LA HABANA              | MADRID  | LA HABANA              | 
| LA HABANA              | MADRID  | LISBOA                 | 
| LA HABANA              | MADRID  | PARIS                  | 
| LA HABANA              | MADRID  | ROMA                   | 
| LA HABANA              | MADRID  | SANTIAGO DE COMPOSTELA | 
+------------------------+---------+------------------------+ 
144 rows in set (0.01 sec) 
 
 

---22. Obtenga, en una sola columna, los nombres de todas las ciudades que aparecen en la tabla de vuelos, ordenados alfabéticamente. 

---UNION
select distinct origen from vuelos
union
select distinct destino from vuelos
order by origen;


+------------------------+ 
| origen                 | 
+------------------------+ 
| ALICANTE               | 
| ALMERIA                | 
| AMSTERDAM              | 
| BARCELONA              | 
| BERLIN                 | 
| BILBAO                 | 
| BOGOTA                 | 
| BUENOS AIRES           | 
| CANCUN                 | 
| CARACAS                | 
| CASABLANCA             | 
| FUERTEVENTURA          | 
| GRAN CANARIA           | 
| HANOVER                | 
| HIERRO                 | 
| LA CORU+æA             | 
| LA HABANA              | 
| LANZAROTE              | 
| LISBOA                 | 
| LONDRES                | 
| MADRID                 | 
| MALAGA                 | 
| MELILLA                | 
| PALMA MALLORCA         | 
| PARIS                  | 
| ROMA                   | 
| SANTIAGO DE CHILE      | 
| SANTIAGO DE COMPOSTELA | 
| SEVILLA                | 
| TENERIFE               | 
+------------------------+ 
30 rows in set (0.01 sec) 
 
 
 
---23. Obtenga en una sola columna el nombre de todas las ciudades origen de un vuelo y el de las que son destino de un vuelo. (Una misma ciudad puede aparecer como origen y como destino.) 

---UNION
select distinct origen from vuelos
union all
select distinct destino from vuelos;

+------------------------+  
| origen                 | 
+------------------------+ 
| ALICANTE               | 
| ALMERIA                | 
| AMSTERDAM              | 
| BARCELONA              | 
| BILBAO                 | 
| BUENOS AIRES           | 
| CASABLANCA             | 
| FUERTEVENTURA          | 
| GRAN CANARIA           | 
| LA CORU+æA             | 
| LA HABANA              | 
| LISBOA                 | 
| MADRID                 | 
| PALMA MALLORCA         | 
| PARIS                  | 
| ROMA                   | 
| SANTIAGO DE CHILE      | 
| SANTIAGO DE COMPOSTELA | 
| SEVILLA                | 
| TENERIFE               | 
| ALICANTE               | 
| ALMERIA                | 
| AMSTERDAM              | 
| BARCELONA              | 
| BERLIN                 | 
| BILBAO                 | 
| BOGOTA                 | 
| BUENOS AIRES           | 
| CANCUN                 | 
| CARACAS                | 
| CASABLANCA             | 
| FUERTEVENTURA          | 
| GRAN CANARIA           | 
| HANOVER                | 
| HIERRO                 | 
| LA CORU+æA             | 
| LA HABANA              | 
| LANZAROTE              | 
| LISBOA                 | 
| LONDRES                | 
| MADRID                 | 
| MALAGA                 | 
| MELILLA                | 
| PARIS                  | 
| ROMA                   | 
| SANTIAGO DE COMPOSTELA | 
| SEVILLA                | 
| TENERIFE               | 
+------------------------+ 
48 rows in set (0.00 sec) 
 
---24. Obtenga en dos columnas, para cada ciudad que es origen, el número de vuelos que salen de ella y luego para cada una que es destino, el número de vuelos que recibe. 

---UNION
select destino,count(destino) from vuelos
group by destino
union
select origen,count(origen) from vuelos
group by origen;


+------------------------+----------------+ 
| destino                | count(destino) | 
+------------------------+----------------+  
| ALICANTE               |              6 | 
| ALMERIA                |              3 | 
| AMSTERDAM              |              9 | 
| BARCELONA              |             16 | 
| BERLIN                 |              1 | 
| BILBAO                 |              3 | 
| BOGOTA                 |              1 | 
| BUENOS AIRES           |              4 | 
| CANCUN                 |              1 | 
| CARACAS                |              1 | 
| CASABLANCA             |              1 | 
| FUERTEVENTURA          |              2 | 
| GRAN CANARIA           |              6 | 
| HANOVER                |              1 | 
| HIERRO                 |              2 | 
| LA CORU+æA             |              5 | 
| LA HABANA              |              1 | 
| LANZAROTE              |              3 | 
| LISBOA                 |              2 | 
| LONDRES                |              2 | 
| MADRID                 |             35 | 
| MALAGA                 |              4 | 
| MELILLA                |              1 | 
| PARIS                  |              3 | 
| ROMA                   |              2 | 
| SANTIAGO DE COMPOSTELA |              5 | 
| SEVILLA                |              2 | 
| TENERIFE               |              4 | 
| ALICANTE               |             14 | 
| ALMERIA                |              6 | 
| AMSTERDAM              |              7 | 
| BARCELONA              |             23 | 
| BILBAO                 |              9 | 
| BUENOS AIRES           |              9 | 
| FUERTEVENTURA          |              4 | 
| GRAN CANARIA           |              9 | 
| LA CORU+æA             |              2 | 
| MADRID                 |             19 | 
| PALMA MALLORCA         |              2 | 
| ROMA                   |              4 | 
| SANTIAGO DE CHILE      |              2 | 
| SANTIAGO DE COMPOSTELA |              3 | 
+------------------------+----------------+ 
42 rows in set (0.00 sec) 
 
 
---25. Obtenga en tres columnas, para cada ciudad que aparece en la tabla vuelos, su nombre ordenado alfabéticamente, el total de vuelos que parten de ella y el total de vuelos que llegan a ella. Si no llega o no parte ningún vuelo, debe aparecer cero en la columna correspondiente. 

---UNION
select destino,0 as "count(origen)",count(destino) from vuelos group by destino
UNION
select origen,count(origen),0 from vuelos group by origen
order by destino;
+------------------------+----+----------------+ 
| destino                | 0  | count(destino) | 
+------------------------+----+----------------+ 
| ALICANTE               |  0 |              6 | 
| ALICANTE               | 14 |              0 | 
| ALMERIA                |  0 |              3 | 
| ALMERIA                |  6 |              0 | 
| AMSTERDAM              |  0 |              9 | 
| AMSTERDAM              |  7 |              0 | 
| BARCELONA              |  0 |             16 | 
| BARCELONA              | 23 |              0 | 
| BERLIN                 |  0 |              1 | 
| BILBAO                 |  0 |              3 | 
| BILBAO                 |  9 |              0 | 
| BOGOTA                 |  0 |              1 | 
| BUENOS AIRES           |  0 |              4 | 
| BUENOS AIRES           |  9 |              0 | 
| CANCUN                 |  0 |              1 | 
| CARACAS                |  0 |              1 | 
| CASABLANCA             |  0 |              1 | 
| CASABLANCA             |  1 |              0 | 
| FUERTEVENTURA          |  0 |              2 | 
| FUERTEVENTURA          |  4 |              0 | 
| GRAN CANARIA           |  0 |              6 | 
| GRAN CANARIA           |  9 |              0 | 
| HANOVER                |  0 |              1 | 
| HIERRO                 |  0 |              2 | 
| LA CORU+æA             |  0 |              5 | 
| LA CORU+æA             |  2 |              0 | 
| LA HABANA              |  0 |              1 | 
| LA HABANA              |  1 |              0 | 
| LANZAROTE              |  0 |              3 | 
| LISBOA                 |  0 |              2 | 
| LISBOA                 |  2 |              0 | 
| LONDRES                |  0 |              2 | 
| MADRID                 |  0 |             35 | 
| MADRID                 | 19 |              0 | 
| MALAGA                 |  0 |              4 | 
| MELILLA                |  0 |              1 | 
| PALMA MALLORCA         |  2 |              0 | 
| PARIS                  |  0 |              3 | 
| PARIS                  |  3 |              0 | 
| ROMA                   |  0 |              2 | 
| ROMA                   |  4 |              0 | 
| SANTIAGO DE CHILE      |  2 |              0 | 
| SANTIAGO DE COMPOSTELA |  0 |              5 | 
| SANTIAGO DE COMPOSTELA |  3 |              0 | 
| SEVILLA                |  0 |              2 | 
| SEVILLA                |  2 |              0 | 
| TENERIFE               |  0 |              4 | 
| TENERIFE               |  4 |              0 | 
+------------------------+----+----------------+ 
48 rows in set (0.00 sec) 
 
 
---26. Obtenga en dos columnas, las diferentes fechas de llegada reflejadas en los partes de vuelo con el menor combustible consumido en cada una de ellas y, a continuación, estas mismas fechas con el mayor combustible consumido en cada una de ellas.  

---UNION
select distinct fecha,max(comb_consumido)from partes group by fecha
union
select distinct fecha,min(comb_consumido)from partes
group by fecha;

+------------+---------------------+ 
| fecha      | max(comb_consumido) | 
+------------+---------------------+ 
| 1996-01-05 |                9660 | 
| 1996-01-06 |               11500 | 
| 1996-01-07 |               10235 | 
| 1996-01-08 |               10350 | 
| 1996-01-09 |               10350 | 
| 1996-01-10 |                5175 | 
| 1996-01-11 |                2530 | 
| 1996-01-12 |                5175 | 
| 1996-01-14 |                3450 | 
| 1996-01-15 |                2300 | 
| 1996-01-16 |                2875 | 
| 1996-01-17 |                2875 | 
| 1996-01-18 |                3105 | 
| 1996-01-19 |                2875 | 
| 1996-01-20 |                9660 | 
| 1996-01-21 |                2300 | 
| 1996-01-22 |                1265 | 
| 1996-02-01 |                2645 | 
| 1996-02-02 |                9660 | 
| 1996-02-03 |               14605 | 
| 1996-02-04 |                2300 | 
| 1996-02-05 |                1150 | 
| 1996-02-06 |                7590 | 
| 1996-02-07 |                2875 | 
| 1996-02-08 |                2300 | 
| 1996-02-09 |               10120 | 
| 1996-02-10 |                2300 | 
| 1996-02-11 |                NULL | 
| 1996-02-12 |                2300 | 
| 1996-02-14 |                8165 | 
| 1996-02-15 |                5060 | 
| 1996-02-16 |                5060 | 
| 1996-02-17 |                5175 | 
| 1996-02-18 |                5175 | 
| 1996-02-19 |                3450 | 
| 1996-02-20 |                2300 | 
| 1996-02-21 |                 690 | 
| 1996-02-22 |                7705 | 
| 1996-01-05 |                5290 | 
| 1996-01-06 |                1265 | 
| 1996-01-07 |                1265 | 
| 1996-01-08 |                1150 | 
| 1996-01-09 |                 920 | 
| 1996-01-10 |                1265 | 
| 1996-01-12 |                2300 | 
| 1996-01-16 |                2300 | 
| 1996-01-18 |                2875 | 
| 1996-01-19 |                2300 | 
| 1996-01-20 |                9430 | 
| 1996-01-21 |                1265 | 
| 1996-02-03 |                 805 | 
| 1996-02-04 |                 805 | 
| 1996-02-05 |                 805 | 
| 1996-02-06 |                 690 | 
| 1996-02-07 |                 805 | 
| 1996-02-09 |                5750 | 
| 1996-02-12 |                 920 | 
| 1996-02-14 |                 230 | 
| 1996-02-15 |                3450 | 
| 1996-02-16 |                2530 | 
| 1996-02-17 |                3220 | 
| 1996-02-18 |                3450 | 
| 1996-02-19 |                2300 | 
| 1996-02-20 |                1265 | 
| 1996-02-22 |                 920 | 
+------------+---------------------+ 
65 rows in set (0.00 sec) 
 
