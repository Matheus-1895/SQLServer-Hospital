-- Exames
CREATE TABLE Exame (
    id_exame INT IDENTITY(1,1) PRIMARY KEY,
    id_consulta INT,
    tipo_exame VARCHAR(100),
    resultado VARCHAR(255),
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta)
);