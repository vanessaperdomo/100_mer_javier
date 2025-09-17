CREATE DATABASE GestionInventariosFarmacias;
USE GestionInventariosFarmacias;

CREATE TABLE categoria_gesti_n_de_inventarios_de_farmacias (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);
CREATE TABLE medicamento_gesti_n_de_inventarios_de_farmacias (
  id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
  id_categoria INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  concentracion VARCHAR(60),
  presentacion VARCHAR(60),
  FOREIGN KEY (id_categoria) REFERENCES categoria_gesti_n_de_inventarios_de_farmacias(id_categoria)
);
CREATE TABLE proveedor_gesti_n_de_inventarios_de_farmacias (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);
CREATE TABLE stock_gesti_n_de_inventarios_de_farmacias (
  id_medicamento INT NOT NULL,
  lote VARCHAR(40) NOT NULL,
  fecha_venc DATE NOT NULL,
  cantidad INT NOT NULL,
  id_proveedor INT,
  PRIMARY KEY (id_medicamento, lote),
  FOREIGN KEY (id_medicamento) REFERENCES medicamento_gesti_n_de_inventarios_de_farmacias(id_medicamento),
  FOREIGN KEY (id_proveedor) REFERENCES proveedor_gesti_n_de_inventarios_de_farmacias(id_proveedor)
);
