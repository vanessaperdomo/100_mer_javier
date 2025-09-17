CREATE DATABASE GestionRecursosHumanos;
USE GestionRecursosHumanos;

CREATE TABLE departamento (
  id_departamento INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);
CREATE TABLE cargo (
  id_cargo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);
CREATE TABLE empleado (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  id_departamento INT NOT NULL,
  id_cargo INT NOT NULL,
  documento VARCHAR(30) UNIQUE,
  nombres VARCHAR(120) NOT NULL,
  apellidos VARCHAR(120) NOT NULL,
  fecha_ingreso DATE NOT NULL,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento),
  FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo)
);
CREATE TABLE beneficio (
  id_beneficio INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(200)
);
CREATE TABLE empleado_beneficio (
  id_empleado INT NOT NULL,
  id_beneficio INT NOT NULL,
  PRIMARY KEY (id_empleado, id_beneficio),
  FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
  FOREIGN KEY (id_beneficio) REFERENCES beneficio(id_beneficio)
);
CREATE TABLE nomina (
  id_nomina INT AUTO_INCREMENT PRIMARY KEY,
  id_empleado INT NOT NULL,
  periodo DATE NOT NULL,
  salario_base DECIMAL(14,2) NOT NULL,
  deducciones DECIMAL(14,2) NOT NULL DEFAULT 0,
  devengos DECIMAL(14,2) NOT NULL DEFAULT 0,
  FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

