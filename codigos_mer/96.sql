CREATE DATABASE plataforma_startups;
USE plataforma_startups;

CREATE TABLE startup (
  id_startup INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  industria VARCHAR(100),
  ubicacion VARCHAR(120)
);

CREATE TABLE inversor (
  id_inversor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120),
  interes_industria VARCHAR(100)
);

CREATE TABLE conexion (
  id_conexion INT AUTO_INCREMENT PRIMARY KEY,
  id_startup INT NOT NULL,
  id_inversor INT NOT NULL,
  fecha DATE NOT NULL,
  estado VARCHAR(50),
  FOREIGN KEY (id_startup) REFERENCES startup(id_startup),
  FOREIGN KEY (id_inversor) REFERENCES inversor(id_inversor)
);

CREATE TABLE mensaje (
  id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
  id_conexion INT NOT NULL,
  contenido TEXT,
  fecha_hora DATETIME NOT NULL,
  FOREIGN KEY (id_conexion) REFERENCES conexion(id_conexion)
);
