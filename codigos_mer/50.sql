CREATE DATABASE Bienestar Mental;
USE Bienestar Mental;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) NOT NULL UNIQUE,
  nombre VARCHAR(120) NOT NULL,
  fecha_nacimiento DATE
);

CREATE TABLE emocion (
  id_emocion INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);

CREATE TABLE estado_animo (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_emocion INT,
  registrado_en DATETIME NOT NULL,
  intensidad TINYINT,            -- 1..10
  nota VARCHAR(255),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_emocion) REFERENCES emocion(id_emocion)
);

CREATE TABLE programa (
  id_programa INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255),
  duracion_dias INT
);

CREATE TABLE usuario_programa (
  id_usuario INT NOT NULL,
  id_programa INT NOT NULL,
  inicio DATE NOT NULL,
  estado VARCHAR(40) NOT NULL,    -- Activo/Pausado/Finalizado
  PRIMARY KEY (id_usuario, id_programa),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_programa) REFERENCES programa(id_programa)
);
