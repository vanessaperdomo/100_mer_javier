CREATE DATABASE Aplicación de Traducción;
USE Aplicación de Traducción;

CREATE TABLE autor_aplicaci_n_de_traducci_n (
  id_autor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);
CREATE TABLE libro_aplicaci_n_de_traducci_n (
  id_libro INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  id_autor INT NOT NULL,
  isbn VARCHAR(20),
  FOREIGN KEY (id_autor) REFERENCES autor_aplicaci_n_de_traducci_n(id_autor)
);
CREATE TABLE usuario_aplicaci_n_de_traducci_n (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120)
);
CREATE TABLE lectura_aplicaci_n_de_traducci_n (
  id_usuario INT NOT NULL,
  id_libro INT NOT NULL,
  inicio DATE,
  fin DATE,
  PRIMARY KEY (id_usuario, id_libro),
  FOREIGN KEY (id_usuario) REFERENCES usuario_aplicaci_n_de_traducci_n(id_usuario),
  FOREIGN KEY (id_libro) REFERENCES libro_aplicaci_n_de_traducci_n(id_libro)
);