-- Inserir pacientes
INSERT INTO Paciente (nome, data_nascimento, sexo, telefone, endereco) VALUES
('Matheus Ribeiro', '20150312', 'M', '21999999999', 'Rua A, RJ'),
('Luiz Eduardo Machado', '19900725', 'F', '21988888888', 'Rua B, RJ'),
('Carlos Augusto', '19781102', 'M', '21977777777', 'Rua C, RJ');

-- Inserir médicos
INSERT INTO Medico (nome, especialidade, crm) VALUES
('Dr. Luiz Alves', 'Pediatra', 'CRM1234'),
('Dra. Paulo Lima', 'Cardiologia', 'CRM5678'),
('Dr. Ricardo Mendes', 'Ortopedia', 'CRM9101');

-- Inserir consultas
INSERT INTO Consulta (id_paciente, id_medico, data_consulta, diagnostico) VALUES
(1, 1, '20250905 10:00:00', 'Gripe'),
(2, 2, '20250902 15:30:00', 'Hipertensão arterial'),
(3, 3, '20250828 09:00:00', 'Fratura no braço');

-- Inserir exames (referenciando consultas existentes)
INSERT INTO Exame (id_consulta, tipo_exame, resultado) VALUES
(1, 'Exame de sangue', 'Infecção viral detectada'),
(2, 'Eletrocardiograma', 'Alterações leves'),
(3, 'Raio-X', 'Fratura confirmada');

-- Inserir medicamentos
INSERT INTO Medicamento (nome, dosagem) VALUES
('Paracetamol', '500mg'),
('Losartana', '50mg'),
('Ibuprofeno', '400mg');

-- Inserir prescrições (referenciando consultas e medicamentos existentes)
INSERT INTO Prescricao (id_consulta, id_medicamento, instrucoes) VALUES
(1, 1, 'Tomar 1 comprimido a cada 8 horas'),
(2, 2, 'Tomar 1 comprimido ao dia'),
(3, 3, 'Tomar 1 comprimido a cada 12 horas');

