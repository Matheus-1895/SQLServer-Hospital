-- Prescrições
CREATE TABLE Prescricao (
    id_prescricao INT IDENTITY(1,1) PRIMARY KEY,
    id_consulta INT,
    id_medicamento INT,
    instrucoes VARCHAR(255),
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta),
    FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento)
);