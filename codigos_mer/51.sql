CREATE DATABASE control_contratos;
USE control_contratos;

CREATE TABLE contraparte (
    id_contraparte INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL
);

CREATE TABLE contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_contraparte INT NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    inicio DATE NOT NULL,
    fin DATE,
    estado VARCHAR(40) NOT NULL,
    FOREIGN KEY (id_contraparte) REFERENCES contraparte(id_contraparte)
);

CREATE TABLE clausula (
    id_clausula INT AUTO_INCREMENT PRIMARY KEY,
    id_contrato INT NOT NULL,
    numero INT NOT NULL,
    texto TEXT NOT NULL,
    FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato)
);
