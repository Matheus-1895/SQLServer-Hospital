-- Médicos
CREATE TABLE Medico (
    id_medico INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    crm VARCHAR(20) UNIQUE
);