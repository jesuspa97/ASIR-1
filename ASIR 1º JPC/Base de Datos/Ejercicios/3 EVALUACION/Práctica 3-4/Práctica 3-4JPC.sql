---------TIENDA.SQL---------

---1. Inserta un nuevo fabricante indicando su código y su nombre.

---2. Inserta un nuevo fabricante indicando solamente su nombre.

---3. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe incluir: código, nombre, precio y código_fabricante.

---4. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe incluir: nombre, precio y código_fabricante.

---5. Crea una nueva tabla con el nombre fabricante_productos que tenga las siguientes columnas: nombre_fabricante, nombre_producto y precio. Una vez creada la tabla inserta todos los registros de la base de datos tienda en esta tabla haciendo uso de única operación de inserción.

---6. Crea una vista con el nombre vista_fabricante_productosque tenga las siguientes columnas: nombre_fabricante, nombre_producto y precio.

---7. Elimina el fabricante Asus. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?

---8. Elimina el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?

---9. Actualiza el código del fabricante Lenovo y asígnale el valor 20. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?

---10. Actualiza el código del fabricante Huawei y asígnale el valor 30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?

---11. Actualiza el precio de todos los productos sumándole 5 € al precio actual.

---12. Elimina todas las impresoras que tienen un precio menor de 200 €.



---------EMPLEADOS.SQL---------

---1. Inserta un nuevo departamento indicando su código, nombre y presupuesto.

---2. Inserta un nuevo departamento indicando su nombre y presupuesto.

---3. Inserta un nuevo departamento indicando su código, nombre, presupuesto y gastos.

---4. Inserta un nuevo empleado asociado a uno de los nuevos departamentos. La sentencia de inserción debe incluir: código, nif, nombre, apellido1, apellido2 y codigo_departamento

---5. Inserta un nuevo empleado asociado a uno de los nuevos departamentos. La sentencia de inserción debe incluir: nif, nombre, apellido1, apellido2 y codigo_departamento.

---6. Elimina el departamento Proyectos. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
---7. Elimina el departamento Desarrollo. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?

---8. Actualiza el código del departamento Recursos Humanos y asígnale el valor 30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?

---9. Actualiza el código del departamento Publicidad y asígnale el valor 40. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?

---10. Actualiza el presupuesto de los departamentos sumándole 50000 € al valor del presupuesto actual, solamente a aquellos departamentos que tienen un presupuesto menor que 20000 €.

---11. Realiza una transacción que elimine todas los empleados que no tienen un departamento asociado.

---12. Realiza el comando que permite volver atrás la sentencia anterior



---------EMPRESA_PYME.SQL---------

---1. Inserta una nueva oficina en Almería.

---2. Inserta un empleado para la oficina de Almería que sea representante de ventas.

---3. Inserta un cliente que tenga como representante de ventas el empleado que hemos creado en el paso anterior.

---4. Inserte un pedido para el cliente que acabamos de crear, que contenga al menos dos productos.

---5. Actualiza el código del cliente que hemos creado en el paso anterior y averigua si hubo cambios en las tablas relacionadas. Usando transacciones.

---6. Borra el cliente y averigua si hubo cambios en las tablas relacionadas.

---7. Elimina los clientes que no hayan realizado ningún pedido

---8. Incrementa en un 20% el precio de los productos que no tengan pedidos.

---9. Borra los pagos del cliente con menor límite de crédito. Usando transacciones.

---10. Elimina la acción anterior. ¿Es posible?

---11. Establece a 0 el límite de crédito del cliente que menos unidades pedidas tenga del producto OR-179.

---12. Modifica la tabla detalle_pedido para insertar un campo numérico llamado iva. Mediante una transacción, establece el valor de ese campo a 18 para aquellos registros cuyo pedido tenga fecha a partir de Enero de 2009. A continuación actualiza el resto de pedidos estableciendo el iva al 21.

---13. Modifica la tabla detalle_pedido para incorporar un campo numérico llamado total_linea y actualiza todos sus registros para calcular su valor con la fórmula: total_linea = precio_unidad*cantidad * (1 + (iva/100));

---14. Borra el cliente que menor límite de crédito tenga. ¿Es posible borrarlo solo con una consulta? ¿Por qué?

---15. Inserta tres clientes que tengan como representantes de ventas los empleados que hemos creado en el paso anterior. Usando transacciones.

---16. Realiza una transacción que inserte un pedido para cada uno de los clientes. Cada pedido debe incluir dos productos

