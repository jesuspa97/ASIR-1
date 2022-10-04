--1. Ver todos los nombres y distritos de las ciudades.
create view view_1 as (select name,district from city);
describe view_1;

+----------+----------+------+-----+---------+-------+
| Field    | Type     | Null | Key | Default | Extra |
+----------+----------+------+-----+---------+-------+
| name     | char(35) | NO   |     |         |       |
| district | char(20) | NO   |     |         |       |
+----------+----------+------+-----+---------+-------+
2 rows in set (0.00 sec)

--2. Ver todas las ciudades que tienen el código ESP.
create view view_2 as (select name from city where countrycode = "ESP");
describe view_2;

+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| name  | char(35) | NO   |     |         |       |
+-------+----------+------+-----+---------+-------+
1 row in set (0.00 sec)

--3. Ver todas las ciudades y sus códigos de pais, ordenados por código de país.
create view view_3 as (select name,countrycode from city order by countrycode);
describe view_3;

+-------------+----------+------+-----+---------+-------+
| Field       | Type     | Null | Key | Default | Extra |
+-------------+----------+------+-----+---------+-------+
| name        | char(35) | NO   |     |         |       |
| countrycode | char(3)  | NO   |     |         |       |
+-------------+----------+------+-----+---------+-------+
2 rows in set (0.01 sec)

--4. Sacar la población menor,mayor,y la media aritmética.
create view view_4 as (select min(Population),max(Population),avg(Population) from city);
describe view_4;

+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| min(Population) | int(11)       | YES  |     | NULL    |       |
| max(Population) | int(11)       | YES  |     | NULL    |       |
| avg(Population) | decimal(14,4) | YES  |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

--5. Sacar el nombre de la ciudad con más habitantes.
create view view_5 as (select name from city where Population = (select max(Population) from city));
describe view_5;

+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| name  | char(35) | NO   |     |         |       |
+-------+----------+------+-----+---------+-------+
1 row in set (0.00 sec)

--6. Ver todas las Provincias(distritos) de España.
create view view_6 as (select distinct district from city where countrycode = "ESP");
describe view_6;

+----------+----------+------+-----+---------+-------+
| Field    | Type     | Null | Key | Default | Extra |
+----------+----------+------+-----+---------+-------+
| district | char(20) | NO   |     |         |       |
+----------+----------+------+-----+---------+-------+
1 row in set (0.00 sec)

--7. Ver el número de ciudades por provincia de España.
create view view_7 as (select count(name) from city where countrycode ="ESP" group by district);
describe view_7;

+-------------+------------+------+-----+---------+-------+
| Field       | Type       | Null | Key | Default | Extra |
+-------------+------------+------+-----+---------+-------+
| count(name) | bigint(21) | NO   |     | 0       |       |
+-------------+------------+------+-----+---------+-------+
1 row in set (0.00 sec)

--8. Ver todas las ciudades de Madrid.
create view view_8 as (select name from city where district ="Madrid");
describe view_8;

+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| name  | char(35) | NO   |     |         |       |
+-------+----------+------+-----+---------+-------+
1 row in set (0.02 sec)

--9. Ver la Lista de capitales africanas.
create view view_9 as (select Capital from country where Continent = "Africa");
describe view_9;

+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| Capital | int(11) | YES  |     | NULL    |       |
+---------+---------+------+-----+---------+-------+
1 row in set (0.00 sec)

--10. Sacar los países, con su esperanza de vida.
create view view_10 as (select name, LifeExpectancy from country);
describe view_10;

+----------------+------------+------+-----+---------+-------+
| Field          | Type       | Null | Key | Default | Extra |
+----------------+------------+------+-----+---------+-------+
| name           | char(52)   | NO   |     |         |       |
| LifeExpectancy | float(3,1) | YES  |     | NULL    |       |
+----------------+------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

--11. Obtén una lista con los siguientes campos: Ciudad, población, país, superficie, idioma oficial.
create view view_11 as (select city.name as "city.name",city.Population,country.name, country.surfacearea,group_concat(distinct countrylanguage.language) from city,country,countrylanguage where city.countrycode=country.code and country.code=countrylanguage.countrycode and IsOfficial like "T" group by country.code);
describe view_11;

+-------------------------------------------------+-------------+------+-----+---------+-------+
| Field                                           | Type        | Null | Key | Default | Extra |
+-------------------------------------------------+-------------+------+-----+---------+-------+
| city.name                                       | char(35)    | NO   |     |         |       |
| Population                                      | int(11)     | NO   |     | 0       |       |
| name                                            | char(52)    | NO   |     |         |       |
| surfacearea                                     | float(10,2) | NO   |     | 0.00    |       |
| group_concat(distinct countrylanguage.language) | text        | YES  |     | NULL    |       |
+-------------------------------------------------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

--12. Obtén el nombre de la capital de todos los países.
create view view_12 as (select city.name from city,country where city.id = country.capital);
describe view_12;

+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| name  | char(35) | NO   |     |         |       |
+-------+----------+------+-----+---------+-------+
1 row in set (0.02 sec)

--13. Lista todos los países con más de 1 millón de habitantes con sus capitales y la lengua oficial.
create view view_13 as (select country.name,city.name as "Capital",country.population,group_concat(distinct countrylanguage.language) from city,country,countrylanguage where city.id = country.capital and city.countrycode=country.code and country.code=countrylanguage.countrycode and IsOfficial like "T" and country.population >1000000 group by country.code);
describe view_13;

+-------------------------------------------------+----------+------+-----+---------+-------+
| Field                                           | Type     | Null | Key | Default | Extra |
+-------------------------------------------------+----------+------+-----+---------+-------+
| name                                            | char(52) | NO   |     |         |       |
| Capital                                         | char(35) | NO   |     |         |       |
| population                                      | int(11)  | NO   |     | 0       |       |
| group_concat(distinct countrylanguage.language) | text     | YES  |     | NULL    |       |
+-------------------------------------------------+----------+------+-----+---------+-------+
4 rows in set (0.00 sec)

--14. Cuantos idiomas tiene cada país.
create view view_14 as (select country.name,count(countrylanguage.language) from country,countrylanguage where country.code=countrylanguage.countrycode group by country.name);
describe view_14;

+---------------------------------+------------+------+-----+---------+-------+
| Field                           | Type       | Null | Key | Default | Extra |
+---------------------------------+------------+------+-----+---------+-------+
| name                            | char(52)   | NO   |     |         |       |
| count(countrylanguage.language) | bigint(21) | NO   |     | 0       |       |
+---------------------------------+------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

--15. Saca el jefe de gobierno de cada país.
create view view_15 as (select name, HeadOfState from country);
describe view_15;

+-------------+----------+------+-----+---------+-------+
| Field       | Type     | Null | Key | Default | Extra |
+-------------+----------+------+-----+---------+-------+
| name        | char(52) | NO   |     |         |       |
| HeadOfState | char(60) | YES  |     | NULL    |       |
+-------------+----------+------+-----+---------+-------+
2 rows in set (0.00 sec)
