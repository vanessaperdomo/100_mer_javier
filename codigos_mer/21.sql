CREATE DATABASE GestionProduccion;
USE GestionProduccion;

CREATE TABLE proceso_gesti_n_de_producci_n (
  id_proceso INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);
CREATE TABLE parametro_gesti_n_de_producci_n (
  id_parametro INT AUTO_INCREMENT PRIMARY KEY,
  id_proceso INT NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  unidad VARCHAR(30),
  FOREIGN KEY (id_proceso) REFERENCES proceso_gesti_n_de_producci_n(id_proceso)
);
CREATE TABLE inspeccion_gesti_n_de_producci_n (
  id_inspeccion INT AUTO_INCREMENT PRIMARY KEY,
  id_proceso INT NOT NULL,
  fecha DATETIME NOT NULL,
  resultado VARCHAR(40) NOT NULL,
  FOREIGN KEY (id_proceso) REFERENCES proceso_gesti_n_de_producci_n(id_proceso)
);
CREATE TABLE inspeccion_detalle_gesti_n_de_producci_n (
  id_inspeccion INT NOT NULL,
  id_parametro INT NOT NULL,
  valor VARCHAR(60) NOT NULL,
  PRIMARY KEY (id_inspeccion, id_parametro),
  FOREIGN KEY (id_inspeccion) REFERENCES inspeccion_gesti_n_de_producci_n(id_inspeccion),
  FOREIGN KEY (id_parametro) REFERENCES parametro_gesti_n_de_producci_n(id_parametro)
);
