CREATE DATABASE Sistema de Control de Documentos Legales;
USE Sistema de Control de Documentos Legales;

CREATE TABLE contraparte_sistema_de_control_de_documentos_legales (
  id_contraparte INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL
);
CREATE TABLE contrato_sistema_de_control_de_documentos_legales (
  id_contrato INT AUTO_INCREMENT PRIMARY KEY,
  id_contraparte INT NOT NULL,
  titulo VARCHAR(200) NOT NULL,
  inicio DATE NOT NULL,
  fin DATE,
  estado VARCHAR(40) NOT NULL,
  FOREIGN KEY (id_contraparte) REFERENCES contraparte_sistema_de_control_de_documentos_legales(id_contraparte)
);
CREATE TABLE clausula_sistema_de_control_de_documentos_legales (
  id_clausula INT AUTO_INCREMENT PRIMARY KEY,
  id_contrato INT NOT NULL,
  numero INT NOT NULL,
  texto TEXT NOT NULL,
  FOREIGN KEY (id_contrato) REFERENCES contrato_sistema_de_control_de_documentos_legales(id_contrato)
);
