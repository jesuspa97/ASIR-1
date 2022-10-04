create database practica1_41;
use practica1_41;

create table Televidente(
Email varchar(50) primary key,
Username varchar(20) not null,
Password varchar(20) not null,
Foto int,
Fecha_de_Registro date not null
);

create table Realiza(
Email varchar(50) references Televidente(Email),
ID_del_Comentario varchar(20) references Comentario(ID_del_Comentario),
PRIMARY key (Email,ID_del_Comentario)
);

create table Comentario(
ID_del_Comentario varchar(20) primary key,
Texto varchar(200) not null
);    

create table Valora(
ID_del_Comentario varchar(20) references Comentario(ID_del_Comentario),
Título varchar(20) references Nota(Título),
PRIMARY key (ID_del_Comentario,Título)
);

create table Nota(
Título varchar(20) primary key,
Imagen int not null,
Contenido varchar (150),
Resumen varchar(50) not null
); 

create table Comenta(
Título varchar(20) references Nota(Título),
Nombre varchar(16) references Programa(Nombre),
PRIMARY key (Título,Nombre)
);

create table Programa(
Nombre varchar(16) primary key,
Conductor varchar(10),
Horario varchar(16) not null,
Descripción varchar(50)
);

create table Tiene(
Título varchar(20) references Producto(Título),
Nombre varchar(16) references Categoría(Nombre),
PRIMARY key (Título,Nombre)
);

create table Categoría(
Nombre varchar(16) primary key,
Descripción varchar(50),
Imagen int
);


--------------------------------------------------------------------------------------
create database practica1_42;
use practica1_42;

create table Televidente(
Email varchar(50) primary key,
Username varchar(20) not null,
Password varchar(20) not null,
Foto int,
Fecha_de_Registro date not null
);

create table Comentario(
ID_del_Comentario varchar(20) primary key,
Texto varchar(200) not null,
Email varchar(50) references Televidente(Email),
Título varchar(20) references Nota(Título)
);    

create table Nota(
Título varchar(20) primary key,
Imagen int not null,
Contenido varchar (150),
Resumen varchar(50) not null,
Nombre varchar(16) references Programa(Nombre)
); 

create table Programa(
Nombre varchar(16) primary key,
Conductor varchar(10),
Horario varchar(16) not null,
Descripción varchar(50)
);

create table Tiene(
Título varchar(20) references Producto(Título),
Nombre varchar(16) references Categoría(Nombre),
PRIMARY key (Título,Nombre)
);

create table Categoría(
Nombre varchar(16) primary key,
Descripción varchar(50),
Imagen int
);