CREATE DATABASE Aplicación de Clima;
USE Aplicación de Clima;

CREATE TABLE proveedor_clima (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);
CREATE TABLE ubicacion_clima (
  id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
  ciudad VARCHAR(100),
  pais VARCHAR(80),
  lat DECIMAL(9,6),
  lon DECIMAL(9,6)
);
CREATE TABLE condicion_codigo (
  id_condicion INT AUTO_INCREMENT PRIMARY KEY,
  codigo VARCHAR(20) NOT NULL,
  descripcion VARCHAR(120) NOT NULL
);
CREATE TABLE observacion_clima (
  id_obs INT AUTO_INCREMENT PRIMARY KEY,
  id_ubicacion INT NOT NULL,
  id_proveedor INT NOT NULL,
  id_condicion INT,
  temperatura DECIMAL(5,2),
  humedad DECIMAL(5,2),
  viento_kmh DECIMAL(6,2),
  fecha DATETIME NOT NULL,
  FOREIGN KEY (id_ubicacion) REFERENCES ubicacion_clima(id_ubicacion),
  FOREIGN KEY (id_proveedor) REFERENCES proveedor_clima(id_proveedor),
  FOREIGN KEY (id_condicion) REFERENCES condicion_codigo(id_condicion)
);
CREATE TABLE pronostico_clima (
  id_pronostico INT AUTO_INCREMENT PRIMARY KEY,
  id_ubicacion INT NOT NULL,
  id_proveedor INT NOT NULL,
  fecha DATETIME NOT NULL,
  temp_min DECIMAL(5,2),
  temp_max DECIMAL(5,2),
  id_condicion INT,
  FOREIGN KEY (id_ubicacion) REFERENCES ubicacion_clima(id_ubicacion),
  FOREIGN KEY (id_proveedor) REFERENCES proveedor_clima(id_proveedor),
  FOREIGN KEY (id_condicion) REFERENCES condicion_codigo(id_condicion)
);

