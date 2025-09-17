CREATE DATABASE Sistema de Control de Calidad;
USE Sistema de Control de Calidad;

CREATE TABLE proceso_sistema_de_control_de_calidad (
  id_proceso INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);
CREATE TABLE parametro_sistema_de_control_de_calidad (
  id_parametro INT AUTO_INCREMENT PRIMARY KEY,
  id_proceso INT NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  unidad VARCHAR(30),
  FOREIGN KEY (id_proceso) REFERENCES proceso_sistema_de_control_de_calidad(id_proceso)
);
CREATE TABLE inspeccion_sistema_de_control_de_calidad (
  id_inspeccion INT AUTO_INCREMENT PRIMARY KEY,
  id_proceso INT NOT NULL,
  fecha DATETIME NOT NULL,
  resultado VARCHAR(40) NOT NULL,
  FOREIGN KEY (id_proceso) REFERENCES proceso_sistema_de_control_de_calidad(id_proceso)
);
CREATE TABLE inspeccion_detalle_sistema_de_control_de_calidad (
  id_inspeccion INT NOT NULL,
  id_parametro INT NOT NULL,
  valor VARCHAR(60) NOT NULL,
  PRIMARY KEY (id_inspeccion, id_parametro),
  FOREIGN KEY (id_inspeccion) REFERENCES inspeccion_sistema_de_control_de_calidad(id_inspeccion),
  FOREIGN KEY (id_parametro) REFERENCES parametro_sistema_de_control_de_calidad(id_parametro)
);
