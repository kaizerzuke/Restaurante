#Creación de la base de datos
CREATE DATABASE RestauranteETITC;
USE RestauranteETITC;

#Tabla de usuarios
CREATE TABLE empleados (
    cedula INT PRIMARY KEY,
    nombre_completo VARCHAR(40) NOT NULL,
    correo_electronico VARCHAR(40) UNIQUE NOT NULL,
    usuario VARCHAR(40) UNIQUE NOT NULL,
    contrasena VARCHAR(40) NOT NULL,
    activo BOOLEAN DEFAULT TRUE
);

#Insertar el usuario inicial
INSERT INTO empleados (cedula, nombre_completo, correo_electronico, usuario, contrasena, activo)
VALUES (123456789, 'Pepito Perez', 'Pepito@restauranteetitc.com', 'admininicial', 'admin123456', TRUE);

#Tabla de clientes
CREATE TABLE clientes (
    cedula INT PRIMARY KEY,
    nombre_completo VARCHAR(40) NOT NULL,
    direccion VARCHAR(40),
    telefono VARCHAR(40),
    correo_electronico VARCHAR(40) UNIQUE
);

#Tabla de proveedores
CREATE TABLE proveedores (
    nit INT PRIMARY KEY,
    nombre_proveedor VARCHAR(40) NOT NULL,
    direccion VARCHAR(40),
    telefono VARCHAR(40),
    ciudad VARCHAR(40)
);

#Tabla de productos
CREATE TABLE productos (
    codigo_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(40) NOT NULL,
    nit_proveedor INT,
    precio_compra DOUBLE NOT NULL,
    precio_venta DOUBLE NOT NULL,
    FOREIGN KEY (nit_proveedor) REFERENCES proveedores(nit),
    unidades_disponibles INT,
    Max_unidades INT
);

#Tabla de ventas
CREATE TABLE ventas (
    codigo_venta INT PRIMARY KEY AUTO_INCREMENT,
    cedula_cliente INT NOT NULL,
    cedula_usuario INT NOT NULL,
    subtotal_venta DOUBLE NOT NULL,
    valor_iva DOUBLE NOT NULL,
    valor_total_con_iva DOUBLE NOT NULL,
    FOREIGN KEY (cedula_cliente) REFERENCES clientes(cedula),
    FOREIGN KEY (cedula_usuario) REFERENCES empleados(cedula)
);

#Tabla de detalle de ventas
CREATE TABLE detalle_ventas (
    codigo_detalle INT PRIMARY KEY AUTO_INCREMENT,
    codigo_venta INT NOT NULL,
    codigo_producto INT NOT NULL,
    cantidad INT NOT NULL,
    valor_unitario DOUBLE NOT NULL,
    valor_total DOUBLE NOT NULL,
    FOREIGN KEY (codigo_venta) REFERENCES ventas(codigo_venta),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
);