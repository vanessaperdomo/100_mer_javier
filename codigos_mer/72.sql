CREATE DATABASE Sistema_Gestion_Recursos;
USE Sistema_Gestion_Recursos;

CREATE TABLE empleado_gestion_recursos (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120)
);

CREATE TABLE competencia_gestion_recursos (
  id_competencia INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL
);

CREATE TABLE periodo_gestion_recursos (
  id_periodo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  inicio DATE NOT NULL,
  fin DATE NOT NULL
);

CREATE TABLE evaluacion_gestion_recursos (
  id_evaluacion INT AUTO_INCREMENT PRIMARY KEY,
  id_empleado INT NOT NULL,
  id_periodo INT NOT NULL,
  fecha DATE NOT NULL,
  FOREIGN KEY (id_empleado) REFERENCES empleado_gestion_recursos(id_empleado),
  FOREIGN KEY (id_periodo) REFERENCES periodo_gestion_recursos(id_periodo)
);

CREATE TABLE evaluacion_detalle_gestion_recursos (
  id_evaluacion INT NOT NULL,
  id_competencia INT NOT NULL,
  puntuacion TINYINT NOT NULL,
  observacion VARCHAR(255),
  PRIMARY KEY (id_evaluacion, id_competencia),
  FOREIGN KEY (id_evaluacion) REFERENCES evaluacion_gestion_recursos(id_evaluacion),
  FOREIGN KEY (id_competencia) REFERENCES competencia_gestion_recursos(id_competencia)
);
