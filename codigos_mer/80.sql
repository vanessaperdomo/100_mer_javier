CREATE DATABASE SistemaRevisionProductos;
USE SistemaRevisionProductos;

CREATE TABLE producto (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255)
);

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120)
);

CREATE TABLE estado (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);

CREATE TABLE revision (
  id_revision INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  id_usuario INT NOT NULL,
  id_estado INT NOT NULL,
  fecha DATETIME NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

CREATE TABLE detalle_revision (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  id_revision INT NOT NULL,
  calificacion INT NOT NULL,
  comentario VARCHAR(255),
  FOREIGN KEY (id_revision) REFERENCES revision(id_revision)
);
