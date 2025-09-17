CREATE DATABASE Aplicación de Notas;
USE Aplicación de Notas;

CREATE TABLE usuario_notas (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120)
);
CREATE TABLE cuaderno (
  id_cuaderno INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario_notas(id_usuario)
);
CREATE TABLE nota (
  id_nota INT AUTO_INCREMENT PRIMARY KEY,
  id_cuaderno INT NOT NULL,
  titulo VARCHAR(150),
  contenido TEXT,
  creada_en DATETIME NOT NULL,
  FOREIGN KEY (id_cuaderno) REFERENCES cuaderno(id_cuaderno)
);
CREATE TABLE etiqueta_nota (
  id_etiqueta INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);
CREATE TABLE nota_etiqueta (
  id_nota INT NOT NULL,
  id_etiqueta INT NOT NULL,
  PRIMARY KEY (id_nota, id_etiqueta),
  FOREIGN KEY (id_nota) REFERENCES nota(id_nota),
  FOREIGN KEY (id_etiqueta) REFERENCES etiqueta_nota(id_etiqueta)
);
