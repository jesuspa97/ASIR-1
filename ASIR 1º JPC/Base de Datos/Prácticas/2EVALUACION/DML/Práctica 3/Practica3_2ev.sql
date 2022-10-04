Parte1

---1. Muestra la versión de Mysql---

        select version();
        +------------+
        | version()  |
        +------------+
        | 5.7.17-log |
        +------------+
        1 row in set (0.00 sec)

---2. Muestra la fecha y hora actual---

        select now();
        +---------------------+
        | now()               |
        +---------------------+
        | 2022-02-04 08:41:50 |
        +---------------------+
        1 row in set (0.03 sec)

---3. Compara las cadenas (“Salesianos”, y “SALESIANOS”)---

        select strcmp ("Salesianos", "SALESIANOS");
        +-------------------------------------+
        | strcmp ("Salesianos", "SALESIANOS") |
        +-------------------------------------+
        |                                   0 |
        +-------------------------------------+
        1 row in set (0.12 sec)

---4. Muestra la longitud de la cadena de los “ename” de la tabla EMP.---

       select char_length(ename) from emp;
        +--------------------+
        | char_length(ename) |
        +--------------------+
        |                  5 |
        |                  5 |
        |                  4 |
        |                  5 |
        |                  6 |
        |                  5 |
        |                  5 |
        |                  5 |
        |                  4 |
        |                  6 |
        |                  5 |
        |                  5 |
        |                  4 |
        |                  6 |
        +--------------------+
        14 rows in set (0.00 sec)

---5. Concatena los “Ename” y los “job” de todos los empleados, separándolos con un guión (“-“).---

       select concat(ename,"-",job) from emp;
        +-----------------------+
        | concat(ename,"-",job) |
        +-----------------------+
        | SMITH-CLERK           |
        | ALLEN-SALESMAN        |
        | WARD-SALESMAN         |
        | JONES-MANAGER         |
        | MARTIN-SALESMAN       |
        | BLAKE-MANAGER         |
        | CLARK-MANAGER         |
        | SCOTT-ANALYST         |
        | KING-PRESIDENT        |
        | TURNER-SALESMAN       |
        | ADAMS-CLERK           |
        | JAMES-CLERK           |
        | FORD-ANALYST          |
        | MILLER-CLERK          |
        +-----------------------+
        14 rows in set (0.00 sec)

---6. Muéstra los “loc” alreves de la tabla DEPT.---

        select reverse(loc) from dept;
        +--------------+
        | reverse(loc) |
        +--------------+
        | KROY WEN     |
        | SALLAD       |
        | OGACIHC      |
        | NOTSOB       |
        +--------------+
        4 rows in set (0.01 sec)
---7. Rellena con puntos “.” por la derecha hasta 20 caracteres los ename de la tabla emp.---

        select rpad(ename, 20,".") from emp;
        +----------------------+
        | rpad(ename, 20,".")  |
        +----------------------+
        | SMITH............... |
        | ALLEN............... |
        | WARD................ |
        | JONES............... |
        | MARTIN.............. |
        | BLAKE............... |
        | CLARK............... |
        | SCOTT............... |
        | KING................ |
        | TURNER.............. |
        | ADAMS............... |
        | JAMES............... |
        | FORD................ |
        | MILLER.............. |
        +----------------------+
        14 rows in set (0.00 sec)

---8. Muestra en mayúsculas todos Dname de la tabla DEPT.---

        select upper(dname) from dept;
        +--------------+
        | upper(dname) |
        +--------------+
        | ACCOUNTING   |
        | RESEARCH     |
        | SALES        |
        | OPERATIONS   |
        +--------------+
        4 rows in set (0.01 sec)

---9. Muestra el nombre y el año (solo el año de la fecha) de todos los empleados.---

        select ename, year(hiredate) from emp;
        +--------+----------------+
        | ename  | year(hiredate) |
        +--------+----------------+
        | SMITH  |           1980 |
        | ALLEN  |           1981 |
        | WARD   |           1981 |
        | JONES  |           1981 |
        | MARTIN |           1981 |
        | BLAKE  |           1981 |
        | CLARK  |           1981 |
        | SCOTT  |           1982 |
        | KING   |           1981 |
        | TURNER |           1981 |
        | ADAMS  |           1983 |
        | JAMES  |           1981 |
        | FORD   |           1981 |
        | MILLER |           1982 |
        +--------+----------------+
        14 rows in set (0.00 sec)

---10. Muestra la hora actual.---

        select curtime();
        +-----------+
        | curtime() |
        +-----------+
        | 08:55:21  |
        +-----------+
        1 row in set (0.00 sec)

