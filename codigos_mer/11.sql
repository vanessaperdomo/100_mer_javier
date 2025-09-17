CREATE DATABASE Redes Sociales;
USE Redes Sociales;

CREATE TABLE usuario_social (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120)
);
CREATE TABLE publicacion (
  id_publicacion INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  texto VARCHAR(500),
  creado_en DATETIME NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario_social(id_usuario)
);
CREATE TABLE comentario (
  id_comentario INT AUTO_INCREMENT PRIMARY KEY,
  id_publicacion INT NOT NULL,
  id_usuario INT NOT NULL,
  texto VARCHAR(400) NOT NULL,
  creado_en DATETIME NOT NULL,
  FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion),
  FOREIGN KEY (id_usuario) REFERENCES usuario_social(id_usuario)
);
CREATE TABLE reaccion_tipo (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL
);
CREATE TABLE reaccion (
  id_usuario INT NOT NULL,
  id_publicacion INT NOT NULL,
  id_tipo INT NOT NULL,
  creado_en DATETIME NOT NULL,
  PRIMARY KEY (id_usuario, id_publicacion),
  FOREIGN KEY (id_usuario) REFERENCES usuario_social(id_usuario),
  FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion),
  FOREIGN KEY (id_tipo) REFERENCES reaccion_tipo(id_tipo)
);
CREATE TABLE seguimiento (
  id_seguidor INT NOT NULL,
  id_seguido INT NOT NULL,
  PRIMARY KEY (id_seguidor, id_seguido),
  FOREIGN KEY (id_seguidor) REFERENCES usuario_social(id_usuario),
  FOREIGN KEY (id_seguido) REFERENCES usuario_social(id_usuario)
);
