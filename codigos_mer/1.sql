CREATE DATABASE GestionInventarios;
USE GestionInventarios;
CREATE TABLE categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(255)
);
CREATE TABLE producto (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  id_categoria INT NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  sku VARCHAR(50) UNIQUE,
  unidad_medida VARCHAR(30) NOT NULL,
  descripcion VARCHAR(255),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
CREATE TABLE proveedor (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  nit VARCHAR(30),
  correo VARCHAR(120),
  telefono VARCHAR(40)
);
CREATE TABLE producto_proveedor (
  id_producto INT NOT NULL,
  id_proveedor INT NOT NULL,
  precio_compra DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (id_producto, id_proveedor),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);
CREATE TABLE bodega (
  id_bodega INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ubicacion VARCHAR(150)
);
CREATE TABLE inventario_movimiento (
  id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
  id_bodega INT NOT NULL,
  id_producto INT NOT NULL,
  tipo ENUM('ENTRADA','SALIDA','AJUSTE') NOT NULL,
  cantidad DECIMAL(12,3) NOT NULL,
  motivo VARCHAR(150),
  fecha DATETIME NOT NULL,
  FOREIGN KEY (id_bodega) REFERENCES bodega(id_bodega),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

