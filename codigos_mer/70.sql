CREATE DATABASE Gestion_Planes_Ahorro;
USE Gestion_Planes_Ahorro;

CREATE TABLE Cliente (
  idCliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  telefono VARCHAR(20)
);

CREATE TABLE PlanAhorro (
  idPlan INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  monto_objetivo DECIMAL(12,2) NOT NULL,
  plazo_meses INT NOT NULL,
  tasa_interes DECIMAL(5,2) NOT NULL
);

CREATE TABLE CuentaAhorro (
  idCuenta INT AUTO_INCREMENT PRIMARY KEY,
  idCliente INT NOT NULL,
  idPlan INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  saldo_actual DECIMAL(12,2) DEFAULT 0,
  FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
  FOREIGN KEY (idPlan) REFERENCES PlanAhorro(idPlan)
);

CREATE TABLE Aporte (
  idAporte INT AUTO_INCREMENT PRIMARY KEY,
  idCuenta INT NOT NULL,
  fecha DATE NOT NULL,
  monto DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (idCuenta) REFERENCES CuentaAhorro(idCuenta)
);

CREATE TABLE Retiro (
  idRetiro INT AUTO_INCREMENT PRIMARY KEY,
  idCuenta INT NOT NULL,
  fecha DATE NOT NULL,
  monto DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (idCuenta) REFERENCES CuentaAhorro(idCuenta)
);

CREATE TABLE Usuario (
  idUsuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  contrasena VARCHAR(255) NOT NULL,
  rol ENUM('Administrador','Asesor') NOT NULL
);
