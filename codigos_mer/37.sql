CREATE DATABASE Aplicación de Transporte;
USE Aplicación de Transporte;


CREATE TABLE usuario_aplicaci_n_de_transporte (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);
CREATE TABLE vehiculo_aplicaci_n_de_transporte (
  id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
  placa VARCHAR(20) UNIQUE,
  marca VARCHAR(80),
  modelo VARCHAR(80)
);
CREATE TABLE viaje_aplicaci_n_de_transporte (
  id_viaje INT AUTO_INCREMENT PRIMARY KEY,
  id_conductor INT NOT NULL,
  origen VARCHAR(150) NOT NULL,
  destino VARCHAR(150) NOT NULL,
  salida DATETIME NOT NULL,
  llegada DATETIME,
  FOREIGN KEY (id_conductor) REFERENCES usuario_aplicaci_n_de_transporte(id_usuario)
);
CREATE TABLE viaje_pasajero_aplicaci_n_de_transporte (
  id_viaje INT NOT NULL,
  id_pasajero INT NOT NULL,
  PRIMARY KEY (id_viaje, id_pasajero),
  FOREIGN KEY (id_viaje) REFERENCES viaje_aplicaci_n_de_transporte(id_viaje),
  FOREIGN KEY (id_pasajero) REFERENCES usuario_aplicaci_n_de_transporte(id_usuario)
);

