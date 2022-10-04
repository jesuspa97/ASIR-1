select @@autocommit;
set autocommit=0;

---------TIENDA.SQL---------

---1. Inserta un nuevo fabricante indicando su código y su nombre.
start transaction;
insert into fabricante values(10,"Sony");
commit;

mysql> select * from fabricante;
+--------+-----------------+
| codigo | nombre          |
+--------+-----------------+
|      1 | Asus            |
|      2 | Lenovo          |
|      3 | Hewlett-Packard |
|      4 | Samsung         |
|      5 | Seagate         |
|      6 | Crucial         |
|      7 | Gigabyte        |
|      8 | Huawei          |
|      9 | Xiaomi          |
|     10 | Sony            |
+--------+-----------------+
10 rows in set (0.00 sec)

---2. Inserta un nuevo fabricante indicando solamente su nombre.
start transaction;
insert into fabricante (nombre) values("Nvidia");
commit;

mysql> select * from fabricante;
+--------+-----------------+
| codigo | nombre          |
+--------+-----------------+
|      1 | Asus            |
|      2 | Lenovo          |
|      3 | Hewlett-Packard |
|      4 | Samsung         |
|      5 | Seagate         |
|      6 | Crucial         |
|      7 | Gigabyte        |
|      8 | Huawei          |
|      9 | Xiaomi          |
|     10 | Sony            |
|     11 | Nvidia          |
+--------+-----------------+
11 rows in set (0.00 sec)

---3. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe incluir: código, nombre, precio y código_fabricante.
start transaction;
insert into producto values(12,"Home Cinema MK1",149.99,10);
commit;


mysql> select * from producto;
+--------+---------------------------------+--------+-------------------+
| codigo | nombre                          | precio | codigo_fabricante |
+--------+---------------------------------+--------+-------------------+
|      1 | Disco duro SATA3 1TB            |  86.99 |                 5 |
|      2 | Memoria RAM DDR4 8GB            |    120 |                 6 |
|      3 | Disco SSD 1 TB                  | 150.99 |                 4 |
|      4 | GeForce GTX 1050Ti              |    185 |                 7 |
|      5 | GeForce GTX 1080 Xtreme         |    755 |                 6 |
|      6 | Monitor 24 LED Full HD          |    202 |                 1 |
|      7 | Monitor 27 LED Full HD          | 245.99 |                 1 |
|      8 | Portátil Yoga 520               |    559 |                 2 |
|      9 | Portátil Ideapd 320             |    444 |                 2 |
|     10 | Impresora HP Deskjet 3720       |  59.99 |                 3 |
|     11 | Impresora HP Laserjet Pro M26nw |    180 |                 3 |
|     12 | Home Cinema MK1                 | 149.99 |                10 |
+--------+---------------------------------+--------+-------------------+
12 rows in set (0.00 sec)

---4. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe incluir: nombre, precio y código_fabricante.
start transaction;
insert into producto (nombre,precio,codigo_fabricante) values ("GeForce 3080Ti",1300,11);
commit;

mysql> select * from producto;
+--------+---------------------------------+--------+-------------------+
| codigo | nombre                          | precio | codigo_fabricante |
+--------+---------------------------------+--------+-------------------+
|      1 | Disco duro SATA3 1TB            |  86.99 |                 5 |
|      2 | Memoria RAM DDR4 8GB            |    120 |                 6 |
|      3 | Disco SSD 1 TB                  | 150.99 |                 4 |
|      4 | GeForce GTX 1050Ti              |    185 |                 7 |
|      5 | GeForce GTX 1080 Xtreme         |    755 |                 6 |
|      6 | Monitor 24 LED Full HD          |    202 |                 1 |
|      7 | Monitor 27 LED Full HD          | 245.99 |                 1 |
|      8 | Portátil Yoga 520               |    559 |                 2 |
|      9 | Portátil Ideapd 320             |    444 |                 2 |
|     10 | Impresora HP Deskjet 3720       |  59.99 |                 3 |
|     11 | Impresora HP Laserjet Pro M26nw |    180 |                 3 |
|     12 | Home Cinema MK1                 | 149.99 |                10 |
|     13 | GeForce 3080Ti                  |   1300 |                11 |
+--------+---------------------------------+--------+-------------------+
13 rows in set (0.00 sec)

---5. Crea una nueva tabla con el nombre fabricante_productos que tenga las siguientes columnas: nombre_fabricante, nombre_producto y precio. Una vez creada la tabla inserta todos los registros de la base de datos tienda en esta tabla haciendo uso de única operación de inserción.
start transaction;
create table fabricante_productos (
    nombre_fabricante varchar(50),
    nombre_producto varchar(50),
    precio float
);
insert into fabricante_productos(nombre_fabricante,nombre_producto,precio) select fabricante.nombre,producto.nombre,producto.precio from fabricante,producto where fabricante.codigo=producto.codigo_fabricante;
commit;

mysql> select * from fabricante_productos;
+-------------------+---------------------------------+--------+
| nombre_fabricante | nombre_producto                 | precio |
+-------------------+---------------------------------+--------+
| Seagate           | Disco duro SATA3 1TB            |  86.99 |
| Crucial           | Memoria RAM DDR4 8GB            |    120 |
| Samsung           | Disco SSD 1 TB                  | 150.99 |
| Gigabyte          | GeForce GTX 1050Ti              |    185 |
| Crucial           | GeForce GTX 1080 Xtreme         |    755 |
| Asus              | Monitor 24 LED Full HD          |    202 |
| Asus              | Monitor 27 LED Full HD          | 245.99 |
| Lenovo            | Portátil Yoga 520               |    559 |
| Lenovo            | Portátil Ideapd 320             |    444 |
| Hewlett-Packard   | Impresora HP Deskjet 3720       |  59.99 |
| Hewlett-Packard   | Impresora HP Laserjet Pro M26nw |    180 |
| Sony              | Home Cinema MK1                 | 149.99 |
| Nvidia            | GeForce 3080Ti                  |   1300 |
+-------------------+---------------------------------+--------+
13 rows in set (0.00 sec)

---6. Crea una vista con el nombre vista_fabricante_productos que tenga las siguientes columnas: nombre_fabricante, nombre_producto y precio.
start transaction;
create view vista_fabricante_productos as(select nombre_fabricante, nombre_producto ,precio from fabricante_productos);

mysql> show tables;
+----------------------------+
| Tables_in_tienda           |
+----------------------------+
| fabricante                 |
| fabricante_productos       |
| producto                   |
| vista_fabricante_productos |
+----------------------------+
4 rows in set (0.00 sec)

describe vista_fabricante_productos;

mysql> describe vista_fabricante_productos;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| nombre_fabricante | varchar(50) | YES  |     | NULL    |       |
| nombre_producto   | varchar(50) | YES  |     | NULL    |       |
| precio            | double      | YES  |     | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)

select * from vista_fabricante_productos;

mysql> select * from vista_fabricante_productos;
+-------------------+---------------------------------+--------+
| nombre_fabricante | nombre_producto                 | precio |
+-------------------+---------------------------------+--------+
| Seagate           | Disco duro SATA3 1TB            |  86.99 |
| Crucial           | Memoria RAM DDR4 8GB            |    120 |
| Samsung           | Disco SSD 1 TB                  | 150.99 |
| Gigabyte          | GeForce GTX 1050Ti              |    185 |
| Crucial           | GeForce GTX 1080 Xtreme         |    755 |
| Asus              | Monitor 24 LED Full HD          |    202 |
| Asus              | Monitor 27 LED Full HD          | 245.99 |
| Lenovo            | Portátil Yoga 520               |    559 |
| Lenovo            | Portátil Ideapd 320             |    444 |
| Hewlett-Packard   | Impresora HP Deskjet 3720       |  59.99 |
| Hewlett-Packard   | Impresora HP Laserjet Pro M26nw |    180 |
| Sony              | Home Cinema MK1                 | 149.99 |
| Nvidia            | GeForce 3080Ti                  |   1300 |
+-------------------+---------------------------------+--------+
13 rows in set (0.00 sec)

commit;



---7. Elimina el fabricante Asus. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
start transaction;
delete from fabricante where nombre like "Asus";

mysql> delete from fabricante where nombre like "Asus";
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`tienda`.`producto`, CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`codigo_fabricante`) REFERENCES `fabricante` (`codigo`))

---Para poder eliminar Asus debemos quitar la clave heredada del campo nombre.Usaremos el siguiente comando
alter table producto drop foreign key producto_ibfk_1;

commit;

"NO podemos borrar el nombre ASUS ya que esa tabla está enlazada y comparte una clave con otra tabla. Para poder eliminarlo, deberíamos eliminar el valor de la tabla producto y después en la tabla fabricante"


---8. Elimina el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
start transaction;
delete from fabricante where nombre like "Xiaomi";
commit;

"En éste caso SI podemos eliminarlo ya que Xiaomi no aparece en la tabla producto(NO está enlazado con ningún valor)."

"En caso de que no nos dejara eliminar sería por que estaría representada en la tabla de productos y habría que actuar como en el caso anterior."

---9. Actualiza el código del fabricante Lenovo y asígnale el valor 20. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
start transaction;
update fabricante set codigo=20 where nombre like "Lenovo";

mysql> update fabricante set codigo=20 where nombre like "Lenovo";
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`tienda`.`producto`, CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`codigo_fabricante`) REFERENCES `fabricante` (`codigo`))

commit;

"NO nos deja eliminarlo ya que en l atabla productos el codigo de LENOVO con valor 2 YA está enlazado en la tabla de productos, para poder modificarlo en la tabla de fabricantes, deberíamos actualizar el valor en la tabla de producto."

---10. Actualiza el código del fabricante Huawei y asígnale el valor 30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
start transaction;
update fabricante set codigo=30 where nombre like "Huawei";
commit;

"En este caso SI que nos deja modificar el valor del codigo de Huawei ya que no está representado en la tabla producto y no lo bloquea."


---11. Actualiza el precio de todos los productos sumándole 5 € al precio actual.
start transaction;
update producto set precio=precio+5;

