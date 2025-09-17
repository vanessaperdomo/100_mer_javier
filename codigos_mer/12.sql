CREATE DATABASE Aplicación de Mensajería;
USE Aplicación de Mensajería;

CREATE TABLE usuario_msg (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120)
);
CREATE TABLE conversacion (
  id_conversacion INT AUTO_INCREMENT PRIMARY KEY,
  creada_en DATETIME NOT NULL
);
CREATE TABLE conversacion_participante (
  id_conversacion INT NOT NULL,
  id_usuario INT NOT NULL,
  PRIMARY KEY (id_conversacion, id_usuario),
  FOREIGN KEY (id_conversacion) REFERENCES conversacion(id_conversacion),
  FOREIGN KEY (id_usuario) REFERENCES usuario_msg(id_usuario)
);
CREATE TABLE mensaje (
  id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
  id_conversacion INT NOT NULL,
  id_usuario INT NOT NULL,
  texto VARCHAR(1000),
  enviado_en DATETIME NOT NULL,
  FOREIGN KEY (id_conversacion) REFERENCES conversacion(id_conversacion),
  FOREIGN KEY (id_usuario) REFERENCES usuario_msg(id_usuario)
);
CREATE TABLE adjunto (
  id_adjunto INT AUTO_INCREMENT PRIMARY KEY,
  id_mensaje INT NOT NULL,
  url VARCHAR(255) NOT NULL,
  tipo VARCHAR(60),
  FOREIGN KEY (id_mensaje) REFERENCES mensaje(id_mensaje)
);
