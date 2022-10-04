show databases;
drop database PRACTICA12;

create database PRACTICA12;
use PRACTICA12;
create table DEPT (
DEPTNO INT(12) PRIMARY KEY,
DNAME VARCHAR(14),
LOC VARCHAR(13)
);
create table EMP (
EMPNO int(4) NOT NULL,
ENAME varchar(10),
JOB varchar(9),
MGR int(4),
HIREDATE date,
SAL float(7,2),
COMM float(7,2),
DEPTNO int(2) references DEPT (DEPTNO),
);
(10,"ACCOUNTING", "NEW_YORK"),
(20,"RESEARCH", "DALLAS"),
(30, "SALES", "CHICAGO"),
(40, "OPERATIONS", "BOSTON");



INSERT INTO EMP VALUES (7369,"SMITH","CLERK",7902,"1980-12-17",800,NULL,20);
INSERT INTO EMP VALUES (7499,"ALLEN","SALESMAN",7698,"1981-02-20",1600,300,30);
INSERT INTO EMP VALUES (7521,"WARD","SALESMAN",7698,"1981-02-22",1250,500,30);
INSERT INTO EMP VALUES (7566,"JONES","MANAGER",7839,"1981-04-02",2975,NULL,20);
INSERT INTO EMP VALUES (7654,"MARTIN","SALESMAN",7698,"1981-09-28",1250,1400,30);
INSERT INTO EMP VALUES (7698,"BLAKE","MANAGER",7839,"1981-05-01",2850,NULL,30);
INSERT INTO EMP VALUES (7782,"CLARK","MANAGER",7839,"1981-06-09",2450,NULL,10);
INSERT INTO EMP VALUES (7788,"SCOTT","ANALYST",7566,"1982-12-09",3000,NULL,20);
INSERT INTO EMP VALUES (7839,"KING","PRESIDENT",NULL,"1981-11-17",5000,NULL,10);
INSERT INTO EMP VALUES (7844,"TURNER","SALESMAN",7698,"1981-09-08",1500,0,30);
INSERT INTO EMP VALUES (7876,"ADAMS","CLERK",7788,"1983-1-12",1100,NULL,20);
INSERT INTO EMP VALUES (7900,"JAMES","CLERK",7698,"1981-12-03",950,NULL,30);
INSERT INTO EMP VALUES (7902,"FORD","ANALYST",7566,"1981-12-03",3000,NULL,20);
INSERT INTO EMP VALUES (7934,"MILLER","CLERK",7782,"1982-1-23",1300,NULL,10);