mysql> select * from producto;
+--------+---------------------------------+-------------------+-------------------+
| codigo | nombre                          | precio            | codigo_fabricante |
+--------+---------------------------------+-------------------+-------------------+
|      1 | Disco duro SATA3 1TB            |             91.99 |                 5 |
|      2 | Memoria RAM DDR4 8GB            |               125 |                 6 |
|      3 | Disco SSD 1 TB                  |            155.99 |                 4 |
|      4 | GeForce GTX 1050Ti              |               190 |                 7 |
|      5 | GeForce GTX 1080 Xtreme         |               760 |                 6 |
|      6 | Monitor 24 LED Full HD          |               207 |                 1 |
|      7 | Monitor 27 LED Full HD          |            250.99 |                 1 |
|      8 | Portátil Yoga 520               |               564 |                 2 |
|      9 | Portátil Ideapd 320             |               449 |                 2 |
|     10 | Impresora HP Deskjet 3720       | 64.99000000000001 |                 3 |
|     11 | Impresora HP Laserjet Pro M26nw |               185 |                 3 |
|     12 | Home Cinema MK1                 |            154.99 |                10 |
|     13 | GeForce 3080Ti                  |              1305 |                11 |
+--------+---------------------------------+-------------------+-------------------+
13 rows in set (0.00 sec)

commit;



---12. Elimina todas las impresoras que tienen un precio menor de 200 €.
start transaction;
delete from producto where nombre like "Impresora%" and precio<200;

mysql> select * from producto;
+--------+-------------------------+--------+-------------------+
| codigo | nombre                  | precio | codigo_fabricante |
+--------+-------------------------+--------+-------------------+
|      1 | Disco duro SATA3 1TB    |  86.99 |                 5 |
|      2 | Memoria RAM DDR4 8GB    |    120 |                 6 |
|      3 | Disco SSD 1 TB          | 150.99 |                 4 |
|      4 | GeForce GTX 1050Ti      |    185 |                 7 |
|      5 | GeForce GTX 1080 Xtreme |    755 |                 6 |
|      6 | Monitor 24 LED Full HD  |    202 |                 1 |
|      7 | Monitor 27 LED Full HD  | 245.99 |                 1 |
|      8 | Portátil Yoga 520       |    559 |                 2 |
|      9 | Portátil Ideapd 320     |    444 |                 2 |
|     12 | Home Cinema MK1         | 149.99 |                10 |
|     13 | GeForce 3080Ti          |   1300 |                11 |
+--------+-------------------------+--------+-------------------+
11 rows in set (0.00 sec)

commit;





---------EMPLEADOS.SQL---------

---1. Inserta un nuevo departamento indicando su código, nombre y presupuesto.
start transaction;
insert into departamento(codigo,nombre,presupuesto) values (8,"Relaciones Públicas",240000);
commit;

mysql> select * from departamento;
+--------+---------------------+-------------+--------+
| codigo | nombre              | presupuesto | gastos |
+--------+---------------------+-------------+--------+
|      1 | Desarrollo          |      120000 |   6000 |
|      2 | Sistemas            |      150000 |  21000 |
|      3 | Recursos Humanos    |      280000 |  25000 |
|      4 | Contabilidad        |      110000 |   3000 |
|      5 | I+D                 |      375000 | 380000 |
|      6 | Proyectos           |           0 |      0 |
|      7 | Publicidad          |           0 |   1000 |
|      8 | Relaciones Públicas |      240000 |      0 |
+--------+---------------------+-------------+--------+
8 rows in set (0.00 sec)

---2. Inserta un nuevo departamento indicando su nombre y presupuesto.
start transaction;
insert into departamento(nombre,presupuesto) values ("Inversiones",50000);
commit;

mysql> select * from departamento;
+--------+---------------------+-------------+--------+
| codigo | nombre              | presupuesto | gastos |
+--------+---------------------+-------------+--------+
|      1 | Desarrollo          |      120000 |   6000 |
|      2 | Sistemas            |      150000 |  21000 |
|      3 | Recursos Humanos    |      280000 |  25000 |
|      4 | Contabilidad        |      110000 |   3000 |
|      5 | I+D                 |      375000 | 380000 |
|      6 | Proyectos           |           0 |      0 |
|      7 | Publicidad          |           0 |   1000 |
|      8 | Relaciones Públicas |      240000 |      0 |
|      9 | Inversiones         |       50000 |      0 |
+--------+---------------------+-------------+--------+
9 rows in set (0.00 sec)

---3. Inserta un nuevo departamento indicando su código, nombre, presupuesto y gastos.
start transaction;
insert into departamento(codigo,nombre,presupuesto,gastos) values (10,"Bursátil",555000,460000);
commit;

mysql> select * from departamento;
+--------+---------------------+-------------+--------+
| codigo | nombre              | presupuesto | gastos |
+--------+---------------------+-------------+--------+
|      1 | Desarrollo          |      120000 |   6000 |
|      2 | Sistemas            |      150000 |  21000 |
|      3 | Recursos Humanos    |      280000 |  25000 |
|      4 | Contabilidad        |      110000 |   3000 |
|      5 | I+D                 |      375000 | 380000 |
|      6 | Proyectos           |           0 |      0 |
|      7 | Publicidad          |           0 |   1000 |
|      8 | Relaciones Públicas |      240000 |      0 |
|      9 | Inversiones         |       50000 |      0 |
|     10 | Bursátil            |      555000 | 460000 |
+--------+---------------------+-------------+--------+
10 rows in set (0.00 sec)

---4. Inserta un nuevo empleado asociado a uno de los nuevos departamentos. La sentencia de inserción debe incluir: código, nif, nombre, apellido1, apellido2 y codigo_departamento
start transaction;
insert into empleado values(14,"51004052F","Caerla","Mbappe","Lottin",10);
commit;

mysql> select * from empleado;
+--------+-----------+--------------+-----------+-----------+---------------------+
| codigo | nif       | nombre       | apellido1 | apellido2 | codigo_departamento |
+--------+-----------+--------------+-----------+-----------+---------------------+
|      1 | 32481596F | Aarón        | Rivero    | Gómez     |                   1 |
|      2 | Y5575632D | Adela        | Salas     | Díaz      |                   2 |
|      3 | R6970642B | Adolfo       | Rubio     | Flores    |                   3 |
|      4 | 77705545E | Adrián       | Suárez    | NULL      |                   4 |
|      5 | 17087203C | Marcos       | Loyola    | Méndez    |                   5 |
|      6 | 38382980M | María        | Santana   | Moreno    |                   1 |
|      7 | 80576669X | Pilar        | Ruiz      | NULL      |                   2 |
|      8 | 71651431Z | Pepe         | Ruiz      | Santana   |                   3 |
|      9 | 56399183D | Juan         | Gómez     | López     |                   2 |
|     10 | 46384486H | Diego        | Flores    | Salas     |                   5 |
|     11 | 67389283A | Marta        | Herrera   | Gil       |                   1 |
|     12 | 41234836R | Irene        | Salas     | Flores    |                NULL |
|     13 | 82635162B | Juan Antonio | Sáez      | Guerrero  |                NULL |
|     14 | 51004052F | Caerla       | Mbappe    | Lottin    |                  10 |
+--------+-----------+--------------+-----------+-----------+---------------------+
14 rows in set (0.00 sec)

---5. Inserta un nuevo empleado asociado a uno de los nuevos departamentos. La sentencia de inserción debe incluir: nif, nombre, apellido1, apellido2 y codigo_departamento.
start transaction;
insert into empleado (nif, nombre, apellido1, apellido2 ,codigo_departamento) values("88884052F","Aurelio","Braut","Haaland",9);
commit;

mysql> select * from empleado;
+--------+-----------+--------------+-----------+-----------+---------------------+
| codigo | nif       | nombre       | apellido1 | apellido2 | codigo_departamento |
+--------+-----------+--------------+-----------+-----------+---------------------+
|      1 | 32481596F | Aarón        | Rivero    | Gómez     |                   1 |
|      2 | Y5575632D | Adela        | Salas     | Díaz      |                   2 |
|      3 | R6970642B | Adolfo       | Rubio     | Flores    |                   3 |
|      4 | 77705545E | Adrián       | Suárez    | NULL      |                   4 |
|      5 | 17087203C | Marcos       | Loyola    | Méndez    |                   5 |
|      6 | 38382980M | María        | Santana   | Moreno    |                   1 |
|      7 | 80576669X | Pilar        | Ruiz      | NULL      |                   2 |
|      8 | 71651431Z | Pepe         | Ruiz      | Santana   |                   3 |
|      9 | 56399183D | Juan         | Gómez     | López     |                   2 |
|     10 | 46384486H | Diego        | Flores    | Salas     |                   5 |
|     11 | 67389283A | Marta        | Herrera   | Gil       |                   1 |
|     12 | 41234836R | Irene        | Salas     | Flores    |                NULL |
|     13 | 82635162B | Juan Antonio | Sáez      | Guerrero  |                NULL |
|     14 | 51004052F | Caerla       | Mbappe    | Lottin    |                  10 |
|     16 | 88884052F | Aurelio      | Braut     | Haaland   |                   9 |
+--------+-----------+--------------+-----------+-----------+---------------------+
15 rows in set (0.00 sec)

---6. Elimina el departamento Proyectos. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
start transaction;
delete from departamento where codigo=6;
commit;

"SI nos deja eliminarlo ya que no hay ningun empleado del departamento 6 en la tabla de empleados por lo que no hay referencias y no bloquea la acción."

mysql> select * from departamento;
+--------+---------------------+-------------+--------+
| codigo | nombre              | presupuesto | gastos |
+--------+---------------------+-------------+--------+
|      1 | Desarrollo          |      120000 |   6000 |
|      2 | Sistemas            |      150000 |  21000 |
|      3 | Recursos Humanos    |      280000 |  25000 |
|      4 | Contabilidad        |      110000 |   3000 |
|      5 | I+D                 |      375000 | 380000 |
|      7 | Publicidad          |           0 |   1000 |
|      8 | Relaciones Públicas |      240000 |      0 |
|      9 | Inversiones         |       50000 |      0 |
|     10 | Bursátil            |      555000 | 460000 |
+--------+---------------------+-------------+--------+
9 rows in set (0.00 sec)

