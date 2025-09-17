CREATE DATABASE Plataforma_Votacion_Proyectos;
USE Plataforma_Votacion_Proyectos;

CREATE TABLE proyecto_votacion (
  id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255)
);

CREATE TABLE usuario_votacion (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120)
);

CREATE TABLE rol_votacion (
  id_rol INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);

CREATE TABLE miembro_votacion (
  id_proyecto INT NOT NULL,
  id_usuario INT NOT NULL,
  id_rol INT NOT NULL,
  PRIMARY KEY (id_proyecto, id_usuario),
  FOREIGN KEY (id_proyecto) REFERENCES proyecto_votacion(id_proyecto),
  FOREIGN KEY (id_usuario) REFERENCES usuario_votacion(id_usuario),
  FOREIGN KEY (id_rol) REFERENCES rol_votacion(id_rol)
);

CREATE TABLE estado_tarea_votacion (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL
);

CREATE TABLE tarea_votacion (
  id_tarea INT AUTO_INCREMENT PRIMARY KEY,
  id_proyecto INT NOT NULL,
  id_estado INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255),
  fecha_inicio DATE,
  fecha_fin DATE,
  FOREIGN KEY (id_proyecto) REFERENCES proyecto_votacion(id_proyecto),
  FOREIGN KEY (id_estado) REFERENCES estado_tarea_votacion(id_estado)
);

CREATE TABLE imputacion_tiempo_votacion (
  id_imputacion INT AUTO_INCREMENT PRIMARY KEY,
  id_tarea INT NOT NULL,
  id_usuario INT NOT NULL,
  horas DECIMAL(6,2) NOT NULL,
  fecha DATE NOT NULL,
  FOREIGN KEY (id_tarea) REFERENCES tarea_votacion(id_tarea),
  FOREIGN KEY (id_usuario) REFERENCES usuario_votacion(id_usuario)
);
