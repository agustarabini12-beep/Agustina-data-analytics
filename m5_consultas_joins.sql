/*Consulta 1 — Vista base del proyecto (INNER JOIN)*/

SELECT
    v.fecha_venta AS fecha,
    c.id_cliente,
    c.nombre AS cliente,
    p.nombre_producto AS producto,
    cat.nombre_categoria AS categoria,
    c.ciudad,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM Ventas v
INNER JOIN Clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN Productos p
    ON v.id_producto = p.id_producto
INNER JOIN Categorias cat
    ON p.id_categoria = cat.id_categoria;

/*Inserto cliente que no compra*/

    INSERT INTO Clientes
VALUES (6, 'Sofía Fernández', 'sofia@mail.com', 'La Plata', '2024-03-20');

 /*Consulta 2 — Clientes sin ventas (LEFT JOIN)*/

    SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM Clientes c
LEFT JOIN Ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

/*Inserto producto*/

INSERT INTO Productos
VALUES (7, 'Webcam Full HD', 2, 75.00, 25, 1);

/*Consulta 3 — Productos sin ventas (LEFT JOIN) */

SELECT
    p.nombre_producto AS producto,
    c.nombre_categoria AS categoria,
    p.precio
FROM Productos p
LEFT JOIN Ventas v
    ON p.id_producto = v.id_producto
INNER JOIN Categorias c
    ON p.id_categoria = c.id_categoria
WHERE v.id_venta IS NULL;

/*Consulta 4 — Consolidado por canal (UNION ALL)*/

SELECT
    canal,
    SUM(total) AS total_ventas
FROM
(
    SELECT
        v.fecha_venta AS fecha,
        v.cantidad * v.precio_unitario AS total,
        'Online' AS canal
    FROM Ventas v
    WHERE v.fecha_venta BETWEEN '2024-03-01' AND '2024-03-10'

    UNION ALL

    SELECT
        v.fecha_venta AS fecha,
        v.cantidad * v.precio_unitario AS total,
        'Presencial' AS canal
    FROM Ventas v
    WHERE v.fecha_venta BETWEEN '2024-03-11' AND '2024-03-31'
) AS ventas_consolidadas
GROUP BY canal;