---7. Elimina el departamento Desarrollo. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
start transaction;
delete from departamento where codigo=1;

mysql> delete from departamento where codigo=1;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`empleado`.`empleado`, CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`codigo_departamento`) REFERENCES `departamento` (`codigo`))

"NO nos deja eliminarlo ya que en la tabla empleados si hay empleado de ese departamento por lo que están relacionados y no deja eliminarlo. Para solucionarlo deberíamos eliminar de la tabla empleados aquellos que pertenezcan a ese departamento y eliminar la relación de ese departamento con la otra tabla."

commit;



---8. Actualiza el código del departamento Recursos Humanos y asígnale el valor 30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
start transaction;
update departamento set codigo=30 where nombre like "Recursos%";

ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`empleado`.`empleado`, CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`codigo_departamento`) REFERENCES `departamento` (`codigo`))

"NO nos deja actualizar el valor ya que en la tabla empleados si hay empleado de ese departamento por lo que están relacionados y no deja actualizar. Para solucionarlo deberíamos actualizar de la tabla empleados aquellos que pertenezcan a ese departamento."

commit;



---9. Actualiza el código del departamento Publicidad y asígnale el valor 40. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
start transaction;
update departamento set codigo=40 where nombre like "Publicidad";

mysql> select * from departamento;
+--------+---------------------+-------------+--------+
| codigo | nombre              | presupuesto | gastos |
+--------+---------------------+-------------+--------+
|      1 | Desarrollo          |      120000 |   6000 |
|      2 | Sistemas            |      150000 |  21000 |
|      3 | Recursos Humanos    |      280000 |  25000 |
|      4 | Contabilidad        |      110000 |   3000 |
|      5 | I+D                 |      375000 | 380000 |
|      8 | Relaciones Públicas |      240000 |      0 |
|      9 | Inversiones         |       50000 |      0 |
|     10 | Bursátil            |      555000 | 460000 |
|     40 | Publicidad          |           0 |   1000 |
+--------+---------------------+-------------+--------+
9 rows in set (0.00 sec)

commit;

"SI nos deja actualizar el valor ya que no hay ningun empleado del departamento Publicidad en la tabla de empleados por lo que no hay referencias y no bloquea la acción."

---10. Actualiza el presupuesto de los departamentos sumándole 50000 € al valor del presupuesto actual, solamente a aquellos departamentos que tienen un presupuesto menor que 20000 €.
start transaction;
update departamento set presupuesto=presupuesto+50000 where presupuesto<20000;

mysql> select * from departamento;
+--------+---------------------+-------------+--------+
| codigo | nombre              | presupuesto | gastos |
+--------+---------------------+-------------+--------+
|      1 | Desarrollo          |      120000 |   6000 |
|      2 | Sistemas            |      150000 |  21000 |
|      3 | Recursos Humanos    |      280000 |  25000 |
|      4 | Contabilidad        |      110000 |   3000 |
|      5 | I+D                 |      375000 | 380000 |
|      8 | Relaciones Públicas |      240000 |      0 |
|      9 | Inversiones         |       50000 |      0 |
|     10 | Bursátil            |      555000 | 460000 |
|     40 | Publicidad          |       50000 |   1000 |
+--------+---------------------+-------------+--------+
9 rows in set (0.00 sec)

commit;


---11. Realiza una transacción que elimine todas los empleados que no tienen un departamento asociado.
start transaction;
delete from empleado where codigo_departamento is null;

mysql> select * from empleado;
+--------+-----------+--------+-----------+-----------+---------------------+
| codigo | nif       | nombre | apellido1 | apellido2 | codigo_departamento |
+--------+-----------+--------+-----------+-----------+---------------------+
|      1 | 32481596F | Aarón  | Rivero    | Gómez     |                   1 |
|      2 | Y5575632D | Adela  | Salas     | Díaz      |                   2 |
|      3 | R6970642B | Adolfo | Rubio     | Flores    |                   3 |
|      4 | 77705545E | Adrián | Suárez    | NULL      |                   4 |
|      5 | 17087203C | Marcos | Loyola    | Méndez    |                   5 |
|      6 | 38382980M | María  | Santana   | Moreno    |                   1 |
|      7 | 80576669X | Pilar  | Ruiz      | NULL      |                   2 |
|      8 | 71651431Z | Pepe   | Ruiz      | Santana   |                   3 |
|      9 | 56399183D | Juan   | Gómez     | López     |                   2 |
|     10 | 46384486H | Diego  | Flores    | Salas     |                   5 |
|     11 | 67389283A | Marta  | Herrera   | Gil       |                   1 |
+--------+-----------+--------+-----------+-----------+---------------------+
11 rows in set (0.00 sec)



---12. Realiza el comando que permite volver atrás la sentencia anterior
rollback;

mysql> select * from empleado;
+--------+-----------+--------------+-----------+-----------+---------------------+
| codigo | nif       | nombre       | apellido1 | apellido2 | codigo_departamento |
+--------+-----------+--------------+-----------+-----------+---------------------+
|      1 | 32481596F | Aarón        | Rivero    | Gómez     |                   1 |
|      2 | Y5575632D | Adela        | Salas     | Díaz      |                   2 |
|      3 | R6970642B | Adolfo       | Rubio     | Flores    |                   3 |
|      4 | 77705545E | Adrián       | Suárez    | NULL      |                   4 |
|      5 | 17087203C | Marcos       | Loyola    | Méndez    |                   5 |
|      6 | 38382980M | María        | Santana   | Moreno    |                   1 |
|      7 | 80576669X | Pilar        | Ruiz      | NULL      |                   2 |
|      8 | 71651431Z | Pepe         | Ruiz      | Santana   |                   3 |
|      9 | 56399183D | Juan         | Gómez     | López     |                   2 |
|     10 | 46384486H | Diego        | Flores    | Salas     |                   5 |
|     11 | 67389283A | Marta        | Herrera   | Gil       |                   1 |
|     12 | 41234836R | Irene        | Salas     | Flores    |                NULL |
|     13 | 82635162B | Juan Antonio | Sáez      | Guerrero  |                NULL |
+--------+-----------+--------------+-----------+-----------+---------------------+
13 rows in set (0.00 sec)




---------EMPRESA_PYME.SQL---------

---1. Inserta una nueva oficina en Almería.
start transaction;
insert into oficina values("ALM-ES","Almería","España","Andalucía",04001,"+34 91 9123456","C. Alcalde Santiago Martínez Cabrejas, 5","Planta 0");

mysql> select * from oficina;
+----------------+----------------------+------------+-------------------+---------------+-----------------+------------------------------------------+---------------------+
| codigo_oficina | ciudad               | pais       | region            | codigo_postal | telefono        | linea_direccion1                         | linea_direccion2    |
+----------------+----------------------+------------+-------------------+---------------+-----------------+------------------------------------------+---------------------+
| ALM-ES         | Almería              | España     | Andalucía         | 4001          | +34 91 9123456  | C. Alcalde Santiago Martínez Cabrejas, 5 | Planta 0            |
| BCN-ES         | Barcelona            | España     | Barcelona         | 08019         | +34 93 3561182  | Avenida Diagonal, 38                     | 3A escalera Derecha |
| BOS-USA        | Boston               | EEUU       | MA                | 02108         | +1 215 837 0825 | 1550 Court Place                         | Suite 102           |
| LON-UK         | Londres              | Inglaterra | EMEA              | EC2N 1HN      | +44 20 78772041 | 52 Old Broad Street                      | Ground Floor        |
| MAD-ES         | Madrid               | España     | Madrid            | 28032         | +34 91 7514487  | Bulevar Indalecio Prieto, 32             |                     |
| PAR-FR         | Paris                | Francia    | EMEA              | 75017         | +33 14 723 4404 | 29 Rue Jouffroy d abbans                 |                     |
| SFC-USA        | San Francisco        | EEUU       | CA                | 94080         | +1 650 219 4782 | 100 Market Street                        | Suite 300           |
| SYD-AU         | Sydney               | Australia  | APAC              | NSW 2010      | +61 2 9264 2451 | 5-11 Wentworth Avenue                    | Floor #2            |
| TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32                    | 5º piso (exterior)  |
| TOK-JP         | Tokyo                | Japón      | Chiyoda-Ku        | 102-8578      | +81 33 224 5000 | 4-1 Kioicho                              |                     |
+----------------+----------------------+------------+-------------------+---------------+-----------------+------------------------------------------+---------------------+
10 rows in set (0.00 sec)

commit;



---2. Inserta un empleado para la oficina de Almería que sea representante de ventas.
start transaction;
insert into empleado values(32,"José María","Gutierrez","Guti",2777,"josemaguti@ardening.com","ALM-ES",2,"Representante Ventas");

