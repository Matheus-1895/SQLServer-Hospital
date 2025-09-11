-- 1. Listar todos os pacientes com suas consultas
CREATE VIEW vw_ConsultasPacientes AS
SELECT p.nome AS Paciente, m.nome AS Medico, c.data_consulta, c.diagnostico
FROM Consulta c
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico;


-- 2. Quantidade de consultas por médico
CREATE VIEW vw_TotalConsultasPorMedico AS
SELECT m.nome, COUNT(c.id_consulta) AS total_consultas
FROM Medico m
LEFT JOIN Consulta c ON m.id_medico = c.id_medico
GROUP BY m.nome;

-- 3. Exames realizados em um paciente específico
CREATE VIEW vw_ExamesPacientes AS
SELECT p.nome, e.tipo_exame, e.resultado
FROM Exame e
JOIN Consulta c ON e.id_consulta = c.id_consulta
JOIN Paciente p ON c.id_paciente = p.id_paciente;
-- (quando usar, filtra com WHERE nome LIKE '%Matheus Ribeiro%')

SELECT *
FROM vw_ExamesPacientes
WHERE nome LIKE '%Matheus Ribeiro%';


-- 4. Medicamentos prescritos em cada consulta
CREATE VIEW vw_PrescricoesConsultas AS
SELECT p.nome AS Paciente, m.nome AS Medico, md.nome AS Medicamento, pr.instrucoes
FROM Prescricao pr
JOIN Medicamento md ON pr.id_medicamento = md.id_medicamento
JOIN Consulta c ON pr.id_consulta = c.id_consulta
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico;


-- 5. Médicos com mais prescrições realizadas
CREATE VIEW vw_TopMedicosPrescricoes AS
SELECT m.nome AS Medico, COUNT(pr.id_prescricao) AS total_prescricoes
FROM Prescricao pr
JOIN Consulta c ON pr.id_consulta = c.id_consulta
JOIN Medico m ON c.id_medico = m.id_medico
GROUP BY m.nome;

-- 6. Consultas de um paciente específico com todos os detalhes
CREATE VIEW vw_DetalhesConsultasPacientes AS
SELECT 
    p.nome AS Paciente,
    m.nome AS Medico,
    c.data_consulta,
    c.diagnostico,
    ISNULL(e.tipo_exame, 'Sem exame') AS exame,
    ISNULL(md.nome, 'Sem medicamento') AS medicamento,
    ISNULL(pr.instrucoes, '') AS instrucoes
FROM Consulta c
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico
LEFT JOIN Exame e ON e.id_consulta = c.id_consulta
LEFT JOIN Prescricao pr ON c.id_consulta = pr.id_consulta
LEFT JOIN Medicamento md ON pr.id_medicamento = md.id_medicamento;
-- (quando usar, aplica WHERE p.nome = 'Matheus Ribeiro')

-- 7. Exames realizados por tipo em determinado período
CREATE VIEW vw_ExamesPorTipo AS
SELECT 
    tipo_exame,
    COUNT(*) AS total_exames
FROM Exame e
JOIN Consulta c ON e.id_consulta = c.id_consulta
GROUP BY tipo_exame;
-- (quando usar, aplica WHERE c.data_consulta BETWEEN '20250901' AND '20250930')
