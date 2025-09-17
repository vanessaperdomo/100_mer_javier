CREATE DATABASE investigacion_mercado;
USE investigacion_mercado;

CREATE TABLE investigador (
  id_investigador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) UNIQUE
);

CREATE TABLE estudio (
  id_estudio INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  descripcion VARCHAR(255),
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE
);

CREATE TABLE encuesta (
  id_encuesta INT AUTO_INCREMENT PRIMARY KEY,
  id_estudio INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  tipo VARCHAR(50),
  FOREIGN KEY (id_estudio) REFERENCES estudio(id_estudio)
);

CREATE TABLE participante (
  id_participante INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  edad INT,
  genero VARCHAR(20)
);

CREATE TABLE respuesta (
  id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
  id_encuesta INT NOT NULL,
  id_participante INT NOT NULL,
  respuesta_texto TEXT,
  fecha DATETIME NOT NULL,
  FOREIGN KEY (id_encuesta) REFERENCES encuesta(id_encuesta),
  FOREIGN KEY (id_participante) REFERENCES participante(id_participante)
);
