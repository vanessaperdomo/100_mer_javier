CREATE DATABASE Sistema de Registro de Asistencia;
USE Sistema de Registro de Asistencia;

CREATE TABLE entidad_sistema_de_registro_de_asistencia (
  id_entidad INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255)
);
CREATE TABLE estado_sistema_de_registro_de_asistencia (
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);
CREATE TABLE usuario_sistema_de_registro_de_asistencia (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120)
);
CREATE TABLE registro_sistema_de_registro_de_asistencia (
  id_registro INT AUTO_INCREMENT PRIMARY KEY,
  id_entidad INT NOT NULL,
  id_usuario INT NOT NULL,
  id_estado INT NOT NULL,
  creado_en DATETIME NOT NULL,
  FOREIGN KEY (id_entidad) REFERENCES entidad_sistema_de_registro_de_asistencia(id_entidad),
  FOREIGN KEY (id_usuario) REFERENCES usuario_sistema_de_registro_de_asistencia(id_usuario),
  FOREIGN KEY (id_estado) REFERENCES estado_sistema_de_registro_de_asistencia(id_estado)
);