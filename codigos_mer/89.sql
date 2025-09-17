CREATE DATABASE plataforma_servicios_profesionales;
USE plataforma_servicios_profesionales;

CREATE TABLE profesional (
  id_profesional INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) UNIQUE
);

CREATE TABLE servicio (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY,
  id_profesional INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255),
  precio DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_profesional) REFERENCES profesional(id_profesional)
);

CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) UNIQUE
);

CREATE TABLE solicitud (
  id_solicitud INT AUTO_INCREMENT PRIMARY KEY,
  id_servicio INT NOT NULL,
  id_cliente INT NOT NULL,
  fecha DATETIME NOT NULL,
  estado VARCHAR(50) NOT NULL,
  FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
