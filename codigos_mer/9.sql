CREATE DATABASE Sistema de Alquileres;
USE Sistema de Alquileres;

CREATE TABLE tipo_item (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);
CREATE TABLE item_alquiler (
  id_item INT AUTO_INCREMENT PRIMARY KEY,
  id_tipo INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255),
  FOREIGN KEY (id_tipo) REFERENCES tipo_item(id_tipo)
);
CREATE TABLE cliente_alquiler (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  documento VARCHAR(30) UNIQUE,
  telefono VARCHAR(40),
  email VARCHAR(120)
);
CREATE TABLE alquiler (
  id_alquiler INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  fecha_inicio DATETIME NOT NULL,
  fecha_fin DATETIME NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente_alquiler(id_cliente)
);
CREATE TABLE alquiler_item (
  id_alquiler INT NOT NULL,
  id_item INT NOT NULL,
  tarifa_diaria DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (id_alquiler, id_item),
  FOREIGN KEY (id_alquiler) REFERENCES alquiler(id_alquiler),
  FOREIGN KEY (id_item) REFERENCES item_alquiler(id_item)
);