---11. Muestra el día de la semana de hoy.---

        select dayname(now());
        +----------------+
        | dayname(now()) |
        +----------------+
        | Friday         |
        +----------------+
        1 row in set (0.02 sec)

---12. Muestra la fecha de hoy en formato: 7 de Febrero de 2021---

        select date_format(now(),"%D of %M of %Y");
        +-------------------------------------+
        | date_format(now(),"%D of %M of %Y") |
        +-------------------------------------+
        | 4th of February of 2022             |
        +-------------------------------------+
        1 row in set (0.00 sec)

---13. Muestra la fecha de la tabla emp en formato: 7 de Febrero de 2021---

        select date_format(hiredate,"%D of %M of %Y") from emp;
        +----------------------------------------+
        | date_format(hiredate,"%D of %M of %Y") |
        +----------------------------------------+
        | 17th of December of 1980               |
        | 20th of February of 1981               |
        | 22nd of February of 1981               |
        | 2nd of April of 1981                   |
        | 28th of September of 1981              |
        | 1st of May of 1981                     |
        | 9th of June of 1981                    |
        | 9th of December of 1982                |
        | 17th of November of 1981               |
        | 8th of September of 1981               |
        | 12th of January of 1983                |
        | 3rd of December of 1981                |
        | 3rd of December of 1981                |
        | 23rd of January of 1982                |
        +----------------------------------------+
        14 rows in set (0.00 sec)

---14. Muestra el salario más alto de la tabla emp.---

        select max(sal) from emp;
        +----------+
        | max(sal) |
        +----------+
        |     5000 |
        +----------+
        1 row in set (0.00 sec)

---15. Muestra el primer empleado contratado en la empresa.---

        select ename from emp order by hiredate limit 1;
        +-------+
        | ename |
        +-------+
        | SMITH |
        +-------+
        1 row in set (0.03 sec)

---16. Calcula el salario medio de la empresa.---

        select avg(sal) from emp;
        +-------------------+
        | avg(sal)          |
        +-------------------+
        | 2073.214285714286 |
        +-------------------+
        1 row in set (0.00 sec)

---17. Halla la media de los salarios de los departamentos cuyo salario mínimo supera a 1000.---

        select avg(sal) from emp group by deptno having min(sal)>1000;
        +--------------------+
        | avg(sal)           |
        +--------------------+
        | 2916.6666666666665 |
        +--------------------+
        1 row in set (0.00 sec)

---18. Muestra cuantos empleados no tienen comisión.---

        select count(ename) from emp where comm is null or comm like 0;
        +--------------+
        | count(ename) |
        +--------------+
        |           11 |
        +--------------+
        1 row in set (0.00 sec)

---19. Muestra la media de salario de los departamentos agrupado por departamento.---

        select avg(sal) from emp group by deptno;
        +--------------------+
        | avg(sal)           |
        +--------------------+
        | 2916.6666666666665 |
        |               2175 |
        | 1566.6666666666667 |
        +--------------------+
        3 rows in set (0.00 sec)

---20. Muestra la suma de salario de los departamentos agrupado por departamento cuya suma sea mayor de 2000.---

        select sum(sal) from emp group by deptno having sum(sal)>2000;
        +----------+
        | sum(sal) |
        +----------+
        |     8750 |
        |    10875 |
        |     9400 |
        +----------+
        3 rows in set (0.00 sec)

---21. Prueba las funciones con números de prueba: SIN(), COT(), ACOS(), ASIN(),EXP(), LN(), LOG(),POWER(), SQRT()---

        select SIN(76), COT(85), ACOS(64), ASIN(-33),EXP(76), LN(34), LOG(8), POWER(2,2), SQRT(5);
        +--------------------+-------------------+----------+-----------+-----------------------+--------------------+--------------------+------------+------------------+
        | SIN(76)            | COT(85)           | ACOS(64) | ASIN(-33) | EXP(76)               | LN(34)             | LOG(8)             | POWER(2,2) | SQRT(5)          |
        +--------------------+-------------------+----------+-----------+-----------------------+--------------------+--------------------+------------+------------------+
        | 0.5661076368981803 | 5.590647039501968 |     NULL |      NULL | 1.0148003881138887e33 | 3.5263605246161616 | 2.0794415416798357 |          4 | 2.23606797749979 |
        +--------------------+-------------------+----------+-----------+-----------------------+--------------------+--------------------+------------+------------------+
        1 row in set (0.00 sec)




Parte2
---Crea una base de datos "ejercicio3", en la que guardaremos información sobre selecciones nacionales de baloncesto.---

---Para ello tendremos: una tabla "PAIS" y una tabla "JUGADOR".---