----------------------------------------------------------------------------------------
1. Obtener todos los datos de todos los empleados.
2. Obtener todos los datos de todos los departamentos.
3. Obtener todos los datos de los administrativos (su trabajo es, en inglés, ’CLERK’).
4. Ídem, pero ordenado por el nombre.
5. Obtén el mismo resultado de la pregunta anterior, pero modificando la sentencia SQL.
6. Obtén el número (código), nombre y salario de los empleados.
7. Lista los nombres de todos los departamentos.
8. Igual al anterior, pero ordenándolos por nombre.
9. Igual al anterior, pero ordenándolo por la ciudad (no se debe seleccionar la ciudad en el resultado).
10. Igual al anterior, pero el resultado debe mostrarse ordenado por la ciudad en orden inverso.
11. Obtener el nombre y empleo de todos los empleados, ordenado por salario.
12. Obtener el nombre y empleo de todos los empleados, ordenado primero por su trabajo y luego por su
salario.
13. Igual al anterior, pero ordenando inversamente por empleo y normalmente por salario.
14. Obtén los salarios y las comisiones de los empleados del departamento 30.
15. Igual al anterior, pero ordenado por comisión.
16. (a) Obtén las comisiones de todos los empleados. (b) Obtén las comisiones de los empleados de forma que
no se repitan.
17. Obtén el nombre de empleado y su comisión SIN FILAS repetidas.
18. Obtén los nombres de los empleados y sus salarios, de forma que no se repitan filas.
19. Obtén las comisiones de los empleados y sus números de departamento, de forma que no se repitan filas.
20. Obtén los nuevos salarios de los empleados del departamento 30, que resultarían de sumar a su salario una
gratificación de 1000. Muestra también los nombres de los empleados.
21. Lo mismo que la anterior, pero mostrando también su salario original, y haz que la columna que almacena
el nuevo salario se denomine NUEVO SALARIO.
22. Halla los empleados que tienen una comisión superior a la mitad de su salario.
23. Halla los empleados que no tienen comisión, o que la tengan menor o igual que el 25% de su salario.
24. Obtén una lista de nombres de empleados y sus salarios, de forma que en la salida aparezca en todas las
filas “Nombre:” y “Salario:” antes del respectivo campo. Hazlo de forma que selecciones exactamente tres
expresiones.
25. Hallar el código, salario y comisión de los empleados cuyo código sea mayor que 7500.
26. Obtén todos los datos de los empleados que estén (considerando una ordenación ASCII por nombre) a partir
de la J, inclusive.
27. Obtén el salario, comisión y salario total (salario+comision) de los empleados con comisión, ordenando el
resultado por número de empleado.
28. Lista la misma información, pero para todos los empleados.
29. Muestra el nombre de los empleados que, teniendo un salario superior a 1000, tengan como jefe al
empleado cuyo código es 7698.
30. Halla el conjunto complementario del resultado del ejercicio anterior.
31. Indica para cada empleado el porcentaje que supone su comisión sobre su salario, ordenando el resultado
por el nombre del mismo.
32. Hallar los empleados del departamento 10 cuyo nombre no contiene la cadena LA.
33. Obtén los empleados que no son supervisados por ningún otro.
34. Obtén los nombres de los departamentos que no sean Ventas (SALES) ni investigación (RESEARCH). Ordena el
resultado por la localidad del departamento.
35. Deseamos conocer el nombre de los empleados y el código del departamento de los administrativos(CLERK)
que no trabajan en el departamento 10, y cuyo salario es superior a 800, ordenado por fecha de
contratación.
36. Para los empleados que tengan comisión, obtén sus nombres y el cociente entre su salario y su comisión
(excepto cuando la comisión sea cero), ordenando el resultado por nombre.
37. Lista toda la información sobre los empleados cuyo nombre completo tenga exactamente 5 caracteres.
38. Lo mismo, pero para los empleados cuyo nombre tenga al menos cinco letras.
39. Halla los datos de los empleados que, o bien su nombre empieza por A y su salario es superior a 1000, o
bien reciben comisión y trabajan en el departamento 30.
40. Halla el nombre, el salario y el sueldo total (salario+comision) de todos los empleados, ordenando el
resultado primero por salario y luego por el sueldo total.
41. Obtén el nombre, salario y la comisión de los empleados que perciben un salario que está entre la mitad de
la comisión y la propia comisión.
42. Obtén el complementario del anterior.
43. Lista los nombres y empleos de aquellos empleados cuyo empleo acaba en MAN y cuyo nombre empieza por
A.
44. Intenta resolver la pregunta anterior con un predicado simple, es decir, de forma que en la cláusula
WHERE no haya conectores lógicos como AND, OR, etc.
45. Halla los nombres de los empleados cuyo nombre tiene como máximo cinco caracteres.
46. Suponiendo que el año próximo la subida del sueldo total de cada empleado será del 6%, y el siguiente del 7
%, halla los nombres y el salario total actual, del año próximo y del siguiente, de cada empleado.
47. Lista los nombres y fecha de contratación de aquellos empleados que no son vendedores (SALESMAN).
48. Obtén la información disponible de los empleados cuyo número es uno de los siguientes: 7844, 7900, 7521,
7521, 7782, 7934, 7678 y 7369, pero que no sea uno de los siguientes: 7902, 7839, 7499 ni 7878. La sentencia
no debe complicarse innecesariamente, y debe dar el resultado correcto independientemente de lo
empleados almacenados en la base de datos.
49. Ordena los empleados por su código de departamento, y luego de manera descendente por su número de
empleado.
50. Para los empleados que tengan como jefe a un empleado con código mayor que el suyo, obtén los que
reciben de salario más de 1000 y menos de 2000, o que están en el departamento 30.
51. Obtén el salario más alto de la empresa, el total destinado a comisiones y el número de empleados.
52. Halla los datos de los empleados cuyo salario es mayor que el del empleado de código 7934, ordenando
por el salario.
53. Obtén información en la que se reflejen los nombres, empleos y salarios tanto de los empleados que
superan en salario a Allen como del propio Allen.
54. Halla el nombre el último empleado por orden alfabético.
55. Halla el salario más alto, el más bajo, y la diferencia entre ellos.
56. Sin conocer los resultados del ejercicio anterior, ¿quienes reciben el salario más alto y el más bajo, y a
cuánto ascienden estos salarios?
57. Considerando empleados con salario menor de 5000, halla la media de los salarios de los departamentos
cuyo salario mínimo supera a 900. Muestra también el código y el nombre de los departamentos.
58. ¿Que empleados trabajan en ciudades de más de cinco letras? Ordena el resultado inversamente por
ciudades y normalmente por los nombres de los empleados.
59. Halla los empleados cuyo salario supera o coincide con la media del salario de la empresa.
60. Obtén los empleados cuyo salario supera al de sus compañeros de departamento.
61. ¿Cuántos empleos diferentes, cuántos empleados, y cuantos salarios diferentes encontramos en el
departamento 30, y a cuánto asciende la suma de salarios de dicho departamento?
62. ¿Cuántos empleados tienen comisión?
63. ¿Cuántos empleados tiene el departamento 20?
64. Halla los departamentos que tienen más de tres empleados, y el número de empleados de los mismos.
65. Obtén los empleados del departamento 10 que tienen el mismo empleo que alguien del departamento de
Ventas. Desconocemos el código de dicho departamento.
66. Halla los empleados que tienen por lo menos un empleado a su mando, ordenados inversamente por 
nombre.
67. Obtén información sobre los empleados que tienen el mismo trabajo que algún empleado que trabaje en
Chicago.
68. ¿Qué empleos distintos encontramos en la empresa, y cuántos empleados desempeñan cada uno de ellos?
69. Halla la suma de salarios de cada departamento.
70. Obtén todos los departamentos sin empleados.
71. Halla los empleados que no tienen a otro empleado a sus ´ordenes.
72. ¿Cuántos empleados hay en cada departamento, y cuál es la media anual del salario de cada uno (el salario
almacenado es mensual)? Indique el nombre del departamento para clarificar el resultado.
73. Halla los empleados del departamento 30, por orden descendente de comisión
74. Obtén los empleados que trabajan en Dallas o New York.