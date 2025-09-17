CREATE DATABASE Plataforma de Subastas;
USE Plataforma de Subastas;

CREATE TABLE usuario_plataforma_de_subastas (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120)
);
CREATE TABLE lote_plataforma_de_subastas (
  id_lote INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255)
);
CREATE TABLE subasta_plataforma_de_subastas (
  id_subasta INT AUTO_INCREMENT PRIMARY KEY,
  id_lote INT NOT NULL,
  inicio DATETIME NOT NULL,
  fin DATETIME NOT NULL,
  FOREIGN KEY (id_lote) REFERENCES lote_plataforma_de_subastas(id_lote)
);
CREATE TABLE puja_plataforma_de_subastas (
  id_puja INT AUTO_INCREMENT PRIMARY KEY,
  id_subasta INT NOT NULL,
  id_usuario INT NOT NULL,
  monto DECIMAL(14,2) NOT NULL,
  momento DATETIME NOT NULL,
  FOREIGN KEY (id_subasta) REFERENCES subasta_plataforma_de_subastas(id_subasta),
  FOREIGN KEY (id_usuario) REFERENCES usuario_plataforma_de_subastas(id_usuario)
);

