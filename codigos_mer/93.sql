CREATE DATABASE plataforma_compras_grupales;
USE plataforma_compras_grupales;

CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) UNIQUE
);

CREATE TABLE grupo_compra (
  id_grupo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255)
);

CREATE TABLE producto (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  precio DECIMAL(12,2) NOT NULL
);

CREATE TABLE grupo_miembro (
  id_grupo INT NOT NULL,
  id_usuario INT NOT NULL,
  PRIMARY KEY (id_grupo, id_usuario),
  FOREIGN KEY (id_grupo) REFERENCES grupo_compra(id_grupo),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE pedido_grupal (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_grupo INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  fecha DATETIME NOT NULL,
  FOREIGN KEY (id_grupo) REFERENCES grupo_compra(id_grupo),
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
