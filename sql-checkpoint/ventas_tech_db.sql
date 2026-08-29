?/* Crear Base de Datos Ventas_Tech_DB  */

CREATE DATABASE Ventas_Tech_DB;

-- Poner en uso la base de datos --
USE Ventas_Tech_DB;


/*Creá las cuatro tablas en este orden con los tipos de datos indicados*/

CREATE TABLE Categorias (
    Id_Categoria INT PRIMARY KEY,
    Nombre_Categoria VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(200) 
);


CREATE TABLE Clientes (
    Id_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE, 
    Ciudad  VARCHAR(50),	
    fecha_registro DATE NOT NULL
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo TINYINT DEFAULT 1,
    FOREIGN KEY (Id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

/*INSERT DATA Cargá los siguientes datos en el orden correcto (primero las tablas sin dependencias):
categorias — 4 registros: sql */

INSERT INTO categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');INSERT INTO categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');INSERT INTO categorias VALUES (3, 'Audio', 'Auriculares y parlantes');INSERT INTO categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');

INSERT INTO clientes VALUES (1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');INSERT INTO clientes VALUES (2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');INSERT INTO clientes VALUES (3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');INSERT INTO clientes VALUES (4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');INSERT INTO clientes VALUES (5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

INSERT INTO productos VALUES (1, 'Laptop Pro 15',       1, 1200.00, 15, 1);INSERT INTO productos VALUES (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1);INSERT INTO productos VALUES (3, 'Monitor 4K 27"',      1,  450.00, 12, 1);INSERT INTO productos VALUES (4, 'Auriculares BT Pro',  3,  120.00, 35, 1);INSERT INTO productos VALUES (5, 'SSD Externo 1TB',     4,  130.00, 18, 1);INSERT INTO productos VALUES (6, 'Teclado Mecánico',    2,   95.00, 40, 1);

INSERT INTO ventas VALUES (1,  1, 1, 2, 1200.00, '2024-03-05');INSERT INTO ventas VALUES (2,  2, 2, 5,   28.00, '2024-03-06');INSERT INTO ventas VALUES (3,  3, 3, 1,  450.00, '2024-03-07');INSERT INTO ventas VALUES (4,  1, 4, 2,  120.00, '2024-03-08');INSERT INTO ventas VALUES (5,  4, 5, 3,  130.00, '2024-03-10');INSERT INTO ventas VALUES (6,  2, 6, 4,   95.00, '2024-03-11');INSERT INTO ventas VALUES (7,  5, 1, 1, 1200.00, '2024-03-12');INSERT INTO ventas VALUES (8,  3, 2, 8,   28.00, '2024-03-13');INSERT INTO ventas VALUES (9,  4, 4, 1,  120.00, '2024-03-14');INSERT INTO ventas VALUES (10, 5, 3, 2,  450.00, '2024-03-15');

/*Paso 3: Verificá la integridad Ejecutá el script completo y confirmá que no hay errores. Luego ejecutá estas consultas de validación */

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;