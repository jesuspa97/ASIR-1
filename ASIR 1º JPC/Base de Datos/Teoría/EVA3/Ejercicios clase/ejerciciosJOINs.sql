Ejercicio para clase:
Usando la BBDD de EMP/DEPT

1.- Mostrar los nombres de empleados y la ciudad donde trabajan.

 select emp.ename, dept.loc from emp inner join dept on emp.deptno=dept.deptno;

    +--------+----------+
    | ename  | loc      |
    +--------+----------+
    | SMITH  | DALLAS   |
    | ALLEN  | CHICAGO  |
    | WARD   | CHICAGO  |
    | JONES  | DALLAS   |
    | MARTIN | CHICAGO  |
    | BLAKE  | CHICAGO  |
    | CLARK  | NEW_YORK |
    | SCOTT  | DALLAS   |
    | KING   | NEW_YORK |
    | TURNER | CHICAGO  |
    | ADAMS  | DALLAS   |
    | JAMES  | CHICAGO  |
    | FORD   | DALLAS   |
    | MILLER | NEW_YORK |
    +--------+----------+
    14 rows in set (0.00 sec)

2.- Mostrar nombres de departamentos y el nombre y salario del empleado.

select emp.ename, emp.sal,dept.dname from emp inner join dept on emp.deptno=dept.deptno;

    +--------+---------+------------+
    | ename  | sal     | dname      |
    +--------+---------+------------+
    | SMITH  |  800.00 | RESEARCH   |
    | ALLEN  | 1600.00 | SALES      |
    | WARD   | 1250.00 | SALES      |
    | JONES  | 2975.00 | RESEARCH   |
    | MARTIN | 1250.00 | SALES      |
    | BLAKE  | 2850.00 | SALES      |
    | CLARK  | 2450.00 | ACCOUNTING |
    | SCOTT  | 3000.00 | RESEARCH   |
    | KING   | 5000.00 | ACCOUNTING |
    | TURNER | 1500.00 | SALES      |
    | ADAMS  | 1100.00 | RESEARCH   |
    | JAMES  |  950.00 | SALES      |
    | FORD   | 3000.00 | RESEARCH   |
    | MILLER | 1300.00 | ACCOUNTING |
    +--------+---------+------------+
    14 rows in set (0.00 sec)

3.- Mostrar los nombres de los departamentos que no tienen empleados.

select dname from emp right join dept on emp.deptno=dept.deptno where not emp.ename is not null;
    +------------+
    | dname      |
    +------------+
    | OPERATIONS |
    +------------+
    1 row in set (0.00 sec)

Usando la BBDD de tienda.sql

4.- Mostrar el nombre del producto y con el nombre del fabricante. Quiero todos los productos incluidos los nulos.

select producto.nombre, fabricante.nombre from producto right join fabricante on producto.codigo_fabricante=fabricante.codigo; 

    +---------------------------------+-----------------+
    | nombre                          | nombre          |
    +---------------------------------+-----------------+
    | Monitor 24 LED Full HD          | Asus            |
    | Monitor 27 LED Full HD          | Asus            |
    | Portátil Yoga 520               | Lenovo          |
    | Portátil Ideapd 320             | Lenovo          |
    | Impresora HP Deskjet 3720       | Hewlett-Packard |
    | Impresora HP Laserjet Pro M26nw | Hewlett-Packard |
    | Disco SSD 1 TB                  | Samsung         |
    | Disco duro SATA3 1TB            | Seagate         |
    | Memoria RAM DDR4 8GB            | Crucial         |
    | GeForce GTX 1080 Xtreme         | Crucial         |
    | GeForce GTX 1050Ti              | Gigabyte        |
    | NULL                            | Huawei          |
    | NULL                            | Xiaomi          |
    +---------------------------------+-----------------+
    13 rows in set (0.00 sec)


5.- Mostrar el nombre del producto y con el nombre del fabricante. Quiero solo los productos que tengan fabricante en la BBDD.

select producto.nombre, fabricante.nombre from producto left join fabricante on producto.codigo_fabricante=fabricante.codigo;

    +---------------------------------+-----------------+
    | nombre                          | nombre          |
    +---------------------------------+-----------------+
    | Disco duro SATA3 1TB            | Seagate         |
    | Memoria RAM DDR4 8GB            | Crucial         |
    | Disco SSD 1 TB                  | Samsung         |
    | GeForce GTX 1050Ti              | Gigabyte        |
    | GeForce GTX 1080 Xtreme         | Crucial         |
    | Monitor 24 LED Full HD          | Asus            |
    | Monitor 27 LED Full HD          | Asus            |
    | Portátil Yoga 520               | Lenovo          |
    | Portátil Ideapd 320             | Lenovo          |
    | Impresora HP Deskjet 3720       | Hewlett-Packard |
    | Impresora HP Laserjet Pro M26nw | Hewlett-Packard |
    +---------------------------------+-----------------+
    11 rows in set (0.01 sec) 


6.-Mostrar los nombre del fabricante y sus productos siempre que el fabricante tenga una "a" en el nombre. 

select fabricante.nombre, producto.nombre as "producto" from fabricante left join producto on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre like "%a%";
    +-----------------+---------------------------------+
    | nombre          | producto                        |
    +-----------------+---------------------------------+
    | Asus            | Monitor 24 LED Full HD          |
    | Asus            | Monitor 27 LED Full HD          |
    | Hewlett-Packard | Impresora HP Deskjet 3720       |
    | Hewlett-Packard | Impresora HP Laserjet Pro M26nw |
    | Samsung         | Disco SSD 1 TB                  |
    | Seagate         | Disco duro SATA3 1TB            |
    | Crucial         | Memoria RAM DDR4 8GB            |
    | Crucial         | GeForce GTX 1080 Xtreme         |
    | Gigabyte        | GeForce GTX 1050Ti              |
    | Huawei          | NULL                            |
    | Xiaomi          | NULL                            |
    +-----------------+---------------------------------+
    11 rows in set (0.00 sec)