mysql> select * from empleado;
+-----------------+-----------------+------------+-----------+-----------+---------------------------+----------------+-------------+-----------------------+
| codigo_empleado | nombre          | apellido1  | apellido2 | extension | email                     | codigo_oficina | codigo_jefe | puesto                |
+-----------------+-----------------+------------+-----------+-----------+---------------------------+----------------+-------------+-----------------------+
|               1 | Marcos          | Magaña     | Perez     | 3897      | marcos@jardineria.es      | TAL-ES         |        NULL | Director General      |
|               2 | Ruben           | López      | Martinez  | 2899      | rlopez@jardineria.es      | TAL-ES         |           1 | Subdirector Marketing |
|               3 | Alberto         | Soria      | Carrasco  | 2837      | asoria@jardineria.es      | TAL-ES         |           2 | Subdirector Ventas    |
|               4 | Maria           | Solís      | Jerez     | 2847      | msolis@jardineria.es      | TAL-ES         |           2 | Secretaria            |
|               5 | Felipe          | Rosas      | Marquez   | 2844      | frosas@jardineria.es      | TAL-ES         |           3 | Representante Ventas  |
|               6 | Juan Carlos     | Ortiz      | Serrano   | 2845      | cortiz@jardineria.es      | TAL-ES         |           3 | Representante Ventas  |
|               7 | Carlos          | Soria      | Jimenez   | 2444      | csoria@jardineria.es      | MAD-ES         |           3 | Director Oficina      |
|               8 | Mariano         | López      | Murcia    | 2442      | mlopez@jardineria.es      | MAD-ES         |           7 | Representante Ventas  |
|               9 | Lucio           | Campoamor  | Martín    | 2442      | lcampoamor@jardineria.es  | MAD-ES         |           7 | Representante Ventas  |
|              10 | Hilario         | Rodriguez  | Huertas   | 2444      | hrodriguez@jardineria.es  | MAD-ES         |           7 | Representante Ventas  |
|              11 | Emmanuel        | Magaña     | Perez     | 2518      | manu@jardineria.es        | BCN-ES         |           3 | Director Oficina      |
|              12 | José Manuel     | Martinez   | De la Osa | 2519      | jmmart@hotmail.es         | BCN-ES         |          11 | Representante Ventas  |
|              13 | David           | Palma      | Aceituno  | 2519      | dpalma@jardineria.es      | BCN-ES         |          11 | Representante Ventas  |
|              14 | Oscar           | Palma      | Aceituno  | 2519      | opalma@jardineria.es      | BCN-ES         |          11 | Representante Ventas  |
|              15 | Francois        | Fignon     |           | 9981      | ffignon@gardening.com     | PAR-FR         |           3 | Director Oficina      |
|              16 | Lionel          | Narvaez    |           | 9982      | lnarvaez@gardening.com    | PAR-FR         |          15 | Representante Ventas  |
|              17 | Laurent         | Serra      |           | 9982      | lserra@gardening.com      | PAR-FR         |          15 | Representante Ventas  |
|              18 | Michael         | Bolton     |           | 7454      | mbolton@gardening.com     | SFC-USA        |           3 | Director Oficina      |
|              19 | Walter Santiago | Sanchez    | Lopez     | 7454      | wssanchez@gardening.com   | SFC-USA        |          18 | Representante Ventas  |
|              20 | Hilary          | Washington |           | 7565      | hwashington@gardening.com | BOS-USA        |           3 | Director Oficina      |
|              21 | Marcus          | Paxton     |           | 7565      | mpaxton@gardening.com     | BOS-USA        |          20 | Representante Ventas  |
|              22 | Lorena          | Paxton     |           | 7665      | lpaxton@gardening.com     | BOS-USA        |          20 | Representante Ventas  |
|              23 | Nei             | Nishikori  |           | 8734      | nnishikori@gardening.com  | TOK-JP         |           3 | Director Oficina      |
|              24 | Narumi          | Riko       |           | 8734      | nriko@gardening.com       | TOK-JP         |          23 | Representante Ventas  |
|              25 | Takuma          | Nomura     |           | 8735      | tnomura@gardening.com     | TOK-JP         |          23 | Representante Ventas  |
|              26 | Amy             | Johnson    |           | 3321      | ajohnson@gardening.com    | LON-UK         |           3 | Director Oficina      |
|              27 | Larry           | Westfalls  |           | 3322      | lwestfalls@gardening.com  | LON-UK         |          26 | Representante Ventas  |
|              28 | John            | Walton     |           | 3322      | jwalton@gardening.com     | LON-UK         |          26 | Representante Ventas  |
|              29 | Kevin           | Fallmer    |           | 3210      | kfalmer@gardening.com     | SYD-AU         |           3 | Director Oficina      |
|              30 | Julian          | Bellinelli |           | 3211      | jbellinelli@gardening.com | SYD-AU         |          29 | Representante Ventas  |
|              31 | Mariko          | Kishi      |           | 3211      | mkishi@gardening.com      | SYD-AU         |          29 | Representante Ventas  |
|              32 | José María      | Gutierrez  | Guti      | 2777      | josemaguti@ardening.com   | ALM-ES         |           2 | Representante Ventas  |
+-----------------+-----------------+------------+-----------+-----------+---------------------------+----------------+-------------+-----------------------+
32 rows in set (0.00 sec)

commit;



---3. Inserta un cliente que tenga como representante de ventas el empleado que hemos creado en el paso anterior.
start transaction;
insert into cliente values( 39,"OJUQUECALOH S.L.","Daniel","Carriso",919659397,919659397,"C. Isla de Fuerteventura 9",NULL,"Almería","Andalucía","Spain",04007,32,27000);

mysql> select * from cliente;
+----------------+--------------------------------+-----------------+-------------------+----------------+----------------+--------------------------------------------+-------------------+--------------------------+---------------------+----------------+---------------+----------------------------+----------------+
| codigo_cliente | nombre_cliente                 | nombre_contacto | apellido_contacto | telefono       | fax            | linea_direccion1                           | linea_direccion2  | ciudad                   | region              | pais           | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
+----------------+--------------------------------+-----------------+-------------------+----------------+----------------+--------------------------------------------+-------------------+--------------------------+---------------------+----------------+---------------+----------------------------+----------------+
|              1 | GoldFish Garden                | Daniel G        | GoldFish          | 5556901745     | 5556901746     | False Street 52 2 A                        | NULL              | San Francisco            | NULL                | USA            | 24006         |                         19 |        3000.00 |
|              3 | Gardening Associates           | Anne            | Wright            | 5557410345     | 5557410346     | Wall-e Avenue                              | NULL              | Miami                    | Miami               | USA            | 24010         |                         19 |        6000.00 |
|              4 | Gerudo Valley                  | Link            | Flaute            | 5552323129     | 5552323128     | Oaks Avenue nº22                           | NULL              | New York                 | NULL                | USA            | 85495         |                         22 |       12000.00 |
|              5 | Tendo Garden                   | Akane           | Tendo             | 55591233210    | 55591233211    | Null Street nº69                           | NULL              | Miami                    | NULL                | USA            | 696969        |                         22 |      600000.00 |
|              6 | Lasas S.A.                     | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15                               | NULL              | Fuenlabrada              | Madrid              | Spain          | 28945         |                          8 |      154310.00 |
|              7 | Beragua                        | Jose            | Bermejo           | 654987321      | 916549872      | C/pintor segundo                           | Getafe            | Madrid                   | Madrid              | Spain          | 28942         |                         11 |       20000.00 |
|              8 | Club Golf Puerta del hierro    | Paco            | Lopez             | 62456810       | 919535678      | C/sinesio delgado                          | Madrid            | Madrid                   | Madrid              | Spain          | 28930         |                         11 |       40000.00 |
|              9 | Naturagua                      | Guillermo       | Rengifo           | 689234750      | 916428956      | C/majadahonda                              | Boadilla          | Madrid                   | Madrid              | Spain          | 28947         |                         11 |       32000.00 |
|             10 | DaraDistribuciones             | David           | Serrano           | 675598001      | 916421756      | C/azores                                   | Fuenlabrada       | Madrid                   | Madrid              | Spain          | 28946         |                         11 |       50000.00 |
|             11 | Madrileña de riegos            | Jose            | Tacaño            | 655983045      | 916689215      | C/Lagañas                                  | Fuenlabrada       | Madrid                   | Madrid              | Spain          | 28943         |                         11 |       20000.00 |
|             12 | Lasas S.A.                     | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15                               | NULL              | Fuenlabrada              | Madrid              | Spain          | 28945         |                          8 |      154310.00 |
|             13 | Camunas Jardines S.L.          | Pedro           | Camunas           | 34914873241    | 34914871541    | C/Virgenes 45                              | C/Princesas 2 1ºB | San Lorenzo del Escorial | Madrid              | Spain          | 28145         |                          8 |       16481.00 |
|             14 | Dardena S.A.                   | Juan            | Rodriguez         | 34912453217    | 34912484764    | C/Nueva York 74                            | NULL              | Madrid                   | Madrid              | Spain          | 28003         |                          8 |      321000.00 |
|             15 | Jardin de Flores               | Javier          | Villar            | 654865643      | 914538776      | C/ Oña 34                                  | NULL              | Madrid                   | Madrid              | Spain          | 28950         |                         30 |       40000.00 |
|             16 | Flores Marivi                  | Maria           | Rodriguez         | 666555444      | 912458657      | C/Leganes24                                | NULL              | Fuenlabrada              | Madrid              | Spain          | 28945         |                          5 |        1500.00 |
|             17 | Flowers, S.A                   | Beatriz         | Fernandez         | 698754159      | 978453216      | C/Luis Salquillo4                          | NULL              | Montornes del valles     | Barcelona           | Spain          | 24586         |                          5 |        3500.00 |
|             18 | Naturajardin                   | Victoria        | Cruz              | 612343529      | 916548735      | Plaza Magallón 15                          | NULL              | Madrid                   | Madrid              | Spain          | 28011         |                         30 |        5050.00 |
|             19 | Golf S.A.                      | Luis            | Martinez          | 916458762      | 912354475      | C/Estancado                                | NULL              | Santa cruz de Tenerife   | Islas Canarias      | Spain          | 38297         |                         12 |       30000.00 |
|             20 | Americh Golf Management SL     | Mario           | Suarez            | 964493072      | 964493063      | C/Letardo                                  | NULL              | Barcelona                | Cataluña            | Spain          | 12320         |                         12 |       20000.00 |
|             21 | Aloha                          | Cristian        | Rodrigez          | 916485852      | 914489898      | C/Roman 3                                  | NULL              | Canarias                 | Canarias            | Spain          | 35488         |                         12 |       50000.00 |
|             22 | El Prat                        | Francisco       | Camacho           | 916882323      | 916493211      | Avenida Tibidabo                           | NULL              | Barcelona                | Cataluña            | Spain          | 12320         |                         12 |       30000.00 |
|             23 | Sotogrande                     | Maria           | Santillana        | 915576622      | 914825645      | C/Paseo del Parque                         | NULL              | Sotogrande               | Cadiz               | Spain          | 11310         |                         12 |       60000.00 |
|             24 | Vivero Humanes                 | Federico        | Gomez             | 654987690      | 916040875      | C/Miguel Echegaray 54                      | NULL              | Humanes                  | Madrid              | Spain          | 28970         |                         30 |        7430.00 |
|             25 | Fuenla City                    | Tony            | Muñoz Mena        | 675842139      | 915483754      | C/Callo 52                                 | NULL              | Fuenlabrada              | Madrid              | Spain          | 28574         |                          5 |        4500.00 |
|             26 | Jardines y Mansiones Cactus SL | Eva María       | Sánchez           | 916877445      | 914477777      | Polígono Industrial Maspalomas, Nº52       | Móstoles          | Madrid                   | Madrid              | Spain          | 29874         |                          9 |       76000.00 |
|             27 | Jardinerías Matías SL          | Matías          | San Martín        | 916544147      | 917897474      | C/Francisco Arce, Nº44                     | Bustarviejo       | Madrid                   | Madrid              | Spain          | 37845         |                          9 |      100500.00 |
|             28 | Agrojardin                     | Benito          | Lopez             | 675432926      | 916549264      | C/Mar Caspio 43                            | NULL              | Getafe                   | Madrid              | Spain          | 28904         |                         30 |        8040.00 |
|             29 | Top Campo                      | Joseluis        | Sanchez           | 685746512      | 974315924      | C/Ibiza 32                                 | NULL              | Humanes                  | Madrid              | Spain          | 28574         |                          5 |        5500.00 |
|             30 | Jardineria Sara                | Sara            | Marquez           | 675124537      | 912475843      | C/Lima 1                                   | NULL              | Fuenlabrada              | Madrid              | Spain          | 27584         |                          5 |        7500.00 |
|             31 | Campohermoso                   | Luis            | Jimenez           | 645925376      | 916159116      | C/Peru 78                                  | NULL              | Fuenlabrada              | Madrid              | Spain          | 28945         |                         30 |        3250.00 |
|             32 | france telecom                 | FraÃ§ois        | Toulou            | (33)5120578961 | (33)5120578961 | 6 place d Alleray 15Ã¨me                   | NULL              | Paris                    | NULL                | France         | 75010         |                         16 |       10000.00 |
|             33 | Musée du Louvre                | Pierre          | Delacroux         | (33)0140205050 | (33)0140205442 | Quai du Louvre                             | NULL              | Paris                    | NULL                | France         | 75058         |                         16 |       30000.00 |
|             35 | Tutifruti S.A                  | Jacob           | Jones             | 2 9261-2433    | 2 9283-1695    | level 24, St. Martins Tower.-31 Market St. | NULL              | Sydney                   | Nueva Gales del Sur | Australia      | 2000          |                         31 |       10000.00 |
|             36 | Flores S.L.                    | Antonio         | Romero            | 654352981      | 685249700      | Avenida España                             | NULL              | Madrid                   | Fuenlabrada         | Spain          | 29643         |                         18 |        6000.00 |
|             37 | The Magic Garden               | Richard         | Mcain             | 926523468      | 9364875882     | Lihgting Park                              | NULL              | London                   | London              | United Kingdom | 65930         |                         18 |       10000.00 |
|             38 | El Jardin Viviente S.L         | Justin          | Smith             | 2 8005-7161    | 2 8005-7162    | 176 Cumberland Street The rocks            | NULL              | Sydney                   | Nueva Gales del Sur | Australia      | 2003          |                         31 |        8000.00 |
|             39 | OJUQUECALOH S.L.               | Daniel          | Carriso           | 919659397      | 919659397      | C. Isla de Fuerteventura 9                 | NULL              | Almería                  | Andalucía           | Spain          | 4007          |                         32 |       27000.00 |
+----------------+--------------------------------+-----------------+-------------------+----------------+----------------+--------------------------------------------+-------------------+--------------------------+---------------------+----------------+---------------+----------------------------+----------------+
37 rows in set (0.00 sec)

