CREATE DATABASE Plataforma_Consultas_Juridicas;
USE Plataforma_Consultas_Juridicas;

CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) UNIQUE
);

CREATE TABLE abogado (
  id_abogado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  especialidad VARCHAR(100)
);

CREATE TABLE consulta (
  id_consulta INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_abogado INT NOT NULL,
  fecha DATETIME NOT NULL,
  estado VARCHAR(50),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_abogado) REFERENCES abogado(id_abogado)
);

CREATE TABLE respuesta (
  id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
  id_consulta INT NOT NULL,
  contenido TEXT,
  fecha_hora DATETIME NOT NULL,
  FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta)
);
