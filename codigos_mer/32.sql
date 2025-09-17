CREATE DATABASE Gestión de Documentos;
USE Gestión de Documentos;

CREATE TABLE usuario_gesti_n_de_documentos (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150),
  email VARCHAR(120)
);
CREATE TABLE carpeta_gesti_n_de_documentos (
  id_carpeta INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  id_padre INT
);
CREATE TABLE documento_gesti_n_de_documentos (
  id_documento INT AUTO_INCREMENT PRIMARY KEY,
  id_carpeta INT,
  id_propietario INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  version INT NOT NULL DEFAULT 1,
  FOREIGN KEY (id_carpeta) REFERENCES carpeta_gesti_n_de_documentos(id_carpeta),
  FOREIGN KEY (id_propietario) REFERENCES usuario_gesti_n_de_documentos(id_usuario)
);