commit;



---4. Inserte un pedido para el cliente que acabamos de crear, que contenga al menos dos productos.
start transaction;
insert into pedido values(129,"2009-12-18","2009-12-20",NULL,"Rechazado","El cliente ha cambiado la dirección de envío",39);
insert into pedido values(130,"2009-12-20","2009-12-23","2009-12-23","Entregado","El cliente ha pedido que le llamemos antes de hacer la entrega",39);

mysql> select * from pedido;
+---------------+--------------+----------------+---------------+-----------+--------------------------------------------------------------------------------------------------------+----------------+
| codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega | estado    | comentarios                                                                                            | codigo_cliente |
+---------------+--------------+----------------+---------------+-----------+--------------------------------------------------------------------------------------------------------+----------------+
|             1 | 2006-01-17   | 2006-01-19     | 2006-01-19    | Entregado | Pagado a plazos                                                                                        |              5 |
|             2 | 2007-10-23   | 2007-10-28     | 2007-10-26    | Entregado | La entrega llego antes de lo esperado                                                                  |              5 |
|             3 | 2008-06-20   | 2008-06-25     | NULL          | Rechazado | Limite de credito superado                                                                             |              5 |
|             4 | 2009-01-20   | 2009-01-26     | NULL          | Pendiente | NULL                                                                                                   |              5 |
|             8 | 2008-11-09   | 2008-11-14     | 2008-11-14    | Entregado | El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas         |              1 |
|             9 | 2008-12-22   | 2008-12-27     | 2008-12-28    | Entregado | El cliente comprueba la integridad del paquete, todo correcto                                          |              1 |
|            10 | 2009-01-15   | 2009-01-20     | NULL          | Pendiente | El cliente llama para confirmar la fecha - Esperando al proveedor                                      |              3 |
|            11 | 2009-01-20   | 2009-01-27     | NULL          | Pendiente | El cliente requiere que el pedido se le entregue de 16:00h a 22:00h                                    |              1 |
|            12 | 2009-01-22   | 2009-01-27     | NULL          | Pendiente | El cliente requiere que el pedido se le entregue de 9:00h a 13:00h                                     |              1 |
|            13 | 2009-01-12   | 2009-01-14     | 2009-01-15    | Entregado | NULL                                                                                                   |              7 |
|            14 | 2009-01-02   | 2009-01-02     | NULL          | Rechazado | mal pago                                                                                               |              7 |
|            15 | 2009-01-09   | 2009-01-12     | 2009-01-11    | Entregado | NULL                                                                                                   |              7 |
|            16 | 2009-01-06   | 2009-01-07     | 2009-01-15    | Entregado | NULL                                                                                                   |              7 |
|            17 | 2009-01-08   | 2009-01-09     | 2009-01-11    | Entregado | mal estado                                                                                             |              7 |
|            18 | 2009-01-05   | 2009-01-06     | 2009-01-07    | Entregado | NULL                                                                                                   |              9 |
|            19 | 2009-01-18   | 2009-02-12     | NULL          | Pendiente | entregar en murcia                                                                                     |              9 |
|            20 | 2009-01-20   | 2009-02-15     | NULL          | Pendiente | NULL                                                                                                   |              9 |
|            21 | 2009-01-09   | 2009-01-09     | 2009-01-09    | Rechazado | mal pago                                                                                               |              9 |
|            22 | 2009-01-11   | 2009-01-11     | 2009-01-13    | Entregado | NULL                                                                                                   |              9 |
|            23 | 2008-12-30   | 2009-01-10     | NULL          | Rechazado | El pedido fue anulado por el cliente                                                                   |              5 |
|            24 | 2008-07-14   | 2008-07-31     | 2008-07-25    | Entregado | NULL                                                                                                   |             14 |
|            25 | 2009-02-02   | 2009-02-08     | NULL          | Rechazado | El cliente carece de saldo en la cuenta asociada                                                       |              1 |
|            26 | 2009-02-06   | 2009-02-12     | NULL          | Rechazado | El cliente anula la operacion para adquirir mas producto                                               |              3 |
|            27 | 2009-02-07   | 2009-02-13     | NULL          | Entregado | El pedido aparece como entregado pero no sabemos en que fecha                                          |              3 |
|            28 | 2009-02-10   | 2009-02-17     | 2009-02-20    | Entregado | El cliente se queja bastante de la espera asociada al producto                                         |              3 |
|            29 | 2008-08-01   | 2008-09-01     | 2008-09-01    | Rechazado | El cliente no está conforme con el pedido                                                              |             14 |
|            30 | 2008-08-03   | 2008-09-03     | 2008-08-31    | Entregado | NULL                                                                                                   |             13 |
|            31 | 2008-09-04   | 2008-09-30     | 2008-10-04    | Rechazado | El cliente ha rechazado por llegar 5 dias tarde                                                        |             13 |
|            32 | 2007-01-07   | 2007-01-19     | 2007-01-27    | Entregado | Entrega tardia, el cliente puso reclamacion                                                            |              4 |
|            33 | 2007-05-20   | 2007-05-28     | NULL          | Rechazado | El pedido fue anulado por el cliente                                                                   |              4 |
|            34 | 2007-06-20   | 2008-06-28     | 2008-06-28    | Entregado | Pagado a plazos                                                                                        |              4 |
|            35 | 2008-03-10   | 2009-03-20     | NULL          | Rechazado | Limite de credito superado                                                                             |              4 |
|            36 | 2008-10-15   | 2008-12-15     | 2008-12-10    | Entregado | NULL                                                                                                   |             14 |
|            37 | 2008-11-03   | 2009-11-13     | NULL          | Pendiente | El pedido nunca llego a su destino                                                                     |              4 |
|            38 | 2009-03-05   | 2009-03-06     | 2009-03-07    | Entregado | NULL                                                                                                   |             19 |
|            39 | 2009-03-06   | 2009-03-07     | 2009-03-09    | Pendiente | NULL                                                                                                   |             19 |
|            40 | 2009-03-09   | 2009-03-10     | 2009-03-13    | Rechazado | NULL                                                                                                   |             19 |
|            41 | 2009-03-12   | 2009-03-13     | 2009-03-13    | Entregado | NULL                                                                                                   |             19 |
|            42 | 2009-03-22   | 2009-03-23     | 2009-03-27    | Entregado | NULL                                                                                                   |             19 |
|            43 | 2009-03-25   | 2009-03-26     | 2009-03-28    | Pendiente | NULL                                                                                                   |             23 |
|            44 | 2009-03-26   | 2009-03-27     | 2009-03-30    | Pendiente | NULL                                                                                                   |             23 |
|            45 | 2009-04-01   | 2009-03-04     | 2009-03-07    | Entregado | NULL                                                                                                   |             23 |
|            46 | 2009-04-03   | 2009-03-04     | 2009-03-05    | Rechazado | NULL                                                                                                   |             23 |
|            47 | 2009-04-15   | 2009-03-17     | 2009-03-17    | Entregado | NULL                                                                                                   |             23 |
|            48 | 2008-03-17   | 2008-03-30     | 2008-03-29    | Entregado | Según el Cliente, el pedido llegó defectuoso                                                           |             26 |
|            49 | 2008-07-12   | 2008-07-22     | 2008-07-30    | Entregado | El pedido llegó 1 día tarde, pero no hubo queja por parte de la empresa compradora                     |             26 |
|            50 | 2008-03-17   | 2008-08-09     | NULL          | Pendiente | Al parecer, el pedido se ha extraviado a la altura de Sotalbo (Ávila)                                  |             26 |
|            51 | 2008-10-01   | 2008-10-14     | 2008-10-14    | Entregado | Todo se entregó a tiempo y en perfecto estado, a pesar del pésimo estado de las carreteras.            |             26 |
|            52 | 2008-12-07   | 2008-12-21     | NULL          | Pendiente | El transportista ha llamado a Eva María para indicarle que el pedido llegará más tarde de lo esperado. |             26 |
|            53 | 2008-10-15   | 2008-11-15     | 2008-11-09    | Entregado | El pedido llega 6 dias antes                                                                           |             13 |
|            54 | 2009-01-11   | 2009-02-11     | NULL          | Pendiente | NULL                                                                                                   |             14 |
|            55 | 2008-12-10   | 2009-01-10     | 2009-01-11    | Entregado | Retrasado 1 dia por problemas de transporte                                                            |             14 |
|            56 | 2008-12-19   | 2009-01-20     | NULL          | Rechazado | El cliente a anulado el pedido el dia 2009-01-10                                                       |             13 |
|            57 | 2009-01-05   | 2009-02-05     | NULL          | Pendiente | NULL                                                                                                   |             13 |
|            58 | 2009-01-24   | 2009-01-31     | 2009-01-30    | Entregado | Todo correcto                                                                                          |              3 |
|            59 | 2008-11-09   | 2008-11-14     | 2008-11-14    | Entregado | El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas         |              1 |
|            60 | 2008-12-22   | 2008-12-27     | 2008-12-28    | Entregado | El cliente comprueba la integridad del paquete, todo correcto                                          |              1 |
|            61 | 2009-01-15   | 2009-01-20     | NULL          | Pendiente | El cliente llama para confirmar la fecha - Esperando al proveedor                                      |              3 |
|            62 | 2009-01-20   | 2009-01-27     | NULL          | Pendiente | El cliente requiere que el pedido se le entregue de 16:00h a 22:00h                                    |              1 |
|            63 | 2009-01-22   | 2009-01-27     | NULL          | Pendiente | El cliente requiere que el pedido se le entregue de 9:00h a 13:00h                                     |              1 |
|            64 | 2009-01-24   | 2009-01-31     | 2009-01-30    | Entregado | Todo correcto                                                                                          |              1 |
|            65 | 2009-02-02   | 2009-02-08     | NULL          | Rechazado | El cliente carece de saldo en la cuenta asociada                                                       |              1 |
|            66 | 2009-02-06   | 2009-02-12     | NULL          | Rechazado | El cliente anula la operacion para adquirir mas producto                                               |              3 |
|            67 | 2009-02-07   | 2009-02-13     | NULL          | Entregado | El pedido aparece como entregado pero no sabemos en que fecha                                          |              3 |
|            68 | 2009-02-10   | 2009-02-17     | 2009-02-20    | Entregado | El cliente se queja bastante de la espera asociada al producto                                         |              3 |
|            74 | 2009-01-14   | 2009-01-22     | NULL          | Rechazado | El pedido no llego el dia que queria el cliente por fallo del transporte                               |             15 |
|            75 | 2009-01-11   | 2009-01-13     | 2009-01-13    | Entregado | El pedido llego perfectamente                                                                          |             15 |
|            76 | 2008-11-15   | 2008-11-23     | 2008-11-23    | Entregado | NULL                                                                                                   |             15 |
|            77 | 2009-01-03   | 2009-01-08     | NULL          | Pendiente | El pedido no pudo ser entregado por problemas meteorologicos                                           |             15 |
|            78 | 2008-12-15   | 2008-12-17     | 2008-12-17    | Entregado | Fue entregado, pero faltaba mercancia que sera entregada otro dia                                      |             15 |
|            79 | 2009-01-12   | 2009-01-13     | 2009-01-13    | Entregado | NULL                                                                                                   |             28 |
|            80 | 2009-01-25   | 2009-01-26     | NULL          | Pendiente | No terminó el pago                                                                                     |             28 |
|            81 | 2009-01-18   | 2009-01-24     | NULL          | Rechazado | Los producto estaban en mal estado                                                                     |             28 |
|            82 | 2009-01-20   | 2009-01-29     | 2009-01-29    | Entregado | El pedido llego un poco mas tarde de la hora fijada                                                    |             28 |
|            83 | 2009-01-24   | 2009-01-28     | NULL          | Entregado | NULL                                                                                                   |             28 |
|            89 | 2007-10-05   | 2007-12-13     | 2007-12-10    | Entregado | La entrega se realizo dias antes de la fecha esperada por lo que el cliente quedo satisfecho           |             35 |
|            90 | 2009-02-07   | 2008-02-17     | NULL          | Pendiente | Debido a la nevada caída en la sierra, el pedido no podrá llegar hasta el día                          |             27 |
|            91 | 2009-03-18   | 2009-03-29     | 2009-03-27    | Entregado | Todo se entregó a su debido tiempo, incluso con un día de antelación                                   |             27 |
|            92 | 2009-04-19   | 2009-04-30     | 2009-05-03    | Entregado | El pedido se entregó tarde debido a la festividad celebrada en España durante esas fechas              |             27 |
|            93 | 2009-05-03   | 2009-05-30     | 2009-05-17    | Entregado | El pedido se entregó antes de lo esperado.                                                             |             27 |
|            94 | 2009-10-18   | 2009-11-01     | NULL          | Pendiente | El pedido está en camino.                                                                              |             27 |
|            95 | 2008-01-04   | 2008-01-19     | 2008-01-19    | Entregado | NULL                                                                                                   |             35 |
|            96 | 2008-03-20   | 2008-04-12     | 2008-04-13    | Entregado | La entrega se retraso un dia                                                                           |             35 |
|            97 | 2008-10-08   | 2008-11-25     | 2008-11-25    | Entregado | NULL                                                                                                   |             35 |
|            98 | 2009-01-08   | 2009-02-13     | NULL          | Pendiente | NULL                                                                                                   |             35 |
|            99 | 2009-02-15   | 2009-02-27     | NULL          | Pendiente | NULL                                                                                                   |             16 |
|           100 | 2009-01-10   | 2009-01-15     | 2009-01-15    | Entregado | El pedido llego perfectamente                                                                          |             16 |
|           101 | 2009-03-07   | 2009-03-27     | NULL          | Rechazado | El pedido fue rechazado por el cliente                                                                 |             16 |
|           102 | 2008-12-28   | 2009-01-08     | 2009-01-08    | Entregado | Pago pendiente                                                                                         |             16 |
|           103 | 2009-01-15   | 2009-01-20     | 2009-01-24    | Pendiente | NULL                                                                                                   |             30 |
|           104 | 2009-03-02   | 2009-03-06     | 2009-03-06    | Entregado | NULL                                                                                                   |             30 |
|           105 | 2009-02-14   | 2009-02-20     | NULL          | Rechazado | el producto ha sido rechazado por la pesima calidad                                                    |             30 |
|           106 | 2009-05-13   | 2009-05-15     | 2009-05-20    | Pendiente | NULL                                                                                                   |             30 |
|           107 | 2009-04-06   | 2009-04-10     | 2009-04-10    | Entregado | NULL                                                                                                   |             30 |
|           108 | 2009-04-09   | 2009-04-15     | 2009-04-15    | Entregado | NULL                                                                                                   |             16 |
|           109 | 2006-05-25   | 2006-07-28     | 2006-07-28    | Entregado | NULL                                                                                                   |             38 |
|           110 | 2007-03-19   | 2007-04-24     | 2007-04-24    | Entregado | NULL                                                                                                   |             38 |
|           111 | 2008-03-05   | 2008-03-30     | 2008-03-30    | Entregado | NULL                                                                                                   |             36 |
|           112 | 2009-03-05   | 2009-04-06     | 2009-05-07    | Pendiente | NULL                                                                                                   |             36 |
|           113 | 2008-10-28   | 2008-11-09     | 2009-01-09    | Rechazado | El producto ha sido rechazado por la tardanza de el envio                                              |             36 |
|           114 | 2009-01-15   | 2009-01-29     | 2009-01-31    | Entregado | El envio llego dos dias más tarde debido al mal tiempo                                                 |             36 |
|           115 | 2008-11-29   | 2009-01-26     | 2009-02-27    | Pendiente | NULL                                                                                                   |             36 |
|           116 | 2008-06-28   | 2008-08-01     | 2008-08-01    | Entregado | NULL                                                                                                   |             38 |
|           117 | 2008-08-25   | 2008-10-01     | NULL          | Rechazado | El pedido ha sido rechazado por la acumulacion de pago pendientes del cliente                          |             38 |
|           118 | 2009-02-15   | 2009-02-27     | NULL          | Pendiente | NULL                                                                                                   |             16 |
|           119 | 2009-01-10   | 2009-01-15     | 2009-01-15    | Entregado | El pedido llego perfectamente                                                                          |             16 |
|           120 | 2009-03-07   | 2009-03-27     | NULL          | Rechazado | El pedido fue rechazado por el cliente                                                                 |             16 |
|           121 | 2008-12-28   | 2009-01-08     | 2009-01-08    | Entregado | Pago pendiente                                                                                         |             16 |
|           122 | 2009-04-09   | 2009-04-15     | 2009-04-15    | Entregado | NULL                                                                                                   |             16 |
|           123 | 2009-01-15   | 2009-01-20     | 2009-01-24    | Pendiente | NULL                                                                                                   |             30 |
|           124 | 2009-03-02   | 2009-03-06     | 2009-03-06    | Entregado | NULL                                                                                                   |             30 |
|           125 | 2009-02-14   | 2009-02-20     | NULL          | Rechazado | el producto ha sido rechazado por la pesima calidad                                                    |             30 |
|           126 | 2009-05-13   | 2009-05-15     | 2009-05-20    | Pendiente | NULL                                                                                                   |             30 |
|           127 | 2009-04-06   | 2009-04-10     | 2009-04-10    | Entregado | NULL                                                                                                   |             30 |
|           128 | 2008-11-10   | 2008-12-10     | 2008-12-29    | Rechazado | El pedido ha sido rechazado por el cliente por el retraso en la entrega                                |             38 |
|           129 | 2009-12-18   | 2009-12-20     | NULL          | Rechazado | El cliente ha cambiado la dirección de envío                                                           |             39 |
|           130 | 2009-12-20   | 2009-12-23     | 2009-12-23    | Entregado | El cliente ha pedido que le llamemos antes de hacer la entrega                                         |             39 |
+---------------+--------------+----------------+---------------+-----------+--------------------------------------------------------------------------------------------------------+----------------+
117 rows in set (0.00 sec)

