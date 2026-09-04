[m4_consultas_negocio.sql](https://github.com/user-attachments/files/31817837/m4_consultas_negocio.sql)
/*Consulta 1 — Resumen ejecutivo mensual */

SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

/*Consulta 2 — Ranking de productos */

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

/*Consulta 3 — Clientes recurrentes*/

SELECT 
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos DESC;

/*Consulta 4 — Meses por encima/por debajo del promedio*/
SELECT 
    mes,
    total_facturado,
    CASE 
        WHEN total_facturado > promedio_mensual THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM (
    SELECT 
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado,
        AVG(SUM(cantidad * precio_unitario)) OVER () AS promedio_mensual
    FROM ventas
    GROUP BY MONTH(fecha_venta)
) AS resumen_mensual
ORDER BY mes;


-- BLOQUE DE CIERRE: HALLAZGOS

-- Hallazgo 1:
-- El mes con mayor facturación fue el mes 3, con un total de $6444.

-- Hallazgo 2:
-- El producto 1 fue el producto con mayor facturación,
-- generando un total de $3600 y vendiendo 3 unidades.

-- Hallazgo 3:
-- El cliente 1 realizó 2 pedidos y tuvo un gasto total de $2640.
