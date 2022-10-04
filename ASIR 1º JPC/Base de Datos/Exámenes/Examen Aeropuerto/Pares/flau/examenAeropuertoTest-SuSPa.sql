
---1. obtenga los numeros de vuelo,origen y destino para los vuelos realizados por aviones cuyo alcance sea mayor que la media de todos y con longitud menor que 1/3 de la maxima longitud. (Con Subselect)

select num_vuelo,origen,destino from vuelos where tipo_avion in(select tipo from aviones where alcance>(select avg(alcance)from aviones) and longitud<(1/3*(select max(longitud)from aviones))) order by destino;

---N_FILAS=0

---2. Muestre el tipo de aviones que nunca han pasado por Sevilla. Sin repetir. (Con Join)
select distinct tipo from aviones,vuelos
where aviones.tipo=vuelos.tipo_avion
and vuelos.origen not like "Sevilla"
and vuelos.destino not like "Sevilla";

---N_FILAS=14

---3. Obtenga en dos columnas, las diferentes fechas de llegada reflejadas en los partes de vuelo con el menor combustible consumido en cada una de ellas y, a continuacion, estas mismas fechas con el mayor combustible consumido en cada una de ellas. Eliminar repetidos

select distinct fecha,max(comb_consumido)from partes group by fecha
union
select distinct fecha,min(comb_consumido)from partes
group by fecha;

---N_FILAS=65

---4. Muestra las horas salida diferentes que hay para cada tramo (origen destino) de la tabla de vuelos.

select distinct vuelos.hora_salida from vuelos
group by vuelos.origen,vuelos.destino;

---N_FILAS=48

---5. Obtenfga los diferentes numeros de parte de los partes que corresponden a vuelos que recorren una distancia mayor que la media  de la distancia de otros vuelos (Con Exists)

select distinct num_parte from partes 
where exists (select * from vuelos
where partes.num_vuelo=vuelos.num_vuelo
and distancia> (select avg(distancia) from vuelos));

---N_FILAS=30

---6. Obtenga el total de plazas reservadas para vuelos de iberia entre cada dos cuidades, ordenados de mayor a menor numero de plazas reservadas.
select reservas.fecha,vuelos.origen,vuelos.destino,sum(reservas.plazas) from reservas,vuelos
where reservas.num_vuelo=vuelos.num_vuelo
and substr(reservas.num_vuelo,1,2)=(select code from companias where nombre like "IBERIA") group by fecha,origen,destino;

---N_FILAS=10

---7. Obtenga la hora de salida mas tardia para cada uno de los origenes de los vuelos realizados por avion es con una capacidad menor que la media de capacidad de los otros aviones.

select origen,max(hora_salida) from vuelos
where tipo_avion in(select tipo from aviones
where butacas<(select avg(butacas) from aviones))
group by origen;

---N_FILAS=19

---8. Saliendo en el primer vuelo madrid-barcelona, averigue la hora de salida del primer vuelo que se puede coger en barcelona con desrino a sevilla.

select min(hora_salida) from vuelos 
where origen like "Barcelona"
and destino like "Sevilla"
and hora_salida>
(select min(hora_llegada) from vuelos
where origen like "Madrid" 
and destino like "Barcelona");

---N_FILAS=1

################################
el 8 ya lo he corregido tenemos los mismos resultados.
el 4 te falta distinct y corregido.
EL 2 te falta el destino not like (está corregido en el mio).

el 2 tiene que tener un join con aviones

Lo tiene miralo
el 4 me da 48 filas??
sisi 48 perdona
 el 6 no tiene fecha no?NOno tiene

 en el 7 men pide q ponga una hora, ahora le pregunto 
 ok, pero se ha equivocado al escribir,son varias(pone 'para cada uno de los origenes' y hay varios)
 dice que lo ordenenemos y le pongamos la primera hora que salga
 pues order by y limit 1

 select max(hora_salida) from vuelos
where exists
    (select * from aviones
    where vuelos.tipo_avion=aviones.tipo
    and butacas < (select avg(butacas) from aviones))
group by origen
order by max(hora_salida) desc limit 1;