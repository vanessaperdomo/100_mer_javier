CREATE DATABASE plataforma_eval_desempeno;
USE plataforma_eval_desempeno;

CREATE TABLE empleado (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120)
);

CREATE TABLE competencia (
  id_competencia INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL
);

CREATE TABLE periodo (
  id_periodo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  inicio DATE NOT NULL,
  fin DATE NOT NULL
);

CREATE TABLE evaluacion (
  id_evaluacion INT AUTO_INCREMENT PRIMARY KEY,
  id_empleado INT NOT NULL,
  id_periodo INT NOT NULL,
  fecha DATE NOT NULL,
  FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
  FOREIGN KEY (id_periodo) REFERENCES periodo(id_periodo)
);

CREATE TABLE evaluacion_detalle (
  id_evaluacion INT NOT NULL,
  id_competencia INT NOT NULL,
  puntuacion TINYINT NOT NULL,
  observacion VARCHAR(255),
  PRIMARY KEY (id_evaluacion, id_competencia),
  FOREIGN KEY (id_evaluacion) REFERENCES evaluacion(id_evaluacion),
  FOREIGN KEY (id_competencia) REFERENCES competencia(id_competencia)
);
