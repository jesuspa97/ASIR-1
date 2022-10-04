create database practica1_81;
use practica1_81;
create table Cochera(
Código_de_Cochera varchar(20) primary key
);
create table Tiene_Asignado(
Código_de_Cochera varchar(20) references Cochera(Código_de_Cochera),
Número varchar(6) references Tren(Número),
Código_de_Estación varchar(20) references Estación(Código_de_Estación),
PRIMARY key (Código_de_Cochera,Número,Código_de_Estación)
);
create table Tren(
Número varchar(6) primary key
);
create table Está_Asociado(
Número varchar(6) references Tren(Número),
Número_de_Línea varchar(6) references Líneas(Número_de_Línea),
PRIMARY key (Número,Número_de_Línea)
);
create table Líneas(
Número_de_Línea varchar(6) primary key
);
create table Pertenece(
Posición varchar(30),
Número_de_Línea varchar(6) references Líneas(Número_de_Línea),
Código_de_Estación varchar(20) references Estación(Código_de_Estación),
PRIMARY key (Número_de_Línea,Código_de_Estación)
);
create table Estación(
Código_de_Estación varchar(20) primary key
);
create table Tiene(
Código_de_Estación varchar(20) references Estación(Código_de_Estación),
Código_de_Acceso varchar(20) references Acceso(Código_de_Acceso),
PRIMARY key (Código_de_Estación,Código_de_Acceso)
);
create table Acceso(
Código_de_Acceso varchar(20) primary key
);
create table Corresponde(
Código_de_Acceso varchar(20) references ACódigo_de_Acceso(Código_de_Acceso),
Número_de_Línea varchar(6) references Líneas(Número_de_Línea),
PRIMARY key (Código_de_Acceso,Número_de_Línea)
);
show tables;
--------------------------------------------------------------------------------------
create database practica1_82;
use practica1_82;
create table Cochera(
Código_de_Cochera varchar(20) primary key,
Código_de_Estación varchar(20) references Estación(Código_de_Estación),
Número varchar(6) references Tren(Número)
);
create table Tren(
Número varchar(6) primary key,
Número_de_Línea varchar(6) references Líneas(Número_de_Línea)
);
create table Líneas(
Número_de_Línea varchar(6) primary key,
Código_de_Estación varchar(20) references Estación(Código_de_Estación)
);
create table Pertenece(
Posición varchar(30),
Número_de_Línea varchar(6) references Líneas(Número_de_Línea),
Código_de_Estación varchar(20) references Estación(Código_de_Estación),
PRIMARY key (Número_de_Línea,Código_de_Estación)
);
create table Estación(
Código_de_Estación varchar(20) primary key
);
create table Acceso(
Código_de_Acceso varchar(20) primary key,
Código_de_Estación varchar(20) references Estación(Código_de_Estación)
);
show tables;