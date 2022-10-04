create database practica1_61;
use practica1_61;
create table Programador(
Nombre varchar(20) primary key,
Fecha_de_Nacimiento date not null,
Nacionalidad varchar (26)
);
create table Escribe(
Nombre varchar(20) references Programador(Nombre),
Título varchar(20) references Juego(Título),
PRIMARY key (Nombre,Título)
);
create table Juego(
Título varchar(20) primary key,
Idioma varchar(20) not null,
Número_de_Pantallas varchar (10) not null
);    
create table Referencia(
Título varchar(20) references Juego(Título),
PRIMARY key (Título)
);
create table Tiene(
Título varchar(20) references Juego(Título),
Código varchar(16) references Edición(Código),
PRIMARY key (Título,Código)
);
create table Edición(
Código varchar(16) primary key,
Año year
); 
create table Pertenece(
Código varchar(20) references Edición(Código),
Número_de_copia varchar(16) references Copia(Número_de_copia),
PRIMARY key (Código,Número_de_copia)
);
create table Copia(
Número_de_copia varchar(16) primary key
);
create table Adquiere(
Fecha_de_préstamo date not null,
Fecha_de_Devolución date not null,
Precio_alquiler varchar (4),
Número_de_copia varchar(20) references Copia(Número_de_copia),
DNI varchar(10) references Usuario(DNI),
PRIMARY key (Número_de_copia,DNI)
);
create table Usuario(
DNI varchar(10) primary key,
Dirección_Domicilio varchar(50),
Apellido varchar (15),
Nombre_de_Usuario varchar(25)
);


--------------------------------------------------------------------------------------
create database practica1_62;
use practica1_62;
create table Programador(
Nombre varchar(20) primary key,
Fecha_de_Nacimiento date not null,
Nacionalidad varchar (26)
);
create table Escribe(
Nombre varchar(20) references Programador(Nombre),
Título varchar(20) references Juego(Título),
PRIMARY key (Nombre,Título)
);
create table Juego(
Título varchar(20) primary key,
Idioma varchar(20) not null,
Número_de_Pantallas varchar (10) not null
);
create table Edición(
Código varchar(16) primary key,
Año year,
Título varchar(20) references Juego(Título)
);
create table Copia(
Número_de_copia varchar(16) primary key,
Código varchar(20) references Edición(Código)
);
create table Adquiere(
Fecha_de_préstamo date not null,
Fecha_de_Devolución date not null,
Precio_alquiler varchar (4),
Número_de_copia varchar(20) references Copia(Número_de_copia),
DNI varchar(10) references Usuario(DNI),
PRIMARY key (Número_de_copia,DNI)
);
create table Usuario(
DNI varchar(10) primary key,
Dirección_Domicilio varchar(50),
Apellido varchar (15),
Nombre_de_Usuario varchar(25)
);
