CREATE DATABASE gestion_citas;
USE gestion_citas;

CREATE TABLE tipo_usuario (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  id_tipo INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120),
  telefono VARCHAR(40),
  FOREIGN KEY (id_tipo) REFERENCES tipo_usuario(id_tipo)
);

CREATE TABLE servicio (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(255)
);

CREATE TABLE estado_cita (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE cita (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_profesional INT NOT NULL,
  id_servicio INT NOT NULL,
  id_estado INT NOT NULL,
  fecha DATETIME NOT NULL,
  observaciones VARCHAR(255),
  FOREIGN KEY (id_cliente) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_profesional) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio),
  FOREIGN KEY (id_estado) REFERENCES estado_cita(id_estado)
);
