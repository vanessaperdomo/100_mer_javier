CREATE DATABASE GestionDocumentosNube;
USE GestionDocumentosNube;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150),
  email VARCHAR(120)
);

CREATE TABLE carpeta (
  id_carpeta INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  id_padre INT
);

CREATE TABLE documento (
  id_documento INT AUTO_INCREMENT PRIMARY KEY,
  id_carpeta INT,
  id_propietario INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  version INT NOT NULL DEFAULT 1,
  FOREIGN KEY (id_carpeta) REFERENCES carpeta(id_carpeta),
  FOREIGN KEY (id_propietario) REFERENCES usuario(id_usuario)
);