commit;



---5. Actualiza el código del cliente que hemos creado en el paso anterior y averigua si hubo cambios en las tablas relacionadas. Usando transacciones.
start transaction;
update cliente set codigo_cliente=2 where codigo_cliente=39;

mysql> update cliente set codigo_cliente=2 where codigo_cliente=39;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`empresa_pyme`.`pedido`, CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo_cliente`))

commit;

"NO ha habido cambios ya que no hemos podido actualizar el código de cliente ya que estaba relacionado con otras tablas, para poder modificar ese valor, debemos eliminar/actualizar el dato que se encuentra en la tabla relacionada (pedidos) y posteriormente actualizar el valor de la tabla (cliente)."


---6. Borra el cliente y averigua si hubo cambios en las tablas relacionadas.
start transaction;
delete from cliente where codigo_cliente=39;

mysql> delete from cliente where codigo_cliente=39;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`empresa_pyme`.`pedido`, CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo_cliente`))

commit;

"NO ha habido cambios ya que no hemos podido eliminar el cliente ya que estaba relacionado con otras tablas, para poder modificar ese valor, debemos eliminar el dato que se encuentra en la tabla relacionada (pedidos) y posteriormente actualizar el valor de la tabla (cliente)."

---7. Elimina los clientes que no hayan realizado ningún pedido
start transaction;
delete from cliente where codigo_cliente not in (select codigo_cliente from pedido);

