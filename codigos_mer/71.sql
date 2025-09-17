CREATE DATABASE Aplicacion_Videochat;
USE Aplicacion_Videochat;

CREATE TABLE usuario_videochat (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120)
);

CREATE TABLE sala_videochat (
  id_sala INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  creada_en DATETIME NOT NULL
);

CREATE TABLE mensaje_videochat (
  id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_sala INT NOT NULL,
  contenido TEXT NOT NULL,
  enviado_en DATETIME NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario_videochat(id_usuario),
  FOREIGN KEY (id_sala) REFERENCES sala_videochat(id_sala)
);

CREATE TABLE llamada_videochat (
  id_llamada INT AUTO_INCREMENT PRIMARY KEY,
  id_sala INT NOT NULL,
  inicio DATETIME NOT NULL,
  fin DATETIME,
  FOREIGN KEY (id_sala) REFERENCES sala_videochat(id_sala)
);

CREATE TABLE participante_sala (
  id_usuario INT NOT NULL,
  id_sala INT NOT NULL,
  PRIMARY KEY (id_usuario, id_sala),
  FOREIGN KEY (id_usuario) REFERENCES usuario_videochat(id_usuario),
  FOREIGN KEY (id_sala) REFERENCES sala_videochat(id_sala)
);

CREATE TABLE reaccion_mensaje (
  id_usuario INT NOT NULL,
  id_mensaje INT NOT NULL,
  tipo ENUM('like','love','risa','enojo') NOT NULL,
  PRIMARY KEY (id_usuario, id_mensaje),
  FOREIGN KEY (id_usuario) REFERENCES usuario_videochat(id_usuario),
  FOREIGN KEY (id_mensaje) REFERENCES mensaje_videochat(id_mensaje)
);
