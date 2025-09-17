CREATE DATABASE Plataforma de Streaming;
USE Plataforma de Streaming;

CREATE TABLE usuario_stream (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120)
);
CREATE TABLE plan_stream (
  id_plan INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  precio_mensual DECIMAL(12,2) NOT NULL
);
CREATE TABLE suscripcion (
  id_suscripcion INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_plan INT NOT NULL,
  inicio DATE NOT NULL,
  fin DATE,
  FOREIGN KEY (id_usuario) REFERENCES usuario_stream(id_usuario),
  FOREIGN KEY (id_plan) REFERENCES plan_stream(id_plan)
);
CREATE TABLE tipo_contenido (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);
CREATE TABLE contenido (
  id_contenido INT AUTO_INCREMENT PRIMARY KEY,
  id_tipo INT NOT NULL,
  titulo VARCHAR(200) NOT NULL,
  duracion_min INT,
  FOREIGN KEY (id_tipo) REFERENCES tipo_contenido(id_tipo)
);
CREATE TABLE visualizacion (
  id_visualizacion INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_contenido INT NOT NULL,
  visto_en DATETIME NOT NULL,
  progreso_min INT,
  FOREIGN KEY (id_usuario) REFERENCES usuario_stream(id_usuario),
  FOREIGN KEY (id_contenido) REFERENCES contenido(id_contenido)
);
CREATE TABLE calificacion (
  id_usuario INT NOT NULL,
  id_contenido INT NOT NULL,
  puntuacion TINYINT NOT NULL,
  comentario VARCHAR(255),
  PRIMARY KEY (id_usuario, id_contenido),
  FOREIGN KEY (id_usuario) REFERENCES usuario_stream(id_usuario),
  FOREIGN KEY (id_contenido) REFERENCES contenido(id_contenido)
);
