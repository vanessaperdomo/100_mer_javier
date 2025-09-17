CREATE DATABASE Plataforma de Votación;
USE Plataforma de Votación;

CREATE TABLE encuesta_plataforma_de_votaci_n (
  id_encuesta INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255)
);
CREATE TABLE pregunta_plataforma_de_votaci_n (
  id_pregunta INT AUTO_INCREMENT PRIMARY KEY,
  id_encuesta INT NOT NULL,
  texto VARCHAR(255) NOT NULL,
  tipo VARCHAR(40) NOT NULL,
  FOREIGN KEY (id_encuesta) REFERENCES encuesta_plataforma_de_votaci_n(id_encuesta)
);
CREATE TABLE encuestado_plataforma_de_votaci_n (
  id_encuestado INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120),
  nombre VARCHAR(120)
);
CREATE TABLE respuesta_plataforma_de_votaci_n (
  id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
  id_pregunta INT NOT NULL,
  id_encuestado INT NOT NULL,
  valor TEXT,
  respondida_en DATETIME NOT NULL,
  FOREIGN KEY (id_pregunta) REFERENCES pregunta_plataforma_de_votaci_n(id_pregunta),
  FOREIGN KEY (id_encuestado) REFERENCES encuestado_plataforma_de_votaci_n(id_encuestado)
);