CREATE DATABASE gestion_clientes;
USE gestion_clientes;

CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120),
  telefono VARCHAR(40)
);

CREATE TABLE oportunidad (
  id_oportunidad INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  etapa VARCHAR(60) NOT NULL,
  valor_estimado DECIMAL(14,2),
  fecha_creacion DATE NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE tipo_actividad (
  id_tipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL
);

CREATE TABLE actividad (
  id_actividad INT AUTO_INCREMENT PRIMARY KEY,
  id_oportunidad INT NOT NULL,
  id_tipo INT NOT NULL,
  programada_en DATETIME NOT NULL,
  nota VARCHAR(255),
  FOREIGN KEY (id_oportunidad) REFERENCES oportunidad(id_oportunidad),
  FOREIGN KEY (id_tipo) REFERENCES tipo_actividad(id_tipo)
);
