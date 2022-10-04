create database colegio;
use colegio;

create table alumno (
id INT primary key,
nombre varchar (20) not null,
apellido1 varchar (20) not null,
apellido2 varchar (20),
fecha_nacimiento date not null,
es_repetidor enum("si","no") not null,
telefono varchar(9)
);

Insert into alumno values(1,"María","Pérez","Sánchez","1990-2-13","no",null);
Insert into alumno values(2,"Marta","Pérez","Sánchez","2004-8-3","no",912345678);
Insert into alumno values(3,"Vinisius","Junior","Ssantos","1999-5-14","no",null);

select * from alumno;

update alumno set telefono="999999999" where nombre="Vinisius";
update alumno set es_repetidor="SI" where nombre="Vinisius";

insert into alumno (id,nombre,apellido1,fecha_nacimiento,es_repetidor)
values(
4,
"Alfredo",
"Duro",
"1942-5-25",
"SI"); 