CREATE DATABASE Aplicación de Viajes;
USE Aplicación de Viajes;

CREATE TABLE lugar_aplicaci_n_de_viajes (
  id_lugar INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  ciudad VARCHAR(100)
);
CREATE TABLE recurso_aplicaci_n_de_viajes (
  id_recurso INT AUTO_INCREMENT PRIMARY KEY,
  id_lugar INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  capacidad INT,
  FOREIGN KEY (id_lugar) REFERENCES lugar_aplicaci_n_de_viajes(id_lugar)
);
CREATE TABLE cliente_aplicaci_n_de_viajes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120)
);
CREATE TABLE reserva_aplicaci_n_de_viajes (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  id_recurso INT NOT NULL,
  id_cliente INT NOT NULL,
  inicio DATETIME NOT NULL,
  fin DATETIME NOT NULL,
  estado VARCHAR(40) NOT NULL,
  FOREIGN KEY (id_recurso) REFERENCES recurso_aplicaci_n_de_viajes(id_recurso),
  FOREIGN KEY (id_cliente) REFERENCES cliente_aplicaci_n_de_viajes(id_cliente)
);
