CREATE DATABASE tienda;
USE tienda;
CREATE TABLE fabricante (
 codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL
);

select * from fabricante;

Insert into fabricante(nombre) values("Asus");
Insert into fabricante(nombre) values("Lenovo");
Insert into fabricante(nombre) values("Hewlett-Packard");
Insert into fabricante(nombre) values("Samsung");
Insert into fabricante(nombre) values("Seagate");
Insert into fabricante(nombre) values("Crucial");
Insert into fabricante(nombre) values("Gigabyte");
Insert into fabricante(nombre) values("Huawei");
Insert into fabricante(nombre) values("Xiaomi");

-----------------------------------------------------------------------------------

CREATE TABLE producto (
 codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 precio DOUBLE NOT NULL,
 codigo_fabricante INT UNSIGNED NOT NULL REFERENCES fabricante(codigo)
);

select * from producto;

Insert into producto(nombre,precio,codigo_fabricante) values("Disco duro SATA3 1TB",86.99,5);
Insert into producto(nombre,precio,codigo_fabricante) values("Memoria RAM DDR4 8GB",120,6);
Insert into producto(nombre,precio,codigo_fabricante) values("Disco SSD 1 TB",150.99,4);
Insert into producto(nombre,precio,codigo_fabricante) values("GeForce GTX 1050Ti",185,7);
Insert into producto(nombre,precio,codigo_fabricante) values("GeForce GTX 1080 Xtreme"755,6);
Insert into producto(nombre,precio,codigo_fabricante) values("Monitor 24 LED Full HD",202,1);
Insert into producto(nombre,precio,codigo_fabricante) values("Monitor 27 LED Full HD",245.99,1);
Insert into producto(nombre,precio,codigo_fabricante) values("Portátil Yoga 520",559,2);
Insert into producto(nombre,precio,codigo_fabricante) values("Portátil Ideapad 3200",444,2);
Insert into producto(nombre,precio,codigo_fabricante) values("Impresora HP Deskjet 3720",59.99,3);
Insert into producto(nombre,precio,codigo_fabricante) values("Impresora HP Laserjet Pro M26nw",180,3);

-----------------------------------------------------------------------------------
• Inserta un nuevo fabricante indicando solamente su nombre.
Insert into fabricante(nombre) values("DELL");
• Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de
inserción debe incluir: código, nombre, precio y código_fabricante.
Insert into producto(nombre,precio,codigo_fabricante) values("Teclado Mecánico G915",204,69);
• Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de
inserción debe incluir: nombre, precio y código_fabricante.
Insert into producto(nombre,precio,codigo_fabricante) values("Teclado Mecánico G916",205,70);
• Elimina el fabricante Asus. ¿Es posible eliminarlo?
delete from fabricante where nombre="Asus";---> SI, es posible.
• Elimina el fabricante Xiaomi. ¿Es posible eliminarlo?
delete from fabricante where nombre="Xiaomi";---> SI, es posible.
• Actualiza el código del fabricante Lenovo y asígnale el valor 20 como código, ¿es
posible?
update fabricante set codigo="20" where codigo="2";---> SI,es posible.
• Actualiza el nombre del fabricante 3 por “HP”.
update fabricante set nombre="HP" where codigo="3";
• Actualiza el nombre del producto con id 2 por “ Memoria RAM DDR4 16GB”
update producto set nombre="Memoria RAM DDR4 16GB" where codigo="2";---> SI,es posible
• Actualiza el precio de todos los productos sumándole 5 € al precio actual.
update producto set precio=precio+5;
• Muestra todos los productos que cuesten más de 100 euros.
select * from producto where precio>100;
• Muestra todos los productos del fabricante 1.
select * from producto where codigo_fabricante=1;
• Muestra las columnas nombre y precio de todos los productos.
select nombre,precio from producto;