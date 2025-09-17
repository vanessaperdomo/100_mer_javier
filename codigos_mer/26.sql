CREATE DATABASE AplicacionRecomendaciones;
USE AplicacionRecomendaciones;

CREATE TABLE creador_aplicaci_n_de_recomendaciones (
  id_creador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);
CREATE TABLE pieza_aplicaci_n_de_recomendaciones (
  id_pieza INT AUTO_INCREMENT PRIMARY KEY,
  id_creador INT NOT NULL,
  titulo VARCHAR(200) NOT NULL,
  duracion_seg INT,
  FOREIGN KEY (id_creador) REFERENCES creador_aplicaci_n_de_recomendaciones(id_creador)
);
CREATE TABLE usuario_aplicaci_n_de_recomendaciones (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150),
  email VARCHAR(120)
);
CREATE TABLE reproduccion_aplicaci_n_de_recomendaciones (
  id_usuario INT NOT NULL,
  id_pieza INT NOT NULL,
  reproducido_en DATETIME NOT NULL,
  PRIMARY KEY (id_usuario, id_pieza, reproducido_en),
  FOREIGN KEY (id_usuario) REFERENCES usuario_aplicaci_n_de_recomendaciones(id_usuario),
  FOREIGN KEY (id_pieza) REFERENCES pieza_aplicaci_n_de_recomendaciones(id_pieza)
);
