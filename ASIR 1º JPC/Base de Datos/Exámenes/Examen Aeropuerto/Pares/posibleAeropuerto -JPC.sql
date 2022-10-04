---1. Obtenga la matricula de tosdos los aviones de la compañia "Aerolineas Argentinas" que tienen vuelos "Madrid"- "Buenos Aires". No se quieren repeticiones. Con join---
select distinct matricula from flota, vuelos 
where flota.compania=substr(vuelos.num_vuelo, 1, 2)
and compania like "AR"
and (origen like "Madrid" and destino like "Buenos Aires");

---2. Obtenga origen y destino de todos los vuelos cuyos aviones tienen una capacidad de al menos 100 pasajeros y tienen la hora de salida despues de las 8 de la mañana de la compañia "Binter Canarias". Con EXISTS---

select origen,destino from vuelos
where hora_salida > "08:00:00"
and exists(select * from aviones
where butacas >=100
and exists (select * from companias 
where nombre like "Binter C%"))


select * from vuelos
where hora_salida > "08:00:00"
and num_vuelo like "NT%"
and exists(select * from aviones
where butacas >=100
and exists (select * from companias 
where nombre like "Binter C%"))



---3. Obtenga el total de plazas reservas por cada fecha para los realizados desde Bilbao A Madrid o Barcelona ordenandolos de menor a mayor plazas. Con Subselect---
select fecha, sum(plazas) from reservas
where num_vuelo in 
    (select num_vuelo from vuelos where origen like "Bilbao" and (destino like "Madrid" or destino like "Barcelona"))
group by fecha
order by sum(plazas);

---4. Obtenga el nombre y el telefono de las agencias que tienen mas de 100 plazas reservadas para los vuelos con destino Madrid. Sin filas repetidas---

---5. Obtenga la hora de salida mas temprana para cada uno de los vuelos realizados por aviones con una longitud menor que la media de la envergadura de los otros aviones---

---6. Obtenga en dos columnas, para cada cuidad que es origen, el numero de vuelos que salen de ella y luego para cada una que es destino, el numero de vuelos que recibe---

select destino,count(destino) from vuelos
group by destino
union
select origen,count(origen) from vuelos
group by origen;