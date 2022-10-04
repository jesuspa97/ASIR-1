---1. obtenga los numeros de vuelo,origen y destino para los vuelos realizados por aviones cuyo alcance sea mayor que la media de todos y con longitud menor que 1/3 de la maxima longitud. (Con Subselect)

vuelos -> num_vuelo, origen, destino
aviones -> alcance, longitud

select num_vuelo, origen, destino from vuelos
where tipo_avion in 
    (select tipo from aviones
    where alcance > (select avg(alcance) from aviones)
    and longitud < (select max(longitud)*1/3 from aviones));

'select num_vuelo, origen, destino, alcance, longitud from vuelos, aviones
where vuelos.tipo_avion=aviones.tipo
and (alcance > (select avg(alcance) from aviones)
    and longitud < 1/3*(select max(longitud) from aviones))'


N_FILAS=0

---2. Muestre el tipo de aviones que nunca han pasado por Sevilla. Sin repetir. (Con Join)

vuelos -> origen, destino, tipo_avion

select distinct tipo_avion from vuelos
where origen not like "SEVILLA"
and origen not like "SEVILLA";

select distinct tipo from aviones, vuelos
where aviones.tipo=vuelos.tipo_avion
and (origen not like "SEVILLA"
    and destino not like "SEVILLA");

'select distinct tipo_avion, origen, destino from vuelos
where origen not like "SEVILLA"
and origen not like "SEVILLA";'

N_FILAS=14

---3. Obtenga en dos columnas, las diferentes fechas de llegada reflejadas en los partes de vuelo con el menor combustible consumido en cada una de ellas y, a continuacion, estas mismas fechas con el mayor combustible consumido en cada una de ellas. Eliminar repetidos

partes -> fecha, comb_consumido

select distinct fecha, min(comb_consumido) from partes group by fecha
union
select distinct fecha, max(comb_consumido) from partes group by fecha;

N_FILAS=65


---4. Muestra las horas salida diferentes que hay para cada tramo (origen destino) de la tabla de vuelos.

vuelos -> hora_salida, origen, destino

select distinct hora_salida from vuelos group by origen, destino;

'select distinct hora_salida, origen, destino from vuelos group by origen, destino;'

N_FILAS=48

---5. Obtenga los diferentes numeros de parte de los partes que corresponden a vuelos que recorren una distancia mayor que la media  de la distancia de otros vuelos (Con Exists)

partes -> num_parte
vuelos -> distancia

select distinct num_parte from partes
where exists
    (select * from vuelos 
    where partes.num_vuelo=vuelos.num_vuelo
    and distancia > (select avg(distancia) from vuelos));


'select distinct num_parte, distancia from partes, vuelos
where partes.num_vuelo=vuelos.num_vuelo
and distancia > (select avg(distancia) from vuelos)'

N_FILAS=30

---6. Obtenga el total de plazas reservadas para vuelos de iberia entre cada dos cuidades, ordenados de mayor a menor numero de plazas reservadas.

reservas -> plazas
companias -> nombre

'select sum(plazas) from reservas, vuelos, companias
where reservas.num_vuelo=vuelos.num_vuelo
and ( substr(reservas.num_vuelo,1,2)=companias.code
    and nombre like "IBERIA")
group by origen, destino


select sum(plazas)

select vuelos.origen,vuelos.destino,sum(reservas.plazas) from reservas,vuelos
where reservas.num_vuelo=vuelos.num_vuelo
and substr(reservas.num_vuelo,1,2)=(select code from companias where nombre like "IBERIA") group by origen,destino;'

select sum(plazas) from reservas, vuelos
where reservas.num_vuelo=vuelos.num_vuelo
and substr(reservas.num_vuelo,1,2) like (select code from companias where nombre like "IBERIA")
group by origen, destino
order by sum(plazas) desc;

N_FILAS=5 


---7. Obtenga la hora de salida mas tardia para cada uno de los origenes de los vuelos realizados por aviones con una capacidad menor que la media de capacidad de los otros aviones.

vuelos -> hora_salida, origen
aviones -> butacas

select max(hora_salida) from vuelos
where exists
    (select * from aviones
    where vuelos.tipo_avion=aviones.tipo
    and butacas < (select avg(butacas) from aviones))
group by origen
order by max(hora_salida);

N_FILAS=19

---8. Saliendo en el primer vuelo madrid-barcelona, averigue la hora de salida del primer vuelo que se puede coger en barcelona con desrino a sevilla.

¿¿Pueden no tardar lo mismo??

vuelos -> origen, destino, hora_llegada, hora_salida

select min(hora_salida) from vuelos
where origen like "BARCELONA"
and( destino like "SEVILLA"
    and hora_salida > (select min(hora_llegada) from vuelos
                        where origen like "MADRID"
                        and destino like "BARCELONA"));


'select min(hora_salida) from vuelos 
where origen like "MADRID"
and destino like "BARCELONA"

select hora_llegada from vuelos
where hora_salida like (select min(hora_salida) from vuelos 
where origen like "MADRID"
and destino like "BARCELONA")
and origen like "MADRID"
and destino like "BARCELONA"'

'select min(hora_salida) from vuelos
where origen like "BARCELONA"
and( destino like "SEVILLA"
    and hora_salida > (select hora_llegada from vuelos
where hora_salida like (select min(hora_salida) from vuelos 
where origen like "MADRID"
and destino like "BARCELONA")
and origen like "MADRID"
and destino like "BARCELONA"))'

N_FILAS=1