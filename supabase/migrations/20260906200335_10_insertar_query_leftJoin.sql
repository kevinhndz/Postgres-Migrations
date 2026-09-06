-- 1. Contar cuantos clientes hay por cada sucursal
SELECT s.Nombre AS Sucursal, COUNT(c.id_cliente) AS Total_Clientes
FROM Sucursales s
LEFT JOIN Clientes c ON s.id_sucursal = c.id_sucursal
GROUP BY s.id_sucursal, s.Nombre;