-- Consultas
CREATE TABLE Consulta (
    id_consulta INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    data_consulta DATETIME,
    diagnostico VARCHAR(255),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);