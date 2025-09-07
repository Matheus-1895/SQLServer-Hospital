# SQLServer-Hospital 🏥

Um sistema de gerenciamento hospitalar desenvolvido em **SQL Server**, com foco em organização de pacientes, médicos, consultas e prescrições.  
O projeto serve como referência para estudo de **bancos de dados relacionais**, consultas SQL e modelagem de dados.

---

## 🎯 Objetivo do Projeto

O objetivo deste projeto é simular o funcionamento de um hospital, permitindo:  

- Cadastrar pacientes, médicos, consultas e prescrições.  
- Consultar informações de atendimento, histórico de pacientes e prescrições.  
- Praticar **SQL avançado** (joins, subqueries e agregações).  
- Servir como projeto de **portfólio** para estudos e demonstrações.  

---

## 📂 Estrutura do Projeto

O repositório contém os seguintes arquivos:

- **create_tables.sql** → criação das tabelas com chaves primárias e estrangeiras.  
- **insert_data.sql** → inserção de dados fictícios para testes.  
- **queries.sql** → consultas SQL de exemplo para análise de dados.  

---

## 📊 Modelo de Dados (ERD)

O projeto segue um modelo relacional com as seguintes entidades principais:

- **Paciente** → pode ter várias consultas.  
- **Médico** → pode atender várias consultas.  
- **Consulta** → relaciona paciente e médico, podendo gerar várias prescrições.  
- **Prescrição** → vincula uma consulta a medicamentos.  

---

##Representação simplificada:

Paciente --< Consulta >-- Medico
Consulta --< Prescricao >-- Medicamento

Exemplos de Consultas SQL

---

##1. Listar todos os pacientes com suas consultas e médicos

SELECT p.nome AS Paciente, m.nome AS Medico, c.data_consulta
FROM Consulta c
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico;

---

##2. Quantidade de consultas por médico

SELECT m.nome, COUNT(c.id_consulta) AS total_consultas
FROM Medico m
JOIN Consulta c ON m.id_medico = c.id_medico
GROUP BY m.nome;

---

##3. Histórico de prescrições de um paciente

SELECT p.nome AS Paciente, pr.nome_medicamento, c.data_consulta
FROM Prescricao pr
JOIN Consulta c ON pr.id_consulta = c.id_consulta
JOIN Paciente p ON c.id_paciente = p.id_paciente
WHERE p.id_paciente = 1;

---

##**Como Rodar o Projeto**

###Abra o SQL Server Management Studio (SSMS).

###Crie um novo banco de dados:

CREATE DATABASE HospitalDB;
USE HospitalDB;

###Execute os scripts na seguinte ordem:

-create_tables.sql
-insert_data.sql
-queries.sql (para testar consultas)

###Explore os dados com queries próprias ou usando os exemplos já fornecidos.

---

##Melhorias Futuras que irei fazer

-Criar views, stored procedures e triggers.
-Adicionar tabelas extras como especialidades médicas, salas e agendamentos.
-Criar relatórios avançados e análises de histórico de pacientes.
-Adicionar um diagrama ER visual no README.
