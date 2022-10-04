create database practica1_51;
use practica1_51;

create table Época(
Nombre varchar(20) primary key,
Características varchar(100) not null,
Año_Final year not null,
Año_Inicio year not null
);

create table Tiene(
Nombre varchar(20) references Época(Nombre),
Nombre_de_Género varchar(20) references Género(Nombre_de_Género),
PRIMARY key (Nombre,Nombre_de_Género)
);

create table Género(
Nombre_de_Género varchar(20) primary key,
Características varchar(100) not null,
Origen varchar (30) not null
);
create table Usa(
Nombre_de_Género varchar(20) references Género(Nombre_de_Género),
Nombre_de_Idioma varchar(20) references Idioma(Nombre_de_Idioma),
PRIMARY key (Nombre_de_Género,Nombre_de_Idioma)
);

create table Idioma(
Nombre_de_Idioma varchar(20) primary key,
Símbolo varchar (30) not null,
Lugar varchar (50),
Foto int
); 
create table Pertenece(
Nombre_de_Idioma varchar(20) references Idioma(Nombre_de_Idioma),
Nombre_de_Escritor varchar(16) references Escritor(Nombre_de_Escritor),
PRIMARY key (Nombre_de_Idioma,Nombre_de_Escritor)
);

create table Escritor(
Nombre_de_Escritor varchar(16) primary key,
Año_Inicio year not null,
Año_Final year not null,
Historia varchar(150)
);

create table Formado_por(
Nombre_de_Escritor varchar(20) references Escritor(Nombre_de_Escritor),
Nombre_de_Obra varchar(26) references Obra(Nombre_de_Obra),
PRIMARY key (Nombre_de_Escritor,Nombre_de_Obra)
);

create table Obra(
Nombre_de_Obra varchar(26) primary key,
Contenido varchar(80),
Año year
);


--------------------------------------------------------------------------------------
create database practica1_52;
use practica1_52;

create table Época(
Nombre varchar(20) primary key,
Características varchar(100) not null,
Año_Final year not null,
Año_Inicio year not null
);

create table Género(
Nombre_de_Género varchar(20) primary key,
Características varchar(100) not null,
Origen varchar (30) not null,
Nombre varchar(20) references Época(Nombre)
);    

create table Usa(
Nombre_de_Género varchar(20) references Género(Nombre_de_Género),
Nombre_de_Idioma varchar(20) references Idioma(Nombre_de_Idioma),
PRIMARY key (Nombre_de_Género,Nombre_de_Idioma)
);

create table Idioma(
Nombre_de_Idioma varchar(20) primary key,
Símbolo varchar (30) not null,
Lugar varchar (50),
Foto int
); 

create table Pertenece(
Nombre_de_Idioma varchar(20) references Idioma(Nombre_de_Idioma),
Nombre_de_Escritor varchar(16) references Escritor(Nombre_de_Escritor),
PRIMARY key (Nombre_de_Idioma,Nombre_de_Escritor)
);

create table Escritor(
Nombre_de_Escritor varchar(16) primary key,
Año_Inicio year not null,
Año_Final year not null,
Historia varchar(150)
);

create table Formado_por(
Nombre_de_Escritor varchar(20) references Escritor(Nombre_de_Escritor),
Nombre_de_Obra varchar(26) references Obra(Nombre_de_Obra),
PRIMARY key (Nombre_de_Escritor,Nombre_de_Obra)
);

create table Obra(
Nombre_de_Obra varchar(26) primary key,
Contenido varchar(80),
Año year,
Nombre_de_Género varchar(20) references Género(Nombre_de_Género)
);