---De cada país guardaremos el nombre (por ejemplo, "España") y un código que actuará como clave primaria (por ejemplo, “ESP”). De cada jugador anotaremos código, nombre, apellidos, posición y código de la selección a la que pertenece.---

CREATE DATABASE EJERCICIO3;
USE EJERCICIO3;
CREATE TABLE PAIS (
    CODIGO_PAIS VARCHAR(3) PRIMARY KEY,
    NOMBRE VARCHAR(15) NOT NULL
);
CREATE TABLE JUGADOR (
    CODIGO VARCHAR(3) PRIMARY KEY,
    NOMBRE VARCHAR(15) NOT NULL,
    APELLIDOS VARCHAR(15) NOT NULL,
    POSICION VARCHAR(15) NOT NULL,
    CODIGO_PAIS VARCHAR(3) NOT NULL REFERENCES PAIS(CODIGO_PAIS)
);
INSERT INTO PAIS VALUES ("ESP", "ESPAÑA");
INSERT INTO PAIS VALUES ("ARG", "ARGENTINA");
INSERT INTO PAIS VALUES ("AUS", "AUSTRALIA");
INSERT INTO PAIS VALUES ("LIT", "LITUANIA");

INSERT INTO JUGADOR VALUES ("RUB", "RICKY", "RUBIO", "BASE","ESP");
INSERT INTO JUGADOR VALUES ("NAV", "SERGIO", "LULL", "ALERO","ESP");
INSERT INTO JUGADOR VALUES ("SCO", "LUIS", "SCOLA", "ALA-PIVOT","ARG");
INSERT INTO JUGADOR VALUES ("DEL", "CARLOS", "DELFINO", "ESCOLTA","ARG");
INSERT INTO JUGADOR VALUES ("MAC", "JONAS", "MACIULIS", "ALERO","LIT");
INSERT INTO JUGADOR VALUES ("BOG", "ANDREW", "BOGUT", "PIVOT","AUS");
INSERT INTO JUGADOR VALUES ("LBN", "LA BOMBA", "NAVARRO", "RETIRADO","ESP");
1. Añade los países:
▪ ESP, España
▪ ARG, Argentina
▪ AUS, Australia
▪ LIT, Lituania
2. Añade los jugadores:
▪ RUB, Ricky, Rubio, Base,ESP
▪ NAV, Sergio, Lull, Alero,ESP
▪ SCO, Luis, Scola, Ala-Pivot,ARG
▪ DEL, Carlos, Delfino, Escolta,ARG
▪ MAC, Jonas, Maciulis, Alero,LIT
▪ BOG, Andrew, Bogut, Pivot,AUS
***INSERT INTO JUGADOR VALUES ("LBN", "LA BOMBA", "NAVARRO", "RETIRADO","ESP");
Puedes añadir más datos de prueba.

Crea con funciones lo siguiente:

---1. Muestra los nombres y apellidos de todos los jugadores, en mayúsculas, ordenados por apellido y nombre.---

        select upper(nombre), upper(apellidos) from jugador order by apellidos, nombre;
        +---------------+------------------+
        | upper(nombre) | upper(apellidos) |
        +---------------+------------------+
        | ANDREW        | BOGUT            |
        | CARLOS        | DELFINO          |
        | SERGIO        | LULL             |
        | JONAS         | MACIULIS         |
        | RICKY         | RUBIO            |
        | LUIS          | SCOLA            |
        +---------------+------------------+
        6 rows in set (0.00 sec)

---2. Muestra el nombre y apellidos del jugador o jugadores cuyo apellido es el más largo (formado por más letras).---

        select nombre, apellidos from jugador where char_length(apellidos) like (select max(char_length(apellidos)) from jugador);
        +--------+-----------+
        | nombre | apellidos |
        +--------+-----------+
        | Jonas  | Maciulis  |
        +--------+-----------+
        1 row in set (0.00 sec)

---3. Muestra el apellido, una coma, un espacio y después el nombre de todos los jugadores de "España" (aparecerán datos como "Rubio, Ricky"). Para ello, usa la función "CONCAT".--


4. Muestra las 4 primeras letras de los apellidos de los jugadores de "Argentina", ordenados
de forma descendente.
5. Muestra los nombres de todos los jugadores, reemplazando "Ricky" por "Ricardo".
6. Muestra los valores: "Don " seguido del nombre y del apellido de los jugadores
(aparecerán datos como "Don Andrew Bogut"), usando "CONCAT"
7. Muestra el nombre y apellidos de todos los jugadores cuyo país contenga una N en el
nombre. Debes eliminar los espacios iníciales y finales de ambos campos, en caso de que
existan.
8. Muestra al revés el apellido de los jugadores de Australia.
9. Muestra una cadena formada por 10 guiones, Nombre y otros 10 guiones.