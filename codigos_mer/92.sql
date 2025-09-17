CREATE DATABASE aplicacion_monitorizar_sueno;
USE aplicacion_monitorizar_sueno;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120),
  fecha_nacimiento DATE
);

CREATE TABLE tipo_sueno (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL
);

CREATE TABLE registro_sueno (
  id_registro INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha DATETIME NOT NULL,
  duracion_min INT,
  calidad VARCHAR(50),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE registro_sueno_tipo (
  id_registro INT NOT NULL,
  id_tipo INT NOT NULL,
  fases_min INT,
  PRIMARY KEY (id_registro, id_tipo),
  FOREIGN KEY (id_registro) REFERENCES registro_sueno(id_registro),
  FOREIGN KEY (id_tipo) REFERENCES tipo_sueno(id_tipo)
);

CREATE TABLE medicion_biometrica (
  id_medicion INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha DATETIME NOT NULL,
  frecuencia_cardiaca TINYINT,
  movimiento TINYINT,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);
