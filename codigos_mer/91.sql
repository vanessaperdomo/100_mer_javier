CREATE DATABASE plataforma_publicidad_digital;
USE plataforma_publicidad_digital;

CREATE TABLE anunciante (
  id_anunciante INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120),
  telefono VARCHAR(40)
);

CREATE TABLE campaña (
  id_campaña INT AUTO_INCREMENT PRIMARY KEY,
  id_anunciante INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  presupuesto DECIMAL(12,2),
  fecha_inicio DATE,
  fecha_fin DATE,
  FOREIGN KEY (id_anunciante) REFERENCES anunciante(id_anunciante)
);

CREATE TABLE anuncio (
  id_anuncio INT AUTO_INCREMENT PRIMARY KEY,
  id_campaña INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  contenido TEXT,
  tipo VARCHAR(50),
  FOREIGN KEY (id_campaña) REFERENCES campaña(id_campaña)
);

CREATE TABLE impresion (
  id_impresion INT AUTO_INCREMENT PRIMARY KEY,
  id_anuncio INT NOT NULL,
  fecha DATETIME NOT NULL,
  clicks INT,
  FOREIGN KEY (id_anuncio) REFERENCES anuncio(id_anuncio)
);
