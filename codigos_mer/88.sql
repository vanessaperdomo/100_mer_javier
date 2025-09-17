CREATE DATABASE aplicacion_recordatorios;
USE aplicacion_recordatorios;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) UNIQUE
);

CREATE TABLE categoria (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE recordatorio (
  id_recordatorio INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_categoria INT,
  titulo VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255),
  fecha_hora DATETIME NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE notificacion (
  id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
  id_recordatorio INT NOT NULL,
  enviada BOOLEAN DEFAULT 0,
  fecha_envio DATETIME,
  FOREIGN KEY (id_recordatorio) REFERENCES recordatorio(id_recordatorio)
);
