CREATE DATABASE Gestión de Finanzas Personales;
USE Gestión de Finanzas Personales;

CREATE TABLE cliente_gesti_n_de_finanzas_personales (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  nit VARCHAR(30),
  email VARCHAR(120)
);
CREATE TABLE producto_gesti_n_de_finanzas_personales (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  precio DECIMAL(12,2) NOT NULL
);
CREATE TABLE factura_gesti_n_de_finanzas_personales (
  id_factura INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  fecha DATETIME NOT NULL,
  total DECIMAL(14,2) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente_gesti_n_de_finanzas_personales(id_cliente)
);
CREATE TABLE factura_item_gesti_n_de_finanzas_personales (
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unit DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (id_factura, id_producto),
  FOREIGN KEY (id_factura) REFERENCES factura_gesti_n_de_finanzas_personales(id_factura),
  FOREIGN KEY (id_producto) REFERENCES producto_gesti_n_de_finanzas_personales(id_producto)
);
