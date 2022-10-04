create database practica1_101;
use practica1_101;
create table Fármaco(
Nombre_Fármaco varchar(30) primary key,
Descripción varchar(50)
);
create table Corresponde(
Nombre_Fármaco varchar(30) references Fármaco(Nombre_Fármaco),
Nombre_Laboratorio varchar(20) references Laboratorio(Nombre_Laboratorio),
PRIMARY key (Nombre_Fármaco,Nombre_Laboratorio)
);
create table Laboratorio(
Nombre_Laboratorio varchar(20) primary key,
Dirección_Laboratorio varchar(50) not null
);
create table Provoca(
Nombre_Fármaco varchar(30) references Fármaco(Nombre_Fármaco),
Nombre_Acción varchar(25) references Acción(Nombre_Acción),
PRIMARY key (Nombre_Fármaco,Nombre_Acción)
);
create table Acción(
Nombre_Acción varchar(25) primary key,
Descripción varchar(50)
);
create table Se_Distribuye(
Nombre_Fármaco varchar(30) references Fármaco(Nombre_Fármaco),
Nombre_Medicamento varchar(30) references Venta(Nombre_Medicamento),
PRIMARY key (Nombre_Fármaco,Nombre_Medicamento)
);
create table Venta(
Nombre_Medicamento varchar(30) primary key,
Cantidad varchar(15) not null,
PVP varchar(6) not null,
Fecha_de_Venta date not null
);
create table Realiza(
Nombre_Medicamento varchar(30) references Venta(Nombre_Medicamento),
Nombre_Vendedor varchar(12) references Farmacia(Nombre_Vendedor),
PRIMARY key (Nombre_Medicamento,Nombre_Vendedor)
);
create table Farmacia(
Nombre_Vendedor varchar(12) primary key,
Dirección varchar(50) not null,
Teléfono varchar(9) not null
);
create table Compra(
Nombre_Medicamento varchar(30) references Venta(Nombre_Medicamento),
Nombre_Cliente varchar(12) references Cliente(Nombre_Cliente),
PRIMARY key (Nombre_Medicamento,Nombre_Cliente)
);
create table Cliente(
Nombre_Cliente varchar(12) primary key,
Dirección varchar(50) not null
);
----------------------------------------------------
create database practica1_102;
use practica1_102;
create table Fármaco(
Nombre_Fármaco varchar(30) primary key,
Descripción varchar(50),
Nombre_Laboratorio varchar(20) references Laboratorio(Nombre_Laboratorio)
);
create table Corresponde(
Nombre_Fármaco varchar(30) references Fármaco(Nombre_Fármaco),
Nombre_Laboratorio varchar(20) references Laboratorio(Nombre_Laboratorio),
PRIMARY key (Nombre_Fármaco,Nombre_Laboratorio)
);
create table Laboratorio(
Nombre_Laboratorio varchar(20) primary key,
Dirección_Laboratorio varchar(50) not null
);
create table Provoca(
Nombre_Fármaco varchar(30) references Fármaco(Nombre_Fármaco),
Nombre_Acción varchar(25) references Acción(Nombre_Acción),
PRIMARY key (Nombre_Fármaco,Nombre_Acción)
);
create table Acción(
Nombre_Acción varchar(25) primary key,
Descripción varchar(50)
);
create table Se_Distribuye(
Nombre_Fármaco varchar(30) references Fármaco(Nombre_Fármaco),
Nombre_Medicamento varchar(30) references Venta(Nombre_Medicamento),
PRIMARY key (Nombre_Fármaco,Nombre_Medicamento)
);
create table Venta(
Nombre_Medicamento varchar(30) primary key,
Cantidad varchar(15) not null,
PVP varchar(6) not null,
Fecha_de_Venta date not null
);
create table Realiza(
Nombre_Medicamento varchar(30) references Venta(Nombre_Medicamento),
Nombre_Vendedor varchar(12) references Farmacia(Nombre_Vendedor),
PRIMARY key (Nombre_Medicamento,Nombre_Vendedor)
);
create table Farmacia(
Nombre_Vendedor varchar(12) primary key,
Dirección varchar(50) not null,
Teléfono varchar(9) not null
);
create table Compra(
Nombre_Medicamento varchar(30) references Venta(Nombre_Medicamento),
Nombre_Cliente varchar(12) references Cliente(Nombre_Cliente),
PRIMARY key (Nombre_Medicamento,Nombre_Cliente)
);
create table Cliente(
Nombre_Cliente varchar(12) primary key,
Dirección varchar(50) not null
);