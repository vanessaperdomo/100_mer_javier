CREATE DATABASE Plataforma_Encuentros_Deportivos;
USE Plataforma_Encuentros_Deportivos;

CREATE TABLE Deporte (
  idDeporte INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Equipo (
  idEquipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  idDeporte INT NOT NULL,
  FOREIGN KEY (idDeporte) REFERENCES Deporte(idDeporte)
);

CREATE TABLE Jugador (
  idJugador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  idEquipo INT NOT NULL,
  FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo)
);

CREATE TABLE Encuentro (
  idEncuentro INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  lugar VARCHAR(150) NOT NULL,
  idDeporte INT NOT NULL,
  FOREIGN KEY (idDeporte) REFERENCES Deporte(idDeporte)
);

CREATE TABLE Participacion (
  idParticipacion INT AUTO_INCREMENT PRIMARY KEY,
  idEncuentro INT NOT NULL,
  idEquipo INT NOT NULL,
  FOREIGN KEY (idEncuentro) REFERENCES Encuentro(idEncuentro),
  FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo)
);

CREATE TABLE Resultado (
  idResultado INT AUTO_INCREMENT PRIMARY KEY,
  idEncuentro INT NOT NULL,
  idEquipo INT NOT NULL,
  puntos INT NOT NULL,
  FOREIGN KEY (idEncuentro) REFERENCES Encuentro(idEncuentro),
  FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo)
);

CREATE TABLE Usuario (
  idUsuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  contrasena VARCHAR(255) NOT NULL,
  tipo ENUM('Administrador','Espectador','Organizador') NOT NULL
);

CREATE TABLE Inscripcion (
  idInscripcion INT AUTO_INCREMENT PRIMARY KEY,
  idUsuario INT NOT NULL,
  idEncuentro INT NOT NULL,
  fecha_inscripcion DATE NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
  FOREIGN KEY (idEncuentro) REFERENCES Encuentro(idEncuentro)
);
