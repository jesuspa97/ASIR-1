create database practica1_71;
use practica1_71;
create table Cafetería(
Código_de_Cafetería varchar(20) primary key,
Ciudad varchar (15),
Fecha date not null
);
create table Prepara(
Código_de_Cafetería varchar(20) references Cafetería(Código_de_Cafetería),
Código_de_Menú varchar(20) references Menú(Código_de_Menú),
PRIMARY key (Código_de_Cafetería,Código_de_Menú)
);
create table Menú(
Código_de_Menú varchar(20) primary key,
País varchar(15) not null,
Precio varchar (7) not null
);    
create table Relaciona(
Código_de_Menú varchar(20) references Menú(Código_de_Menú),
PRIMARY key (Código_de_Menú)
);
create table Compra(
Código_de_Menú varchar(20) references Menú(Código_de_Menú),
DNI varchar(10) references Cliente(DNI),
PRIMARY key (Código_de_Menú,DNI)
);
create table Cliente(
DNI varchar(10) primary key,
Domicilio varchar(30),
Nombre varchar(15)
); 
create table Utiliza(
DNI varchar(10) references Cliente(DNI),
Código_de_Pago varchar(20) references Método_de_Pago(Código_de_Pago),
PRIMARY key (DNI,Código_de_Pago)
);
create table Método_de_Pago(
Código_de_Pago varchar(20) primary key,
Cantidad varchar(8) not null,
Tipo enum("Tarjeta","Cheque","Efectivo")
);
create table Autoriza(
Fecha_Validez date not null,
Código_de_Pago varchar(20) references Método_de_Pago(Código_de_Pago),
Nombre_del_Banco varchar(20) references Banco(Nombre_del_Banco),
PRIMARY key (Código_de_Pago,Nombre_del_Banco)
);
create table Banco(
Nombre_del_Banco varchar(20) primary key,
Sucursal varchar(50)
);


--------------------------------------------------------------------------------------
create database practica1_72;
use practica1_72;
create table Cafetería(
Código_de_Cafetería varchar(20) primary key,
Ciudad varchar (15),
Fecha date not null,
Código_de_Menú varchar(20) references Menú(Código_de_Menú)
);
create table Menú(
Código_de_Menú varchar(20) primary key,
País varchar(15) not null,
Precio varchar (7) not null
);    
create table Compra(
Código_de_Menú varchar(20) references Menú(Código_de_Menú),
DNI varchar(10) references Cliente(DNI),
PRIMARY key (Código_de_Menú,DNI)
);
create table Cliente(
DNI varchar(10) primary key,
Domicilio varchar(30),
Nombre varchar(15)
);
create table Método_de_Pago(
Código_de_Pago varchar(20) primary key,
Cantidad varchar(8) not null,
Tipo enum("Tarjeta","Cheque","Efectivo"),
DNI varchar(10) references Cliente(DNI),
Nombre_del_Banco varchar(20) references Banco(Nombre_del_Banco)
);
create table Autoriza(
Fecha_Validez date not null,
Código_de_Pago varchar(20) references Método_de_Pago(Código_de_Pago),
Nombre_del_Banco varchar(20) references Banco(Nombre_del_Banco),
PRIMARY key (Código_de_Pago,Nombre_del_Banco)
);
create table Banco(
Nombre_del_Banco varchar(20) primary key,
Sucursal varchar(50)
);