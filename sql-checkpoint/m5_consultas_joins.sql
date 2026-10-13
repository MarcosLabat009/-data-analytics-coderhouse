-- DROP TABLES (Se elimina primero las tablas que tienen FK)

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS tipo_venta;
DROP TABLE IF EXISTS territorios;
DROP TABLE IF EXISTS vendedor;

-- CREATE TABLES (antes de crear la tabla ventas, crear las tablas de las cuales ventas va a tomar las FOREIGN KEY)

-- Tabla categorias
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

-- Tabla clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50),
    fecha_registro DATE NOT NULL
);

-- Tabla productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo BIT DEFAULT 1,

    FOREIGN KEY (id_categoria) 
        REFERENCES categorias(id_categoria)
);

-- Tablas agregadas
-- Tipo de venta
CREATE TABLE tipo_venta (
    id_tipo_venta INT PRIMARY KEY,
    forma_venta VARCHAR(100) NOT NULL
);

-- Territorio
CREATE TABLE territorios (
    id_region INT PRIMARY KEY,
    responsable VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    partido VARCHAR(100) NOT NULL
);

-- Vendedor
CREATE TABLE vendedor (
    id_vendedor INT PRIMARY KEY,
    nombre_vendedor VARCHAR(100) NOT NULL,
    legajo INT,
    id_region INT,

    FOREIGN KEY (id_region) 
        REFERENCES territorios(id_region)
);

-- Tabla ventas (hechos)
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    id_tipo_venta INT,
    id_region INT,
    id_vendedor INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL
    
    FOREIGN KEY (id_cliente)    REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto)   REFERENCES productos(id_producto),
    FOREIGN KEY (id_tipo_venta) REFERENCES tipo_venta(id_tipo_venta),
    FOREIGN KEY (id_region)     REFERENCES territorios(id_region),
    FOREIGN KEY (id_vendedor)   REFERENCES vendedor(id_vendedor)
);

-- INSERT DATA (25 registros obligatorios)

-- categorias
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
(1, 'Computación', 'Laptops, PCs y monitores'),
(2, 'Accesorios', 'Periféricos y complementos'),
(3, 'Audio', 'Auriculares y parlantes'),
(4, 'Almacenamiento', 'Discos y memorias');

-- clientes — 5 registros
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
(1, 'María López', 'maria@mail.com', 'Buenos Aires', '2024-01-05'),
(2, 'Carlos Ruiz', 'carlos@mail.com', 'Córdoba', '2024-01-10'),
(3, 'Ana Gómez', 'ana@mail.com', 'Rosario', '2024-02-01'),
(4, 'Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15'),
(5, 'Laura Torres', 'laura@mail.com', 'Tucumán', '2024-03-01');

-- productos — 6 registros
INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
(1, 'Laptop Pro 15', 1, 1200.00, 15, 1),
(2, 'Mouse Inalámbrico', 2, 28.00, 80, 1),
(3, 'Monitor 4K 27', 1, 450.00, 12, 1),
(4, 'Auriculares BT Pro', 3, 120.00, 35, 1),
(5, 'SSD Externo 1TB', 4, 130.00, 18, 1),
(6, 'Teclado Mecánico', 2, 95.00, 40, 1);

-- ventas — 10 registros
INSERT INTO ventas (id_venta, id_cliente, id_producto, id_tipo_venta, id_region, id_vendedor, cantidad, precio_unitario, fecha_venta) VALUES
(1, 1, 1, 2, 1, 1, 2, 1200.00, '2024-03-05'),
(2, 2, 2, 5, 2, 2, 5,   28.00, '2024-03-06'),
(3, 3, 3, 1, 3, 3, 1, 450.00, '2024-03-07'),
(4, 4, 4, 1, 4, 4, 1, 120.00, '2024-03-08'),
(5, 5, 5, 3, 5, 5, 3, 130.00, '2024-03-10'),
(6, 1, 4, 4, 2, 2, 4,  95.00, '2024-03-11'),
(7, 5, 1, 1, 1, 1, 1, 1200.00, '2024-03-12'),
(8, 3, 2, 2, 3, 3, 8,   28.00, '2024-03-13'),
(9, 4, 4, 1, 4, 4, 1, 120.00, '2024-03-14'),
(10, 5, 3, 2, 5, 5, 2, 450.00, '2024-03-15');

-- agregados 
-- tipo de venta
INSERT INTO tipo_venta (id_tipo_venta, forma_venta) VALUES
(1, 'En sucursal'),
(2, 'Página principal'),
(3, 'Mercado Libre'),
(4, 'Instagram Shop'),
(5, 'Venta telefónica');

-- territorios
INSERT INTO territorios (id_region, responsable, pais, provincia, partido) VALUES
(1, 'Mariana Duarte', 'Argentina', 'Buenos Aires', 'La Plata'),
(2, 'Sergio Benítez', 'Argentina', 'Buenos Aires', 'Morón'),
(3, 'Lucía Fernández', 'Argentina', 'Córdoba', 'Capital'),
(4, 'Hernán López', 'Argentina', 'Santa Fe', 'Rosario'),
(5, 'Paula Giménez', 'Argentina', 'Mendoza', 'Godoy Cruz');

-- vendedor
INSERT INTO vendedor (id_vendedor, nombre_vendedor, legajo, id_region) VALUES
(1, 'Sofía Martínez', 1001, 1),
(2, 'Diego Ramírez', 1002, 2),
(3, 'Carla Benítez', 1003, 3),
(4, 'Matías Herrera', 1004, 4),
(5, 'Juliana Torres', 1005, 5);

-- VALIDACIÓN
SELECT * FROM categorias;  -- esperado: 4 filas
SELECT * FROM clientes;    -- esperado: 5 filas
SELECT * FROM productos;   -- esperado: 6 filas
SELECT * FROM ventas;      -- esperado: 10 filas
SELECT * FROM tipo_venta;  -- esperado: 5 filas
SELECT * FROM territorios; -- esperado: 5 filas
SELECT * FROM vendedor;    -- esperado: 5 filas

-- Consulta 1
SELECT
    v.id_venta,
    v.fecha_venta,
    c.nombre AS nombre_cliente,
    c.email AS email_cliente,
    c.ciudad AS ciudad_cliente,
    p.nombre_producto,
    p.precio AS precio_producto,
    cat.nombre_categoria,
    tv.forma_venta,
    t.responsable AS responsable_region,
    t.pais,
    t.provincia,
    t.partido,
    vend.nombre_vendedor,
    vend.legajo,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta

FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
INNER JOIN tipo_venta tv
    ON v.id_tipo_venta = tv.id_tipo_venta
INNER JOIN territorios t
    ON v.id_region = t.id_region
INNER JOIN vendedor vend
    ON v.id_vendedor = vend.id_vendedor
ORDER BY v.fecha_venta;

-- Consulta 2
SELECT
    c.id_cliente,
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL
ORDER BY c.id_cliente;

-- Consulta 3
SELECT
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria,
    p.precio
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_producto IS NULL
ORDER BY p.id_producto;

-- Consulta 4
SELECT canal, SUM(total) AS total_canal
FROM (
    SELECT 
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Digital' AS canal
    FROM ventas
    WHERE id_tipo_venta IN (2, 3, 4)

    UNION ALL

    SELECT 
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Presencial' AS canal
    FROM ventas
    WHERE id_tipo_venta IN (1, 5)
) AS consolidado
GROUP BY canal;
