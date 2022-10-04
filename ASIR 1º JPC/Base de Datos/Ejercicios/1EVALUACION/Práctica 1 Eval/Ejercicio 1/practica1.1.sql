create database practica1_11;
use practica1_11;

create table Planta(
Color varchar(15) primary key,
m2 varchar(10) not null
);

create table Tiene(
Color_Planta varchar(15) references Planta(Color),
Nombre_Proceso varchar(20) references Proceso(Nombre_Proceso),
PRIMARY key (Color_Planta,Nombre_Proceso)
);

create table Proceso(
Nombre_Proceso varchar(15) primary key,
Grado_Complejidad enum("BAJO","MEDIO","ALTO") not null
);

create table Posee(
Color_Planta varchar(15) references Planta(Color),
Número_Identificador varchar(20) references Máquina(Número_Identificador),
primary key (Color_Planta,Número_Identificador)
);

create table Máquina(
Número_Identificador varchar(20) primary key,
Modelo varchar(20) not null,
Marca varchar(20) not null
);

create table Repara(
Número_Identificador varchar(20) references Máquina(Número_Identificador),   
PRIMARY key (Número_Identificador)
);

create table Operada_por(
Fecha_inicio date not null,
Fecha_fin date not null,
Turno enum("Mañana","Tarde","Noche") not null,
DNI varchar(15) references Técnico(DNI),
Número_Identificador varchar(20) references Máquina(Número_Identificador),
PRIMARY key (DNI,Número_Identificador)
);

create table Técnico(
DNI varchar(10) primary key,
Nombre varchar(10) not null,
NºTeléfono varchar(9) not null,
Apellido varchar(15) not null,
Fecha_de_Nacimiento date
);    


show tables;

-----------------------------------------------------------
create database practica1_12;
use practica1_12;

create table Planta(
Color varchar(15) primary key,
m2 varchar(10) not null
);

create table Tiene(
Color_Planta varchar(15) references Planta(Color),
Nombre_Proceso varchar(20) references Proceso(Nombre_Proceso),
PRIMARY key (Color_Planta,Nombre_Proceso)
);

create table Proceso(
Nombre_Proceso varchar(15) primary key,
Grado_Complejidad enum("BAJO","MEDIO","ALTO") not null
);

create table Máquina(
Número_Identificador varchar(20) primary key,
Modelo varchar(20) not null,
Marca varchar(20) not null,
Color varchar(15) references Planta(Color)
);

create table Operada_por(
Fecha_inicio date not null,
Fecha_fin date not null,
Turno enum("Mañana","Tarde","Noche") not null,
DNI varchar(15) references Técnico(DNI),
Número_Identificador varchar(20) references Máquina(Número_Identificador),
PRIMARY key (DNI,Número_Identificador)
);

create table Técnico(
DNI varchar(10) primary key,
Nombre varchar(10) not null,
NºTeléfono varchar(9) not null,
Apellido varchar(15) not null,
Fecha_de_Nacimiento date
);    


show tables;