create database practica1_21;
use practica1_21;

create table Clientes(
DNI varchar(10) primary key,
Nombre varchar(10) not null,
Teléfono varchar(9) not null,
Dirección varchar(50)
);

create table Participa(
DNI varchar(10) references Clientes(DNI),
Factura varchar(20) references Ventas(Factura),
PRIMARY key (DNI,Factura)
);

create table Ventas(
Factura varchar(20) primary key,
Fecha date not null,
Descuento varchar(8) not null,
Monto_final varchar(16) not null
);    

create table Asociadas(
Factura varchar(20) references Ventas(Factura),
Identificador varchar(20) references Productos(Identificador),
PRIMARY key (Factura,Identificador)
);

create table Productos(
Identificador varchar(20) primary key,
Stock varchar(8) not null,
Nombre varchar(15) not null,
Precio varchar(8) not null
); 

create table Pertenece_a(
Identificador varchar(20) references Productos(Identificador),
IDE varchar(20) references Categorías(IDE),
PRIMARY key (Identificador,IDE)
);

create table Categorías(
IDE varchar(20) primary key,    
Nombre varchar(15) not null,
Descripción varchar (50)
);

create table Entrega(
Identificador varchar(20) references Productos(Identificador),
CIF varchar(10) references Proveedores(CIF),
PRIMARY key (Identificador,CIF)    
);

create table Proveedores(    
CIF varchar(10) primary key,
Nombre varchar(10) not null,
Teléfono varchar(9) not null,
Dirección varchar(50),
Web varchar(120)
);

show tables;



--------------------------------------------------------------------------------------
create database practica1_22;
use practica1_22;

create table Clientes(
DNI varchar(10) primary key,
Nombre varchar(10) not null,
Teléfono varchar(9) not null,
Dirección varchar(50),
Factura varchar(20) references Ventas(Factura)
);

create table Ventas(
Factura varchar(20) primary key,
Fecha date not null,
Descuento varchar(8) not null,
Monto_final varchar(16) not null
);    

create table Asociadas(
Factura varchar(20) references Ventas(Factura),
Identificador varchar(20) references Productos(Identificador),
PRIMARY key (Factura,Identificador)
);

create table Productos(
Identificador varchar(20) primary key,
Stock varchar(8) not null,
Nombre varchar(15) not null,
Precio varchar(8) not null,
IDE varchar(20) references Categorías(IDE)
);

create table Categorías(
IDE varchar(20) primary key,    
Nombre varchar(15) not null,
Descripción varchar (50)
);

create table Proveedores(    
CIF varchar(10) primary key,
Nombre varchar(10) not null,
Teléfono varchar(9) not null,
Dirección varchar(50),
Web varchar(120),
Identificador varchar(20) references Productos(Identificador)
);
show tables;