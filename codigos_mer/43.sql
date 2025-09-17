CREATE DATABASE Plataforma de Recomendación de Películas;
USE Plataforma de Recomendación de Películas;

CREATE TABLE categoria_plataforma_de_recomendaci_n_de_pel_culas (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto_plataforma_de_recomendaci_n_de_pel_culas (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  id_categoria INT NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255),
  precio DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (id_categoria) REFERENCES categoria_plataforma_de_recomendaci_n_de_pel_culas(id_categoria)
);
CREATE TABLE cliente_plataforma_de_recomendaci_n_de_pel_culas (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) UNIQUE
);
CREATE TABLE pedido_plataforma_de_recomendaci_n_de_pel_culas (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  creado_en DATETIME NOT NULL,
  estado VARCHAR(40) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente_plataforma_de_recomendaci_n_de_pel_culas(id_cliente)
);
CREATE TABLE pedido_item_plataforma_de_recomendaci_n_de_pel_culas (
  id_pedido INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unit DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (id_pedido, id_producto),
  FOREIGN KEY (id_pedido) REFERENCES pedido_plataforma_de_recomendaci_n_de_pel_culas(id_pedido),
  FOREIGN KEY (id_producto) REFERENCES producto_plataforma_de_recomendaci_n_de_pel_culas(id_producto)
);
