---1. Obtenga la matricula de todos los aviones de la compañia "Aerolineas Argentinas" que tienen vuelos "Madrid"- "Buenos Aires". No se quieren repeticiones. Con join---

companias -> nombre
vuelos -> origen, destino
flota -> matricula

select distinct matricula from flota, companias, vuelos
where flota.compania=companias.code
and (substr(vuelos.num_vuelo,1,2)=companias.code
    and (nombre like "Aerolineas Argentinas"
        and (origen like "Madrid"
            and destino like "Buenos Aires")));

'select distinct matricula from flota, vuelos 
where flota.compania=substr(vuelos.num_vuelo, 1, 2)
and (origen like "Madrid" and destino like "Buenos Aires");'

---2. Obtenga origen y destino de todos los vuelos cuyos aviones tienen una capacidad de al menos 100 pasajeros y tienen la hora de salida despues de las 8 de la mañana de la compañia "Binter Canarias. Con EXISTS---

vuelos -> origen, destino, hora_salida
aviones -> butacas
companias -> nombre

select origen, destino from vuelos
where exists
    (select * from aviones 
    where vuelos.tipo_avion=aviones.tipo
    and butacas >= 100)
and (exists 
        (select * from companias
        where substr(vuelos.num_vuelo,1,2)=companias.code
        and nombre like "Binter Canarias" )
    and hora_salida > "08:00:00");

'select origen, destino from vuelos 
where exists
    (select * from aviones
    where vuelos.tipo_avion=aviones.tipo
    and butacas >= 100)
and (hora_salida>"08:00:00"
and exists 
    (select * from companias 
    where substr(num_vuelo,1,2)=companias.code
    and nombre like "Binter Canarias"))'

"select origen, destino, butacas, hora_salida, nombre from vuelos, aviones, companias
where aviones.tipo=vuelos.tipo_avion 
and (substr(num_vuelo,1,2)=companias.code
and (hora_salida>"08:00:00"
and (butacas>=100
)))

select origen, destino, butacas, hora_salida, nombre from vuelos, aviones, companias
where aviones.tipo=vuelos.tipo_avion 
and (substr(num_vuelo,1,2)=companias.code
and  nombre like "Binter Canarias")


select origen, destino, butacas, hora_salida, nombre from vuelos, aviones, companias
where aviones.tipo=vuelos.tipo_avion 
and (substr(num_vuelo,1,2)=companias.code
and (hora_salida>"08:00:00"
and (butacas>=100
and nombre like "Binter Canarias")))"


"select origen, destino from vuelos
where exists
    (select * from aviones
    where exists
        (select * from companias
        where nombre like "Binter Canarias")
    and (butacas > 100
    and ))
and hora_salida > "08:00:00";


select origen, destino from vuelos
where exists
    (select * from aviones
    where butacas > 100)
and (hora_salida > "08:00:00"
and num_vuelo like "NT%");

select origen, destino from vuelos
where exists 
    (select * from aviones 
    where vuelos.tipo_avion=aviones.tipo
    and (butacas > 100
    and exists
        (select * from companias
        where )))

select origen, destino from vuelos, companias
where substr(vuelos.num_vuelo,1,2)=companias.code
and ( exists 
    (select * from aviones    
    where vuelos.tipo_avion=aviones.tipo
    and butacas > 100)
and (hora_salida > "08:00:00"
and nombre like "Binter Canarias"))
"

---3. Obtenga el total de plazas reservas por cada fecha para los realizados desde Bilbao A Madrid o Barcelona ordenandolos de menor a mayor plazas. Con Subselect---

reservas -> plazas, fecha
vuelos -> origen, destino

select fecha, sum(plazas) from reservas 
where num_vuelo in
    (select num_vuelo from vuelos
    where origen like "Bilbao"
    and (destino like "Madrid"
        or destino like "Barcelona"))
group by fecha;

'select fecha, sum(plazas) from reservas
where num_vuelo in 
    (select num_vuelo from vuelos where origen like "Bilbao" and (destino like "Madrid" or destino like "Barcelona"))
group by fecha
order by sum(plazas);'

---4. Obtenga el nombre y el telefono de las agencias que tienen mas de 100 plazas reservadas para los vuelos con destino Madrid. Sin filas repetidas---

agencias -> nombre, telefono
reservas -> plazas
vuelos -> destino

select nombre, telefono from agencias, reservas, vuelos
where agencias.code=reservas.agencia
and (reservas.num_vuelo=vuelos.num_vuelo
    and (plazas > 100 
        and destino like "Madrid"));

select nombre, telefono from agencias
where code in 
    (select agencia from reservas
    where plazas>100
    and num_vuelo in 
        (select num_vuelo from vuelos
        where destino like "Madrid"));

select nombre, telefono from agencias
where exists 
    (select * from reservas
    where agencias.code=reservas.agencia
    and (plazas>100
        and exists 
            (select * from vuelos
            where reservas.num_vuelo=vuelos.num_vuelo
            and destino like "Madrid")));
    

---5. Obtenga la hora de salida mas temprana para cada uno de los vuelos realizados por aviones con una longitud menor que la media de la envergadura de los otros aviones---

vuelos -> hora_salida
aviones -> longitud, envergadura

select min(hora_salida) from vuelos, aviones
where vuelos.tipo_avion=aviones.tipo
and longitud < (select avg(envergadura) from aviones)
group by vuelos.num_vuelo;

select min(hora_salida) from vuelos
where tipo_avion in 
    (select tipo from aviones 
    where longitud < (select avg(envergadura) from aviones))
group by vuelos.num_vuelo;

select min(hora_salida) from vuelos
where exists
    (select * from aviones 
    where vuelos.tipo_avion=aviones.tipo
    and longitud < (select avg(envergadura) from aviones))
group by vuelos.num_vuelo;

---6. Obtenga en dos columnas, para cada cuidad que es origen, el numero de vuelos que salen de ella y luego para cada una que es destino, el numero de vuelos que recibe---

vuelos -> origen, destino, num_vuelo

select origen, count(num_vuelo) from vuelos group by origen
union
select destino, count(num_vuelo) from vuelos group by destino
