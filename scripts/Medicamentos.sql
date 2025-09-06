-- Medicamentos
CREATE TABLE Medicamento (
    id_medicamento INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100),
    dosagem VARCHAR(50)
);