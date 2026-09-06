-- 2. Ver los detalles de los clientes junto con su entrenador y membresia
SELECT c.Nombre AS Cliente, e.Nombre AS Entrenador, m.Tipo_membresia, m.PagoMensual
FROM Clientes c
JOIN Entrenadores e ON c.id_entrenador = e.id_entrenador
JOIN Membresias m ON c.id_membresia = m.id_membresia;

-- 3. Listar las actividades en las que participa un cliente especifico
SELECT c.Nombre AS Cliente, a.TipoActividad
FROM Clientes c
JOIN Cliente_Actividad ca ON c.id_cliente = ca.id_cliente
JOIN Actividades a ON ca.id_actividad = a.id_actividad
WHERE c.id_cliente = 1;

-- 4. Mostrar el total de empleados y la suma de sus salarios por sucursal
SELECT s.Nombre AS Sucursal, COUNT(emp.id_empleado) AS Cantidad_Empleados, SUM(emp.Salario) AS Gasto_Salarios
FROM Sucursales s
LEFT JOIN Empleados emp ON s.id_sucursal = emp.id_sucursal
GROUP BY s.id_sucursal, s.Nombre;

-- 5. Listar los productos cuyo stock sea menor a 50 unidades
SELECT Nombre, Stock, Precio
FROM Productos
WHERE Stock < 50;