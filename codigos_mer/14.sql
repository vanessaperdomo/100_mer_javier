CREATE DATABASE Sistema de Gestión de Tareas;
USE Sistema de Gestión de Tareas;
 
CREATE TABLE usuario_tareas (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120)
);
CREATE TABLE proyecto_tareas (
  id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);
CREATE TABLE estado_tarea (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL
);
CREATE TABLE tarea (
  id_tarea INT AUTO_INCREMENT PRIMARY KEY,
  id_proyecto INT NOT NULL,
  id_estado INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255),
  vencimiento DATE,
  FOREIGN KEY (id_proyecto) REFERENCES proyecto_tareas(id_proyecto),
  FOREIGN KEY (id_estado) REFERENCES estado_tarea(id_estado)
);
CREATE TABLE asignacion_tarea (
  id_tarea INT NOT NULL,
  id_usuario INT NOT NULL,
  PRIMARY KEY (id_tarea, id_usuario),
  FOREIGN KEY (id_tarea) REFERENCES tarea(id_tarea),
  FOREIGN KEY (id_usuario) REFERENCES usuario_tareas(id_usuario)
);
CREATE TABLE etiqueta_tarea (
  id_etiqueta INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);
CREATE TABLE tarea_etiqueta (
  id_tarea INT NOT NULL,
  id_etiqueta INT NOT NULL,
  PRIMARY KEY (id_tarea, id_etiqueta),
  FOREIGN KEY (id_tarea) REFERENCES tarea(id_tarea),
  FOREIGN KEY (id_etiqueta) REFERENCES etiqueta_tarea(id_etiqueta)
);
