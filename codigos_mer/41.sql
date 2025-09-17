CREATE DATABASE Gestión de Campañas de Marketing;
USE Gestión de Campañas de Marketing;

CREATE TABLE campaña_gesti_n_de_campa_as_de_marketing (
  id_campaña INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  presupuesto DECIMAL(14,2)
);
CREATE TABLE canal_gesti_n_de_campa_as_de_marketing (
  id_canal INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL
);
CREATE TABLE anuncio_gesti_n_de_campa_as_de_marketing (
  id_anuncio INT AUTO_INCREMENT PRIMARY KEY,
  id_campaña INT NOT NULL,
  id_canal INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  contenido TEXT,
  FOREIGN KEY (id_campaña) REFERENCES campaña_gesti_n_de_campa_as_de_marketing(id_campaña),
  FOREIGN KEY (id_canal) REFERENCES canal_gesti_n_de_campa_as_de_marketing(id_canal)
);
CREATE TABLE metricas_anuncio_gesti_n_de_campa_as_de_marketing (
  id_anuncio INT PRIMARY KEY,
  impresiones INT DEFAULT 0,
  clics INT DEFAULT 0,
  conversiones INT DEFAULT 0,
  FOREIGN KEY (id_anuncio) REFERENCES anuncio_gesti_n_de_campa_as_de_marketing(id_anuncio)
);