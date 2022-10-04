create database practica1_31;
use practica1_31;

create table Tarjetas(
Número_de_Tarjeta varchar(18) primary key,
Nombre varchar(10) not null,
Código_Tarjeta varchar(9) not null,
Fecha_Vencimiento date not null
);

create table Tiene(
Número_de_Tarjeta varchar(18) references Tarjetas(Número_de_Tarjeta),
Código_de_Cliente varchar(20) references Cliente(Código_de_Cliente),
PRIMARY key (Número_de_Tarjeta,Código_de_Cliente)
);

create table Cliente(
Código_de_Cliente varchar(20) primary key,
Nombre varchar(10) not null,
DNI varchar(10),
Fecha_de_Nacimiento date,
Ciudad varchar(15) not null
);    

create table Compra(
Descuento varchar(8) not null,
Código_de_Cliente varchar(20) references Cliente(Código_de_Cliente),
Código_de_Producto varchar(20) references Producto(Código_de_Producto),
PRIMARY key (Código_de_Cliente,Código_de_Producto)
); 

create table Producto(
Código_de_Producto varchar(20) primary key,
Precio varchar(8) not null,
Descripción varchar (50),
Nombre varchar(15) not null,
Color varchar(10) not null
); 

create table Produce(
Código_de_Producto varchar(20) references Producto(Código_de_Producto),
CodFabrica varchar(20) references Fábrica(CodFabrica),
PRIMARY key (Código_de_Producto,CodFabrica)
);

create table Fábrica(
CodFabrica varchar(20) primary key,
Nombre varchar(15) not null,
NúmeroEmpleados varchar(10),
Número_de_Gerente varchar(10) not null,
País varchar (16)
);

create table Vende(
Código_de_Producto varchar(20) references Producto(Código_de_Producto),
Número_Sucursal varchar(10) references Sucursal(Número_Sucursal),
PRIMARY key (Código_de_Producto,Número_Sucursal)
);

create table Sucursal(
Número_Sucursal varchar(10) primary key,
Domicilio varchar(50),
Ciudad varchar(12)
);

create table Trabaja(
Día date not null,
Horario varchar(40) not null,
Número_Sucursal varchar(10) references Sucursal(Número_Sucursal),
Cod_Empleado varchar(10) references Empleado(Cod_Empleado),
PRIMARY key (Número_Sucursal,Cod_Empleado)
);

create table Empleado(
DNI varchar(10) primary key,
Teléfono varchar(9) not null,
Dirección_Domicilio varchar(50),
Nombre varchar(10) not null
);


--------------------------------------------------------------------------------------
create database practica1_32;
use practica1_32;

create table Tarjetas(
Número_de_Tarjeta varchar(18) primary key,
Nombre varchar(10) not null,
Código_Tarjeta varchar(9) not null,
Fecha_Vencimiento date not null,
Código_de_Cliente varchar(20) references Cliente(Código_de_Cliente)
);

create table Cliente(
Código_de_Cliente varchar(20) primary key,
Nombre varchar(10) not null,
DNI varchar(10),
Fecha_de_Nacimiento date,
Ciudad varchar(15) not null
);    

create table Compra(
Descuento varchar(8) not null,
Código_de_Cliente varchar(20) references Cliente(Código_de_Cliente),
Código_de_Producto varchar(20) references Producto(Código_de_Producto),
PRIMARY key (Código_de_Cliente,Código_de_Producto)
);

create table Producto(
Código_de_Producto varchar(20) primary key,
Precio varchar(8) not null,
Descripción varchar (50),
Nombre varchar(15) not null,
Color varchar(10) not null,
CodFabrica varchar(20) references Fábrica(CodFabrica)
); 

create table Fábrica(
CodFabrica varchar(20) primary key,
Nombre varchar(15) not null,
NúmeroEmpleados varchar(10),
Número_de_Gerente varchar(10) not null,
País varchar (16)
);

create table Vende(
Código_de_Producto varchar(20) references Producto(Código_de_Producto),
Número_Sucursal varchar(10) references Sucursal(Número_Sucursal),
PRIMARY key (Código_de_Producto,Número_Sucursal)
);

create table Sucursal(
Número_Sucursal varchar(10) primary key,
Domicilio varchar(50),
Ciudad varchar(12)
);

create table Trabaja(
Día date not null,
Horario varchar(40) not null,
Número_Sucursal varchar(10) references Sucursal(Número_Sucursal),
Cod_Empleado varchar(10) references Empleado(Cod_Empleado),
PRIMARY key (Número_Sucursal,Cod_Empleado)
);

create table Empleado(
DNI varchar(10) primary key,
Teléfono varchar(9) not null,
Dirección_Domicilio varchar(50),
Nombre varchar(10) not null
);