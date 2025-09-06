-- 1. Listar todos os pacientes com suas consultas
SELECT p.nome AS Paciente, m.nome AS Medico, c.data_consulta, c.diagnostico
FROM Consulta c
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico;

-- 2. Quantidade de consultas por médico
SELECT m.nome, COUNT(c.id_consulta) AS total_consultas
FROM Medico m
LEFT JOIN Consulta c ON m.id_medico = c.id_medico
GROUP BY m.nome;

-- 3. Exames realizados em um paciente específico
SELECT p.nome, e.tipo_exame, e.resultado
FROM Exame e
JOIN Consulta c ON e.id_consulta = c.id_consulta
JOIN Paciente p ON c.id_paciente = p.id_paciente
WHERE p.nome = 'Matheus Ribeiro';

-- 4. Paciente com mais consultas
SELECT TOP 1 p.nome, COUNT(c.id_consulta) AS total_consultas
FROM Paciente p
JOIN Consulta c ON p.id_paciente = c.id_paciente
GROUP BY p.nome
ORDER BY total_consultas DESC;

-- 5. Medicamentos prescritos em cada consulta
SELECT p.nome AS Paciente, m.nome AS Medico, md.nome AS Medicamento, pr.instrucoes
FROM Prescricao pr
JOIN Medicamento md ON pr.id_medicamento = md.id_medicamento
JOIN Consulta c ON pr.id_consulta = c.id_consulta
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico;


--6. Consultas de pacientes por faixa etária
SELECT 
    nome,
    data_nascimento,
    DATEDIFF(YEAR, data_nascimento, GETDATE()) AS idade
FROM Paciente
WHERE DATEDIFF(YEAR, data_nascimento, GETDATE()) BETWEEN 20 AND 40;

--7. Médicos com mais prescrições realizadas
SELECT TOP 5 
    m.nome AS Medico, 
    COUNT(pr.id_prescricao) AS total_prescricoes
FROM Prescricao pr
JOIN Consulta c ON pr.id_consulta = c.id_consulta
JOIN Medico m ON c.id_medico = m.id_medico
GROUP BY m.nome
ORDER BY total_prescricoes DESC;

--8. Consultas de um paciente específico com todos os detalhes
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
LEFT JOIN Prescricao pr ON pr.id_consulta = c.id_consulta
LEFT JOIN Medicamento md ON pr.id_medicamento = md.id_medicamento
WHERE p.nome = 'Matheus Ribeiro';

--9. Exames realizados por tipo em determinado período
SELECT 
    tipo_exame,
    COUNT(*) AS total_exames
FROM Exame e
JOIN Consulta c ON e.id_consulta = c.id_consulta
WHERE c.data_consulta BETWEEN '20250901' AND '20250930'
GROUP BY tipo_exame
ORDER BY total_exames DESC;

