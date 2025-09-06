CREATE DATABASE HospitalDB;
GO
USE HospitalDB;
GO
CREATE TABLE Paciente (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    sexo CHAR(1) CHECK (sexo IN ('M','F')),
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);