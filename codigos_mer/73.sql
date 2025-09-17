CREATE DATABASE Aplicacion_Reto_Bienestar;
USE Aplicacion_Reto_Bienestar;

CREATE TABLE usuario_reto_bienestar (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120),
  fecha_nacimiento DATE
);

CREATE TABLE tipo_actividad_reto (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL
);

CREATE TABLE entrenamiento_reto (
  id_entrenamiento INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha DATETIME NOT NULL,
  notas VARCHAR(255),
  FOREIGN KEY (id_usuario) REFERENCES usuario_reto_bienestar(id_usuario)
);

CREATE TABLE entrenamiento_actividad_reto (
  id_entrenamiento INT NOT NULL,
  id_tipo INT NOT NULL,
  duracion_min INT,
  distancia_km DECIMAL(6,2),
  calorias DECIMAL(8,2),
  PRIMARY KEY (id_entrenamiento, id_tipo),
  FOREIGN KEY (id_entrenamiento) REFERENCES entrenamiento_reto(id_entrenamiento),
  FOREIGN KEY (id_tipo) REFERENCES tipo_actividad_reto(id_tipo)
);

CREATE TABLE medicion_corporal_reto (
  id_medicion INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha DATETIME NOT NULL,
  peso_kg DECIMAL(5,2),
  grasa_pct DECIMAL(5,2),
  fc_reposo TINYINT,
  FOREIGN KEY (id_usuario) REFERENCES usuario_reto_bienestar(id_usuario)
);
