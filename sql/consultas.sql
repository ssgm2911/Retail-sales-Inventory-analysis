-- Ventas totales por producto
SELECT producto, SUM(cantidad) AS total_vendido
FROM ventas
GROUP BY producto
ORDER BY total_vendido DESC;

-- Productos con riesgo de quiebre de stock
SELECT v.producto, SUM(v.cantidad) AS ventas, i.stock_actual
FROM ventas v
JOIN inventario i ON v.producto = i.producto
GROUP BY v.producto, i.stock_actual
HAVING i.stock_actual < SUM(v.cantidad);

-- Ventas mensuales
SELECT 
    strftime('%Y-%m', fecha) AS mes,
    SUM(cantidad * precio) AS ventas_totales
FROM ventas
GROUP BY mes;
