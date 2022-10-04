***PROBLEMA1***
CREATE DATABASE Biblioteca;
USE Biblioteca;
create table Autor (
    Código varchar(5) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    País VARCHAR(20) NOT NULL,
    A_nac INT NOT NULL,
    Ciudad VARCHAR(20) NOT NULL,
    A_fall INT,
    Recibe_Influencias VARCHAR(30),
    Estudios VARCHAR(30)
);

"1. Crea los insert para funcione."
Insert into Autor(Código,Nombre,País,A_nac,Ciudad,A_fall,Recibe_Influencias,Estudios) values("DUL","Dulac, George","Francia",1922,"Nantes",NULL,NULL,"La Sorbonne");
Insert into Autor(Código,Nombre,País,A_nac,Ciudad,A_fall,Recibe_Influencias,Estudios) values("BER","Bertomeu,Andrés","España",1919,"Barcelona",1995,NULL,"Univ.Valencia");
Insert into Autor(Código,Nombre,País,A_nac,Ciudad,A_fall,Recibe_Influencias,Estudios) values("USO","Uosiken, Fred ","Finlandia",1958,"Helsinki",NULL,"Kröpotkin","Univ.Uppsala");
Insert into Autor(Código,Nombre,País,A_nac,Ciudad,A_fall,Recibe_Influencias,Estudios) values("MUL","Müller, Klaus","Alemania",1720,"Düsseldorf",1792,NULL,"Univ.Viena");
Insert into Autor(Código,Nombre,País,A_nac,Ciudad,A_fall,Recibe_Influencias,Estudios) values("LLO","Llorens, Antonia","España ",1959,"Gerona ",NULL,"Dion,Montenegro","Univ.Granada");
Insert into Autor(Código,Nombre,País,A_nac,Ciudad,A_fall,Recibe_Influencias,Estudios) values("LEV","Leverling, Janet ","EEUU",1969,"Seattle",NULL,"Müller, Santos","Univ.Harvard");
Insert into Autor(Código,Nombre,País,A_nac,Ciudad,A_fall,Recibe_Influencias,Estudios) values("KROP"," Kröpotkin,Albert","Alemania",1842,"Berlín ",1897,NULL,"Univ.París");
Insert into Autor(Código,Nombre,País,A_nac,Ciudad,A_fall,Recibe_Influencias,Estudios) values("BAZ","Bazilian, Eric","EEUU",1969,"Atlanta",NULL,"Samuel Becket","Univ.Stanfield");
"2. Muestra todos los datos"
select * from Autor;
"3. Actualiza las Influencia de los que el Pais es Alemania a “ Nietzsche”."
update Autor set Recibe_Influencias="Nietzsche" where País="Alemania";
"4. Actualiza los que tienen un año de nacimiento antes de 1900, su influencia es “Otra”."
update Autor set Recibe_Influencias="Otra" where A.nac<1900;
"5. Modifica el País EEUU por USA."
update Autor set País="USA" where País="EEUU";
"6. La univ de Granada se cierra, cambiamos a la de Salamanca a todos sus alumnos."
update Autor set Estudios="Univ.Salamanca" where Estudios="Univ.Granada";
"7. Muestra los nombres de la tabla"
select Nombre from Autor;
"8. Muestra los países sin repetir"
select distinct País from Autor;
"9. Muestra los que han nacido después de 1940"
select * from Autor where A.nac.<1940;
"10. Muestra los que han nacido en EEUU ordenados por año de nacimiento"
select * from Autor where País="EEUU" order by A.nac.;
"11. Muestra los nombres de los que no tienen influencias"
select * from Autor where Recibe_Influencias="NULL";
"12. Muestra los autores de “Barcelona” o que hayan nacido en el siglo XX ordenado por Nombre"
select * from Autor where Ciudad="Barcelona" or A.nac.>1900;
"13. Borra los autores que hayan nacido entre 1920 y 1940."
delete from Autor where A.nac.>1920 and A.nac.<1940;
"14. Borra los autores de la universidad de Paris que hayan nacido después de 1900."
delete from Autor where Estudios="Univ.París" and A.nac.>1900;
"15. Borra los autores de Filandia. "
delete from Autor País="Finlandia";


------------------------------------------------------------------------------------------------

***PROBLEMA2***
CREATE DATABASE Colegio ;
USE Colegio;

