CREATE DATABASE plataforma_recompensas;
USE plataforma_recompensas;

CREATE TABLE empleado (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(120) NOT NULL,
  departamento VARCHAR(100) NOT NULL
);

CREATE TABLE recompensa (
  id_recompensa INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  descripcion VARCHAR(255),
  puntos_requeridos INT NOT NULL
);

CREATE TABLE puntos (
  id_puntos INT AUTO_INCREMENT PRIMARY KEY,
  id_empleado INT NOT NULL,
  puntos_totales INT NOT NULL,
  FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE actividad (
  id_actividad INT AUTO_INCREMENT PRIMARY KEY,
  id_empleado INT NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  puntos_ganados INT NOT NULL,
  fecha DATE NOT NULL,
  FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE canje (
  id_canje INT AUTO_INCREMENT PRIMARY KEY,
  id_empleado INT NOT NULL,
  id_recompensa INT NOT NULL,
  fecha_canje DATE NOT NULL,
  FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
  FOREIGN KEY (id_recompensa) REFERENCES recompensa(id_recompensa)
);
