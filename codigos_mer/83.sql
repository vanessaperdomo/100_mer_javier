CREATE DATABASE sistema_registro_vehiculos;
USE sistema_registro_vehiculos;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);

CREATE TABLE vehiculo (
  id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
  placa VARCHAR(20) UNIQUE,
  marca VARCHAR(80),
  modelo VARCHAR(80)
);

CREATE TABLE viaje (
  id_viaje INT AUTO_INCREMENT PRIMARY KEY,
  id_conductor INT NOT NULL,
  origen VARCHAR(150) NOT NULL,
  destino VARCHAR(150) NOT NULL,
  salida DATETIME NOT NULL,
  llegada DATETIME,
  FOREIGN KEY (id_conductor) REFERENCES usuario(id_usuario)
);

CREATE TABLE viaje_pasajero (
  id_viaje INT NOT NULL,
  id_pasajero INT NOT NULL,
  PRIMARY KEY (id_viaje, id_pasajero),
  FOREIGN KEY (id_viaje) REFERENCES viaje(id_viaje),
  FOREIGN KEY (id_pasajero) REFERENCES usuario(id_usuario)
);
