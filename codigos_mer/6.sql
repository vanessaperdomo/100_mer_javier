CREATE DATABASE Sistema de Reserva Restaurante;
USE Sistema de Reserva Restaurante;

CREATE TABLE restaurante (
  id_restaurante INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);
CREATE TABLE mesa (
  id_mesa INT AUTO_INCREMENT PRIMARY KEY,
  id_restaurante INT NOT NULL,
  numero VARCHAR(10) NOT NULL,
  capacidad INT NOT NULL,
  FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante)
);
CREATE TABLE comensal (
  id_comensal INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  telefono VARCHAR(40),
  email VARCHAR(120)
);
CREATE TABLE estado_reserva (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL
);
CREATE TABLE reserva (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  id_mesa INT NOT NULL,
  id_comensal INT NOT NULL,
  id_estado INT NOT NULL,
  inicio DATETIME NOT NULL,
  fin DATETIME NOT NULL,
  FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa),
  FOREIGN KEY (id_comensal) REFERENCES comensal(id_comensal),
  FOREIGN KEY (id_estado) REFERENCES estado_reserva(id_estado)
);


