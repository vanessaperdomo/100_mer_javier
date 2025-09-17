CREATE DATABASE Control de Accesos;
USE Control de Accesos;

CREATE TABLE instalacion (
  id_instalacion INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL
);
CREATE TABLE punto_acceso (
  id_punto INT AUTO_INCREMENT PRIMARY KEY,
  id_instalacion INT NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  FOREIGN KEY (id_instalacion) REFERENCES instalacion(id_instalacion)
);
CREATE TABLE persona_acceso (
  id_persona INT AUTO_INCREMENT PRIMARY KEY,
  documento VARCHAR(30) UNIQUE,
  nombre VARCHAR(120) NOT NULL
);
CREATE TABLE credencial (
  id_credencial INT AUTO_INCREMENT PRIMARY KEY,
  tipo ENUM('TARJETA','BIOMETRIA','PIN') NOT NULL,
  valor VARCHAR(120) NOT NULL UNIQUE,
  id_persona INT NOT NULL,
  FOREIGN KEY (id_persona) REFERENCES persona_acceso(id_persona)
);
CREATE TABLE rol_acceso (
  id_rol INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);
CREATE TABLE persona_rol (
  id_persona INT NOT NULL,
  id_rol INT NOT NULL,
  PRIMARY KEY (id_persona, id_rol),
  FOREIGN KEY (id_persona) REFERENCES persona_acceso(id_persona),
  FOREIGN KEY (id_rol) REFERENCES rol_acceso(id_rol)
);
CREATE TABLE evento_acceso (
  id_evento INT AUTO_INCREMENT PRIMARY KEY,
  id_punto INT NOT NULL,
  id_credencial INT NOT NULL,
  resultado ENUM('PERMITIDO','DENEGADO') NOT NULL,
  fecha DATETIME NOT NULL,
  FOREIGN KEY (id_punto) REFERENCES punto_acceso(id_punto),
  FOREIGN KEY (id_credencial) REFERENCES credencial(id_credencial)
);
