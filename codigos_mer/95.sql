CREATE DATABASE SistemaControlAccesos;
USE SistemaControlAccesos;

CREATE TABLE evento (
  id_evento INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150),
  fecha DATE,
  lugar VARCHAR(150)
);

CREATE TABLE asistente (
  id_asistente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150),
  email VARCHAR(120) UNIQUE
);

CREATE TABLE acceso (
  id_acceso INT AUTO_INCREMENT PRIMARY KEY,
  id_evento INT NOT NULL,
  id_asistente INT NOT NULL,
  fecha_hora DATETIME,
  FOREIGN KEY (id_evento) REFERENCES evento(id_evento),
  FOREIGN KEY (id_asistente) REFERENCES asistente(id_asistente)
);
