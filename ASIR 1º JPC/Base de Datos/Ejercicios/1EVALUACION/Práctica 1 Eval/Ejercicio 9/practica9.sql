create database practica1;


use practica1;

 

create table Alumno(
ID_Alumno int primary key auto_increment,
Nombre varchar(20) not null,
Apellidos varchar(50) not null,
Edad INT check (Edad>=18),
Grado ENUM ("ASIR","MECANICA","TELECO"),
Sexo ENUM ("Masculino","Femenino","No Binario","Patata_Agresiva"),
Telefono varchar(9) unique,
Ciudad varchar(20) default "MADRID"
);


create table Profesor(
ID_Profesor int primary key auto_increment,
Nombre varchar(20) not null,
Apellidos varchar(50) not null,
Edad INT check (Edad>=26),
Grado ENUM ("ASIR","MECANICA","TELECO"),
Sexo ENUM ("Masculino","Femenino","No Binario","Patata_Agresiva"),
Telefono varchar(9) unique,
Ciudad varchar(20) default "MADRID"
);



create table Enseña(
ID_Alumno int references Alumno(ID_Alumno),
ID_Profesor int references Profesor(ID_Profesor),
Fecha_Entrada datetime not null,
Fecha_Salida datetime not null,
Calidad ENUM ("Excelente","Bien","Regular","Mal") not null,
PRIMARY key (ID_Alumno,ID_Profesor)
);




ALTER TABLE Alumno modify Sexo ENUM ("Hombre","Mujer","No_Binario","Patata_Furiosa","Prefiero_No_contestar");