CREATE DATABASE PlataformaBlogs;
USE PlataformaBlogs;

CREATE TABLE usuario_plataforma_de_blogs (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120)
);
CREATE TABLE blog_plataforma_de_blogs (
  id_blog INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255)
);
CREATE TABLE entrada_plataforma_de_blogs (
  id_entrada INT AUTO_INCREMENT PRIMARY KEY,
  id_blog INT NOT NULL,
  id_autor INT NOT NULL,
  titulo VARCHAR(200) NOT NULL,
  contenido TEXT,
  publicado_en DATETIME NOT NULL,
  FOREIGN KEY (id_blog) REFERENCES blog_plataforma_de_blogs(id_blog),
  FOREIGN KEY (id_autor) REFERENCES usuario_plataforma_de_blogs(id_usuario)
);
CREATE TABLE etiqueta_plataforma_de_blogs (
  id_etiqueta INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);
CREATE TABLE entrada_etiqueta_plataforma_de_blogs (
  id_entrada INT NOT NULL,
  id_etiqueta INT NOT NULL,
  PRIMARY KEY (id_entrada, id_etiqueta),
  FOREIGN KEY (id_entrada) REFERENCES entrada_plataforma_de_blogs(id_entrada),
  FOREIGN KEY (id_etiqueta) REFERENCES etiqueta_plataforma_de_blogs(id_etiqueta)
);