mysql> delete from cliente where codigo_cliente not in (select codigo_cliente from pedido);
Query OK, 17 rows affected (0.00 sec)

mysql> select * from cliente;
+----------------+--------------------------------+-----------------+-------------------+-------------+-------------+--------------------------------------------+-------------------+--------------------------+---------------------+-----------+---------------+----------------------------+----------------+
| codigo_cliente | nombre_cliente                 | nombre_contacto | apellido_contacto | telefono    | fax         | linea_direccion1                           | linea_direccion2  | ciudad                   | region              | pais      | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
+----------------+--------------------------------+-----------------+-------------------+-------------+-------------+--------------------------------------------+-------------------+--------------------------+---------------------+-----------+---------------+----------------------------+----------------+
|              1 | GoldFish Garden                | Daniel G        | GoldFish          | 5556901745  | 5556901746  | False Street 52 2 A                        | NULL              | San Francisco            | NULL                | USA       | 24006         |                         19 |        3000.00 |
|              3 | Gardening Associates           | Anne            | Wright            | 5557410345  | 5557410346  | Wall-e Avenue                              | NULL              | Miami                    | Miami               | USA       | 24010         |                         19 |        6000.00 |
|              4 | Gerudo Valley                  | Link            | Flaute            | 5552323129  | 5552323128  | Oaks Avenue nº22                           | NULL              | New York                 | NULL                | USA       | 85495         |                         22 |       12000.00 |
|              5 | Tendo Garden                   | Akane           | Tendo             | 55591233210 | 55591233211 | Null Street nº69                           | NULL              | Miami                    | NULL                | USA       | 696969        |                         22 |      600000.00 |
|              7 | Beragua                        | Jose            | Bermejo           | 654987321   | 916549872   | C/pintor segundo                           | Getafe            | Madrid                   | Madrid              | Spain     | 28942         |                         11 |       20000.00 |
|              9 | Naturagua                      | Guillermo       | Rengifo           | 689234750   | 916428956   | C/majadahonda                              | Boadilla          | Madrid                   | Madrid              | Spain     | 28947         |                         11 |       32000.00 |
|             13 | Camunas Jardines S.L.          | Pedro           | Camunas           | 34914873241 | 34914871541 | C/Virgenes 45                              | C/Princesas 2 1ºB | San Lorenzo del Escorial | Madrid              | Spain     | 28145         |                          8 |       16481.00 |
|             14 | Dardena S.A.                   | Juan            | Rodriguez         | 34912453217 | 34912484764 | C/Nueva York 74                            | NULL              | Madrid                   | Madrid              | Spain     | 28003         |                          8 |      321000.00 |
|             15 | Jardin de Flores               | Javier          | Villar            | 654865643   | 914538776   | C/ Oña 34                                  | NULL              | Madrid                   | Madrid              | Spain     | 28950         |                         30 |       40000.00 |
|             16 | Flores Marivi                  | Maria           | Rodriguez         | 666555444   | 912458657   | C/Leganes24                                | NULL              | Fuenlabrada              | Madrid              | Spain     | 28945         |                          5 |        1500.00 |
|             19 | Golf S.A.                      | Luis            | Martinez          | 916458762   | 912354475   | C/Estancado                                | NULL              | Santa cruz de Tenerife   | Islas Canarias      | Spain     | 38297         |                         12 |       30000.00 |
|             23 | Sotogrande                     | Maria           | Santillana        | 915576622   | 914825645   | C/Paseo del Parque                         | NULL              | Sotogrande               | Cadiz               | Spain     | 11310         |                         12 |       60000.00 |
|             26 | Jardines y Mansiones Cactus SL | Eva María       | Sánchez           | 916877445   | 914477777   | Polígono Industrial Maspalomas, Nº52       | Móstoles          | Madrid                   | Madrid              | Spain     | 29874         |                          9 |       76000.00 |
|             27 | Jardinerías Matías SL          | Matías          | San Martín        | 916544147   | 917897474   | C/Francisco Arce, Nº44                     | Bustarviejo       | Madrid                   | Madrid              | Spain     | 37845         |                          9 |      100500.00 |
|             28 | Agrojardin                     | Benito          | Lopez             | 675432926   | 916549264   | C/Mar Caspio 43                            | NULL              | Getafe                   | Madrid              | Spain     | 28904         |                         30 |        8040.00 |
|             30 | Jardineria Sara                | Sara            | Marquez           | 675124537   | 912475843   | C/Lima 1                                   | NULL              | Fuenlabrada              | Madrid              | Spain     | 27584         |                          5 |        7500.00 |
|             35 | Tutifruti S.A                  | Jacob           | Jones             | 2 9261-2433 | 2 9283-1695 | level 24, St. Martins Tower.-31 Market St. | NULL              | Sydney                   | Nueva Gales del Sur | Australia | 2000          |                         31 |       10000.00 |
|             36 | Flores S.L.                    | Antonio         | Romero            | 654352981   | 685249700   | Avenida España                             | NULL              | Madrid                   | Fuenlabrada         | Spain     | 29643         |                         18 |        6000.00 |
|             38 | El Jardin Viviente S.L         | Justin          | Smith             | 2 8005-7161 | 2 8005-7162 | 176 Cumberland Street The rocks            | NULL              | Sydney                   | Nueva Gales del Sur | Australia | 2003          |                         31 |        8000.00 |
|             39 | OJUQUECALOH S.L.               | Daniel          | Carriso           | 919659397   | 919659397   | C. Isla de Fuerteventura 9                 | NULL              | Almería                  | Andalucía           | Spain     | 4007          |                         32 |       27000.00 |
+----------------+--------------------------------+-----------------+-------------------+-------------+-------------+--------------------------------------------+-------------------+--------------------------+---------------------+-----------+---------------+----------------------------+----------------+
20 rows in set (0.00 sec)

commit;



---8. Incrementa en un 20% el precio de los productos que no tengan pedidos.
start transaction;
update producto set precio_venta=(precio_venta*1.2)  where codigo_producto not in (select codigo_producto from detalle_pedido);

mysql> update producto set precio_venta=(precio_venta*1.2)  where codigo_producto not in (select codigo_producto from detalle_pedido);
Query OK, 129 rows affected (0.01 sec)
Rows matched: 129  Changed: 129  Warnings: 0

select codigo_producto,nombre,precio_venta from producto limit 20;

