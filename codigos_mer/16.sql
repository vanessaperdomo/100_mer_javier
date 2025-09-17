CREATE DATABASE Sistema de Gestión de Contactos;
USE Sistema de Gestión de Contactos;

CREATE TABLE cliente_sistema_de_gesti_n_de_contactos (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120),
  telefono VARCHAR(40)
);
CREATE TABLE oportunidad_sistema_de_gesti_n_de_contactos (
  id_oportunidad INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  etapa VARCHAR(60) NOT NULL,
  valor_estimado DECIMAL(14,2),
  fecha_creacion DATE NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente_sistema_de_gesti_n_de_contactos(id_cliente)
);
CREATE TABLE actividad_sistema_de_gesti_n_de_contactos (
  id_actividad INT AUTO_INCREMENT PRIMARY KEY,
  id_oportunidad INT NOT NULL,
  tipo VARCHAR(60) NOT NULL,
  programada_en DATETIME NOT NULL,
  nota VARCHAR(255),
  FOREIGN KEY (id_oportunidad) REFERENCES oportunidad_sistema_de_gesti_n_de_contactos(id_oportunidad)
);

