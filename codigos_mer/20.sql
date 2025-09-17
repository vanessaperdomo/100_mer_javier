CREATE DATABASE Sistema de Soporte Técnico;
USE Sistema de Soporte Técnico;

CREATE TABLE usuario_sistema_de_soporte_t_cnico (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(120) UNIQUE,
  nombre VARCHAR(120)
);
CREATE TABLE categoria_sistema_de_soporte_t_cnico (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);
CREATE TABLE ticket_sistema_de_soporte_t_cnico (
  id_ticket INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_categoria INT NOT NULL,
  titulo VARCHAR(150) NOT NULL,
  descripcion TEXT,
  estado VARCHAR(40) NOT NULL,
  creado_en DATETIME NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario_sistema_de_soporte_t_cnico(id_usuario),
  FOREIGN KEY (id_categoria) REFERENCES categoria_sistema_de_soporte_t_cnico(id_categoria)
);
CREATE TABLE comentario_ticket_sistema_de_soporte_t_cnico (
  id_comentario INT AUTO_INCREMENT PRIMARY KEY,
  id_ticket INT NOT NULL,
  id_usuario INT NOT NULL,
  texto VARCHAR(500) NOT NULL,
  creado_en DATETIME NOT NULL,
  FOREIGN KEY (id_ticket) REFERENCES ticket_sistema_de_soporte_t_cnico(id_ticket),
  FOREIGN KEY (id_usuario) REFERENCES usuario_sistema_de_soporte_t_cnico(id_usuario)
);
