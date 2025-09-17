CREATE DATABASE gestion_impuestos;
USE gestion_impuestos;

CREATE TABLE clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  nit VARCHAR(30),
  email VARCHAR(120)
);

CREATE TABLE productos (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  precio DECIMAL(12,2) NOT NULL
);

CREATE TABLE estados_factura (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);

CREATE TABLE facturas (
  id_factura INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_estado INT NOT NULL,
  fecha DATETIME NOT NULL,
  total DECIMAL(14,2) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_estado) REFERENCES estados_factura(id_estado)
);

CREATE TABLE factura_items (
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unit DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (id_factura, id_producto),
  FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
