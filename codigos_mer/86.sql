CREATE DATABASE sistema_planificacion_tareas;
USE sistema_planificacion_tareas;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) UNIQUE
);

CREATE TABLE proyecto (
  id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255)
);

CREATE TABLE tarea (
  id_tarea INT AUTO_INCREMENT PRIMARY KEY,
  id_proyecto INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255),
  fecha_inicio DATE,
  fecha_fin DATE,
  estado VARCHAR(40) NOT NULL,
  FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto)
);

CREATE TABLE asignacion (
  id_tarea INT NOT NULL,
  id_usuario INT NOT NULL,
  rol VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_tarea, id_usuario),
  FOREIGN KEY (id_tarea) REFERENCES tarea(id_tarea),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE comentario (
  id_comentario INT AUTO_INCREMENT PRIMARY KEY,
  id_tarea INT NOT NULL,
  id_usuario INT NOT NULL,
  texto VARCHAR(255) NOT NULL,
  fecha DATETIME NOT NULL,
  FOREIGN KEY (id_tarea) REFERENCES tarea(id_tarea),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);
