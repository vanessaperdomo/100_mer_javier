CREATE DATABASE ReservasHoteles;
USE ReservasHoteles;

CREATE TABLE lugar (
  id_lugar INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  ciudad VARCHAR(100)
);

CREATE TABLE recurso (
  id_recurso INT AUTO_INCREMENT PRIMARY KEY,
  id_lugar INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  capacidad INT,
  FOREIGN KEY (id_lugar) REFERENCES lugar(id_lugar)
);

CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120)
);

CREATE TABLE reserva (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  id_recurso INT NOT NULL,
  id_cliente INT NOT NULL,
  inicio DATETIME NOT NULL,
  fin DATETIME NOT NULL,
  estado VARCHAR(40) NOT NULL,
  FOREIGN KEY (id_recurso) REFERENCES recurso(id_recurso),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
