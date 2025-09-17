CREATE DATABASE app_viajar_mascotas;
USE app_viajar_mascotas;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) UNIQUE
);

CREATE TABLE mascota (
  id_mascota INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  especie VARCHAR(60) NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE viaje (
  id_viaje INT AUTO_INCREMENT PRIMARY KEY,
  destino VARCHAR(150) NOT NULL,
  fecha_salida DATE NOT NULL,
  fecha_regreso DATE
);

CREATE TABLE reserva (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_viaje INT NOT NULL,
  fecha_reserva DATETIME NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_viaje) REFERENCES viaje(id_viaje)
);

CREATE TABLE reserva_mascota (
  id_reserva INT NOT NULL,
  id_mascota INT NOT NULL,
  PRIMARY KEY (id_reserva, id_mascota),
  FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva),
  FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota)
);
