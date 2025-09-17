CREATE DATABASE Gestión de Activos;
USE Gestión de Activos;

CREATE TABLE cuenta_gesti_n_de_activos (
  id_cuenta INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  tipo VARCHAR(40) NOT NULL
);
CREATE TABLE categoria_gesti_n_de_activos (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);
CREATE TABLE transaccion_gesti_n_de_activos (
  id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
  id_cuenta INT NOT NULL,
  id_categoria INT NOT NULL,
  monto DECIMAL(14,2) NOT NULL,
  fecha DATE NOT NULL,
  descripcion VARCHAR(255),
  FOREIGN KEY (id_cuenta) REFERENCES cuenta_gesti_n_de_activos(id_cuenta),
  FOREIGN KEY (id_categoria) REFERENCES categoria_gesti_n_de_activos(id_categoria)
);