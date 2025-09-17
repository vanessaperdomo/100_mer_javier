CREATE DATABASE Carrito de Compras;
USE Carrito de Compras;

CREATE TABLE cliente_carrito (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) NOT NULL UNIQUE,
  nombre VARCHAR(120)
);
CREATE TABLE producto_carrito (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  precio DECIMAL(12,2) NOT NULL
);
CREATE TABLE carrito (
  id_carrito INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  creado_en DATETIME NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente_carrito(id_cliente)
);
CREATE TABLE carrito_item (
  id_carrito INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (id_carrito, id_producto),
  FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito),
  FOREIGN KEY (id_producto) REFERENCES producto_carrito(id_producto)
);


