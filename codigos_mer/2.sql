CREATE DATABASE SistemaPagos;
USE SistemaPagos;

CREATE TABLE usuario_pago (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) NOT NULL UNIQUE,
  nombre VARCHAR(120)
);
CREATE TABLE comercio (
  id_comercio INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);
CREATE TABLE moneda (
  id_moneda INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(3) NOT NULL UNIQUE,
  nombre VARCHAR(30) NOT NULL
);
CREATE TABLE metodo_pago (
  id_metodo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);
CREATE TABLE estado_pago (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL
);
CREATE TABLE pago (
  id_pago INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_comercio INT NOT NULL,
  id_moneda INT NOT NULL,
  id_metodo INT NOT NULL,
  id_estado INT NOT NULL,
  monto DECIMAL(14,2) NOT NULL,
  referencia VARCHAR(100),
  fecha DATETIME NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario_pago(id_usuario),
  FOREIGN KEY (id_comercio) REFERENCES comercio(id_comercio),
  FOREIGN KEY (id_moneda) REFERENCES moneda(id_moneda),
  FOREIGN KEY (id_metodo) REFERENCES metodo_pago(id_metodo),
  FOREIGN KEY (id_estado) REFERENCES estado_pago(id_estado)
);
CREATE TABLE reembolso (
  id_reembolso INT AUTO_INCREMENT PRIMARY KEY,
  id_pago INT NOT NULL,
  monto DECIMAL(14,2) NOT NULL,
  motivo VARCHAR(150),
  fecha DATETIME NOT NULL,
  FOREIGN KEY (id_pago) REFERENCES pago(id_pago)
);