mysql> select codigo_producto,nombre,precio_venta from producto limit 50;
+-----------------+-------------------------------------------------------------+--------------+
| codigo_producto | nombre                                                      | precio_venta |
+-----------------+-------------------------------------------------------------+--------------+
| 11679           | Sierra de Poda 400MM                                        |        14.00 |
| 21636           | Pala                                                        |        14.00 |
| 22225           | Rastrillo de Jardín                                         |        12.00 |
| 30310           | Azadón                                                      |        12.00 |
| AR-001          | Ajedrea                                                     |         1.00 |
| AR-002          | Lavándula Dentata                                           |         1.00 |
| AR-003          | Mejorana                                                    |         1.00 |
| AR-004          | Melissa                                                     |         1.00 |
| AR-005          | Mentha Sativa                                               |         1.00 |
| AR-006          | Petrosilium Hortense (Peregil)                              |         1.00 |
| AR-007          | Salvia Mix                                                  |         1.00 |
| AR-008          | Thymus Citriodra (Tomillo limón)                            |         1.00 |
| AR-009          | Thymus Vulgaris                                             |         1.00 |
| AR-010          | Santolina Chamaecyparys                                     |         1.00 |
| FR-1            | Expositor Cítricos Mix                                      |         7.00 |
| FR-10           | Limonero 2 años injerto                                     |         7.00 |
| FR-100          | Nectarina                                                   |        11.00 |
| FR-101          | Nogal                                                       |        13.00 |
| FR-102          | Olea-Olivos                                                 |        18.00 |
| FR-103          | Olea-Olivos                                                 |        25.00 |
| FR-104          | Olea-Olivos                                                 |        58.80 |
| FR-105          | Olea-Olivos                                                 |        70.00 |
| FR-106          | Peral                                                       |        11.00 |
| FR-107          | Peral                                                       |        22.00 |
| FR-108          | Peral                                                       |        32.00 |
| FR-11           | Limonero 30/40                                              |       100.00 |
| FR-12           | Kunquat                                                     |        21.00 |
| FR-13           | Kunquat  EXTRA con FRUTA                                    |        57.00 |
| FR-14           | Calamondin Mini                                             |        12.00 |
| FR-15           | Calamondin Copa                                             |        25.00 |
| FR-16           | Calamondin Copa EXTRA Con FRUTA                             |        45.00 |
| FR-17           | Rosal bajo 1Âª -En maceta-inicio brotación                  |         2.00 |
| FR-18           | ROSAL TREPADOR                                              |         4.00 |
| FR-19           | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |         4.80 |
| FR-2            | Naranjo -Plantón joven 1 año injerto                        |         6.00 |
| FR-20           | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |         4.80 |
| FR-21           | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |         4.80 |
| FR-22           | Pitimini rojo                                               |         4.00 |
| FR-23           | Rosal copa                                                  |         8.00 |
| FR-24           | Albaricoquero Corbato                                       |         9.60 |
| FR-25           | Albaricoquero Moniqui                                       |         9.60 |
| FR-26           | Albaricoquero Kurrot                                        |         9.60 |
| FR-27           | Cerezo Burlat                                               |         9.60 |
| FR-28           | Cerezo Picota                                               |         9.60 |
| FR-29           | Cerezo Napoleón                                             |         8.00 |
| FR-3            | Naranjo 2 años injerto                                      |         7.00 |
| FR-30           | Ciruelo R. Claudia Verde                                    |         9.60 |
| FR-31           | Ciruelo Santa Rosa                                          |         8.00 |
| FR-32           | Ciruelo Golden Japan                                        |         9.60 |
| FR-33           | Ciruelo Friar                                               |         8.00 |
+-----------------+-------------------------------------------------------------+--------------+
50 rows in set (0.00 sec)

commit;



---9. Borra los pagos del cliente con menor límite de crédito. Usando transacciones.
start transaction;
delete from  pago where codigo_cliente like (select codigo_cliente from cliente where limite_credito=(select min(limite_credito)from cliente));

mysql> select * from pago;
+----------------+---------------+----------------+------------+----------+
| codigo_cliente | forma_pago    | id_transaccion | fecha_pago | total    |
+----------------+---------------+----------------+------------+----------+
|              1 | PayPal        | ak-std-000001  | 2008-11-10 |  2000.00 |
|              1 | PayPal        | ak-std-000002  | 2008-12-10 |  2000.00 |
|              3 | PayPal        | ak-std-000003  | 2009-01-16 |  5000.00 |
|              3 | PayPal        | ak-std-000004  | 2009-02-16 |  5000.00 |
|              3 | PayPal        | ak-std-000005  | 2009-02-19 |   926.00 |
|              4 | PayPal        | ak-std-000006  | 2007-01-08 | 20000.00 |
|              4 | PayPal        | ak-std-000007  | 2007-01-08 | 20000.00 |
|              4 | PayPal        | ak-std-000008  | 2007-01-08 | 20000.00 |
|              4 | PayPal        | ak-std-000009  | 2007-01-08 | 20000.00 |
|              4 | PayPal        | ak-std-000010  | 2007-01-08 |  1849.00 |
|              5 | Transferencia | ak-std-000011  | 2006-01-18 | 23794.00 |
|              7 | Cheque        | ak-std-000012  | 2009-01-13 |  2390.00 |
|              9 | PayPal        | ak-std-000013  | 2009-01-06 |   929.00 |
|             13 | PayPal        | ak-std-000014  | 2008-08-04 |  2246.00 |
|             14 | PayPal        | ak-std-000015  | 2008-07-15 |  4160.00 |
|             15 | PayPal        | ak-std-000016  | 2009-01-15 |  2081.00 |
|             15 | PayPal        | ak-std-000035  | 2009-02-15 | 10000.00 |
|             19 | PayPal        | ak-std-000018  | 2009-03-06 |   232.00 |
|             23 | PayPal        | ak-std-000019  | 2009-03-26 |   272.00 |
|             26 | PayPal        | ak-std-000020  | 2008-03-18 | 18846.00 |
|             27 | PayPal        | ak-std-000021  | 2009-02-08 | 10972.00 |
|             28 | PayPal        | ak-std-000022  | 2009-01-13 |  8489.00 |
|             30 | PayPal        | ak-std-000024  | 2009-01-16 |  7863.00 |
|             35 | PayPal        | ak-std-000025  | 2007-10-06 |  3321.00 |
|             38 | PayPal        | ak-std-000026  | 2006-05-26 |  1171.00 |
+----------------+---------------+----------------+------------+----------+
25 rows in set (0.00 sec)

commit;



---10. Elimina la acción anterior. ¿Es posible?
Podríamos usar el comando rollback pero como hemos utilizado commit antes de este ejercicio no podríamos dar marcha atrás.


---11. Establece a 0 el límite de crédito del cliente que menos unidades pedidas tenga del producto OR-179.
start transaction;
update cliente set limite_credito=0  where codigo_cliente in (select codigo_cliente from pedido where codigo_pedido in (select codigo_pedido from detalle_pedido where codigo_producto="OR-179" and cantidad in (select min(cantidad) from detalle_pedido)));
commit;

Query OK, 1 row affected (0.16 sec)
Rows matched: 1  Changed: 1  Warnings: 0

---12. Modifica la tabla detalle_pedido para insertar un campo numérico llamado iva. Mediante una transacción, establece el valor de ese campo a 18 para aquellos registros cuyo pedido tenga fecha a partir de Enero de 2009. A continuación actualiza el resto de pedidos estableciendo el iva al 21.
start transaction;
alter table detalle_pedido add column iva int not null;
update detalle_pedido set IVA=18 where codigo_pedido in (select codigo_pedido from pedido where fecha_pedido>"2009-01-01");
commit;

Query OK, 161 rows affected (0.01 sec)
Rows matched: 161  Changed: 161  Warnings: 0

---13. Modifica la tabla detalle_pedido para incorporar un campo numérico llamado total_linea y actualiza todos sus registros para calcular su valor con la fórmula: total_linea = precio_unidad*cantidad * (1 + (iva/100));
start transaction;
alter table detalle_pedido add column total_linea int not null;
update detalle_pedido set total_linea=detalle_pedido.precio_unidad*detalle_pedido.cantidad*(1+(detalle_pedido.IVA/100));
commit;

Query OK, 318 rows affected (0.05 sec)
Rows matched: 318  Changed: 318  Warnings: 0

---14. Borra el cliente que menor límite de crédito tenga. ¿Es posible borrarlo solo con una consulta? ¿Por qué?
start transaction;
delete from cliente where limite_credito in (select min(limite_credito));
commit;

ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`empresa_pyme`.`pago`, CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo_cliente`))

Como en los ejemplos anteriores, las tablas comparten una clave y están enlazadas, por lo que para poder borrarla deberíamos eliminar las tablas en el orden correcto.

---15. Inserta tres clientes que tengan como representantes de ventas los empleados que hemos creado en el paso anterior. Usando transacciones.
start transaction;
insert into cliente values( 40,"FERIAS S.L.","Daniela","Picazo",919760497,9197604977,"C. Isla de Canarias 12",NULL,"Almería","Andalucía","Spain",04008,32,27000);

insert into cliente values( 41,"SAN TELMO DONUTS S.A.","Telmo","Ruiz",956760421,956760421,"C. del Hierro 3, 12",NULL,"Madrid","Madrid","Spain",28045,32,27000);

insert into cliente values( 42,"Empanadas GERI S.L.","Gerardo","Piquembaguer",910060488,910060488,"C. Isla de Canarias 12",NULL,"Barcelona","Cataluña","Spain",08001,32,27000);
commit;


---16. Realiza una transacción que inserte un pedido para cada uno de los clientes. Cada pedido debe incluir dos productos
start transaction;
insert into pedido(codigo_pedido,fecha_pedido,fecha_esperada,fecha_entrega,estado,comentarios,codigo_cliente) values(129,"2014-06-25","2014-06-26","2014-06-26","Entregado","Pagado a contrarembolso",1)

insert into detalle_pedido(codigo_pedido,codigo_producto,cantidad,precio_unidad,numero_linea,IVA,total_linea) values(129,"OR-127",2,13,5,18,345);


insert into pedido(codigo_pedido,fecha_pedido,fecha_esperada,fecha_entrega,estado,comentarios,codigo_cliente) values(130,"2014-06-25","2014-06-26","2014-06-26","Entregado","Pagado en efectivo",2)

insert into detalle_pedido(codigo_pedido,codigo_producto,cantidad,precio_unidad,numero_linea,IVA,total_linea) values(130,"OR-141",2,17,5,18,345);


insert into pedido(codigo_pedido,fecha_pedido,fecha_esperada,fecha_entrega,estado,comentarios,codigo_cliente) values(131,"2014-06-25","2014-06-26","2014-06-26","No Entregado","Cliente no presente",3)

insert into detalle_pedido(codigo_pedido,codigo_producto,cantidad,precio_unidad,numero_linea,IVA,total_linea) values(131,"OR-179",2,34.20,5,18,345);

commit;