CREATE TABLE Alumno (
 Id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Nombre VARCHAR(100) NOT NULL,
 Apellido1 VARCHAR(100) NOT NULL,
 Apellido2 VARCHAR(100),
 Fecha_nacimiento DATE NOT NULL,
 Es_repetidor ENUM("SÍ","NO") NOT NULL,
 Teléfono VARCHAR(9)
);

INSERT INTO Alumno VALUES(1,"María","Sánchez","Pérez","1990-12-01","NO",NULL);
INSERT INTO Alumno VALUES(2,"Juan","Sáez","Vega","1998-04-02","NO",618253876);
INSERT INTO Alumno VALUES(3,"Pepe","Ramírez","Gea","1988-01-03","NO",NULL);
INSERT INTO Alumno VALUES(4,"Lucía","Sánchez","Ortega","1993-06-13","SÍ",678516294);
INSERT INTO Alumno VALUES(5,"Paco","Martínez","López","1995-11-24","NO",692735409);
INSERT INTO Alumno VALUES(6,"Irene","Gutiérrez","Sánchez","1991-03-28","SÍ",NULL);
INSERT INTO Alumno VALUES(7,"Cristina","Fernández","Ramírez","1996-09-17","NO",628349590);
INSERT INTO Alumno VALUES(8,"Antonio","Carretero","Ortega","1994-05-20","SÍ",612345633);
INSERT INTO Alumno VALUES(9,"Manuel","Domínguez","Hernández","1999-07-08","NO",NULL);
INSERT INTO Alumno VALUES(10,"Daniel","Moreno","Ruiz","1998-02-03","NO",NULL);


"1. Obtener todos los datos de todos los alumnos matriculados en el curso."
select * from Alumno;
"2. Obtener el nombre de todos los alumnos."
select Nombre from Alumno;
"3. Obtener el nombre y los apellidos de todos los alumnos."
select Nombre,Apellido1,Apellido2 from Alumno;
"4. Obtener el nombre y los apellidos de todos los alumnos, ordenados por su primer apellido de forma ascendente."
select Nombre,Apellido1,Apellido2 from Alumno order by Apellido1;
"5. Obtener el nombre de todos los alumnos que su primer apellido sea Martínez."
select Nombre from Alumno where Apellido1="Martínez";
"6. Obtener todos los datos del alumno que tiene un id igual a 9."
select * from Alumno where id=9;
"7. Obtener el nombre y la fecha de nacimiento de todos los alumnos nacieron después del 1 de enero de 1997."
select Nombre,Fecha_nacimiento from Alumno where Fecha_nacimiento > "1997-01-01";
"8. Devuelve los datos del alumno cuyo id es igual a 1."
select * from Alumno where Id=1;
"9. Devuelve los datos del alumno cuyo teléfono es igual a 692735409."
select * from Alumno where Teléfono=692735409;
"10. Devuelve un listado de todos los alumnos que son repetidores."
select * from Alumno where Es_repetidor="SÍ";
"11. Devuelve un listado de todos los alumnos que no son repetidores."
select * from Alumno where Es_repetidor="NO";
"12. Devuelve el listado de los alumnos que han nacido antes del 1 de enero de 1993."
select * from Alumno where Fecha_nacimiento < "1993-01-01";
"13. Devuelve el listado de los alumnos que han nacido después del 1 de enero de 1994."
select * from Alumno where Fecha_nacimiento > "1994-01-01";
"14. Devuelve el listado de los alumnos que han nacido después del 1 de enero de 1994 y no son repetidores."
select * from Alumno where Fecha_nacimiento > "1994-01-01" and Es_repetidor="NO";
"15. Devuelve el listado de todos los alumnos que nacieron en 1998 o en 1999."
select * from Alumno where Fecha_nacimiento between "1998-01-01" and "1998-12-31" or Fecha_nacimiento between "1999-01-01" and "1999-12-31";
"16. Devuelve el listado de todos los alumnos que no nacieron en 1998."
select * from Alumno where not Fecha_nacimiento between "1998-01-01" and "1998-12-31";
"17. Obtener la lista de alumnos que no tienen un valor NULL en la columna teléfono."
select * from Alumno where not Teléfono="NULL"; 
"18. Obtener la lista de alumnos que tienen un valor NULL en la columna teléfono y no es repetidor."
select * from Alumno where Teléfono is NULL and Es_repetidor="NO";
"19. Obtener la lista de alumnos que tienen un valor NULL en la columna teléfono o no es repetidor."
select * from Alumno where Teléfono is NULL or Es_repetidor="NO";