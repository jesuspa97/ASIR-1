create database practica1_91;
use practica1_91;
create table Almacén(
ID_Almacén varchar(20) primary key,
Descripción varchar(50),
Nombre_Almacén varchar(10) not null
);
create table Contiene(
ID_Almacén varchar(20) references Almacén(ID_Almacén),
Letras varchar(4) references Estantería(Letras),
PRIMARY key (ID_Almacén,Letras)
);
create table Estantería(
Letras varchar(4) primary key,
Tamaño varchar(6)
);
create table Ordena(
Nombre varchar(10) not null,
Cantidad varchar(8) not null,
Letras varchar(4) references Estantería(Letras),
Nombre_Ingredientes varchar(20) references Ingredientes(Nombre_Ingredientes),
PRIMARY key (Letras,Nombre_Ingredientes)
);
create table Ingredientes(
Nombre_Ingredientes varchar(20) primary key
);
create table Tiene(
Nombre_Ingredientes varchar(20) references Ingredientes(Nombre_Ingredientes),
Nombre_Plato varchar(20) references Plato(Nombre_Plato),
PRIMARY key (Nombre_Ingredientes,Nombre_Plato)
);
create table Plato(
Nombre_Plato varchar(20) primary key,
Tipo enum("Entrante","Primero","Segundo","Postre"),
PVP varchar(6) not null
);
create table Prepara(
Nombre_Plato varchar(20) references Plato(Nombre_Plato),
DNI varchar(10) references Empleado(DNI),
PRIMARY key (Nombre_Plato,DNI)
);
create table Empleado(
DNI varchar(10) primary key,
Número_SS varchar(12),
Nombre_Empleado varchar(10) not null,
Apellidos varchar(30) not null,
Móvil varchar(9) not null,
Teléfono_Fijo varchar(9),
Cantidad varchar(4) not null
);
create table Cocinero(
DNI varchar(10) primary key,
Número_SS varchar(12),
Nombre_Empleado varchar(10) not null,
Apellidos varchar(30) not null,
Móvil varchar(9) not null,
Teléfono_Fijo varchar(9),
Cantidad varchar(4) not null,
Años_de_Servicio varchar(2) not null
);
create table Pinche(
DNI varchar(10) primary key,
Número_SS varchar(12),
Nombre_Empleado varchar(10) not null,
Apellidos varchar(30) not null,
Móvil varchar(9) not null,
Teléfono_Fijo varchar(9),
Cantidad varchar(4) not null,
Fecha_de_Nacimiento date not null
);
create table Encarga(
DNI varchar(10) references Empleado(DNI),
PRIMARY key (DNI)
);
show tables;

----------------------------------------------------
create database practica1_92;
use practica1_92;
create table Almacén(
ID_Almacén varchar(20) primary key,
Descripción varchar(50),
Nombre_Almacén varchar(10) not null
);
create table Contiene(
ID_Almacén varchar(20) references Almacén(ID_Almacén),
Letras varchar(4) references Estantería(Letras),
PRIMARY key (ID_Almacén,Letras)
);
create table Estantería(
Letras varchar(4) primary key,
Tamaño varchar(6)
);
create table Ordena(
Nombre varchar(10) not null,
Cantidad varchar(8) not null,
Letras varchar(4) references Estantería(Letras),
Nombre_Ingredientes varchar(20) references Ingredientes(Nombre_Ingredientes),
PRIMARY key (Letras,Nombre_Ingredientes)
);
create table Ingredientes(
Nombre_Ingredientes varchar(20) primary key
);
create table Tiene(
Nombre_Ingredientes varchar(20) references Ingredientes(Nombre_Ingredientes),
Nombre_Plato varchar(20) references Plato(Nombre_Plato),
PRIMARY key (Nombre_Ingredientes,Nombre_Plato)
);
create table Plato(
Nombre_Plato varchar(20) primary key,
Tipo enum("Entrante","Primero","Segundo","Postre"),
PVP varchar(6) not null
);
create table Prepara(
Nombre_Plato varchar(20) references Plato(Nombre_Plato),
DNI varchar(10) references Empleado(DNI),
PRIMARY key (Nombre_Plato,DNI)
);
create table Cocinero(
DNI varchar(10) primary key,
Número_SS varchar(12),
Nombre_Empleado varchar(10) not null,
Apellidos varchar(30) not null,
Móvil varchar(9) not null,
Teléfono_Fijo varchar(9),
Cantidad varchar(4) not null,
Años_de_Servicio varchar(2) not null
);
create table Pinche(
DNI varchar(10) primary key,
Número_SS varchar(12),
Nombre_Empleado varchar(10) not null,
Apellidos varchar(30) not null,
Móvil varchar(9) not null,
Teléfono_Fijo varchar(9),
Cantidad varchar(4) not null,
Fecha_de_Nacimiento date not null
);
show tables;