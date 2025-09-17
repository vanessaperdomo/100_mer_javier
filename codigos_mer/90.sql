CREATE DATABASE sistema_identificacion_biometrica;
USE sistema_identificacion_biometrica;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  documento VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(120)
);

CREATE TABLE tipo_biometria (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE registro_biometrico (
  id_registro INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_tipo INT NOT NULL,
  dato LONGBLOB NOT NULL,
  fecha_registro DATETIME NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_tipo) REFERENCES tipo_biometria(id_tipo)
);

CREATE TABLE dispositivo (
  id_dispositivo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ubicacion VARCHAR(150)
);

CREATE TABLE acceso (
  id_acceso INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_dispositivo INT NOT NULL,
  fecha DATETIME NOT NULL,
  resultado VARCHAR(50) NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_dispositivo) REFERENCES dispositivo(id_dispositivo)
);
