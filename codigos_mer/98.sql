CREATE DATABASE Aplicacion_Respaldo_Datos;
USE Aplicacion_Respaldo_Datos;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) UNIQUE
);

CREATE TABLE dispositivo (
  id_dispositivo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  tipo VARCHAR(50)
);

CREATE TABLE respaldo (
  id_respaldo INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_dispositivo INT NOT NULL,
  fecha DATETIME NOT NULL,
  estado VARCHAR(50),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_dispositivo) REFERENCES dispositivo(id_dispositivo)
);

CREATE TABLE archivo (
  id_archivo INT AUTO_INCREMENT PRIMARY KEY,
  id_respaldo INT NOT NULL,
  nombre VARCHAR(255) NOT NULL,
  tamaño_mb DECIMAL(10,2),
  FOREIGN KEY (id_respaldo) REFERENCES respaldo(id_respaldo)
);
