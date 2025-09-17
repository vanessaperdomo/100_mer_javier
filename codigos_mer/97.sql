CREATE DATABASE Sistema_Control_Tiempo;
USE Sistema_Control_Tiempo;

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
  nombre VARCHAR(150) NOT NULL,
  estado VARCHAR(50),
  FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto)
);

CREATE TABLE registro_tiempo (
  id_registro INT AUTO_INCREMENT PRIMARY KEY,
  id_tarea INT NOT NULL,
  id_usuario INT NOT NULL,
  fecha DATE NOT NULL,
  horas DECIMAL(5,2) NOT NULL,
  FOREIGN KEY (id_tarea) REFERENCES tarea(id_tarea),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);
