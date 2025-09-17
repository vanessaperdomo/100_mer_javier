CREATE DATABASE app_meditacion_guiada;
USE app_meditacion_guiada;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120),
  fecha_nacimiento DATE
);

CREATE TABLE tipo_meditacion (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL
);

CREATE TABLE sesion (
  id_sesion INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha DATETIME NOT NULL,
  notas VARCHAR(255),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE sesion_meditacion (
  id_sesion INT NOT NULL,
  id_tipo INT NOT NULL,
  duracion_min INT,
  nivel_estres_inicial TINYINT,
  nivel_estres_final TINYINT,
  PRIMARY KEY (id_sesion, id_tipo),
  FOREIGN KEY (id_sesion) REFERENCES sesion(id_sesion),
  FOREIGN KEY (id_tipo) REFERENCES tipo_meditacion(id_tipo)
);

CREATE TABLE progreso (
  id_progreso INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  fecha DATETIME NOT NULL,
  horas_meditadas DECIMAL(6,2),
  estado_animo VARCHAR(80),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);
