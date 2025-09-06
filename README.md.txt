# 🏥 HospitalDB – Sistema de Gerenciamento Hospitalar

Este projeto é um **banco de dados relacional** para gerenciamento de pacientes, médicos, consultas, exames e prescrições médicas.  
O objetivo é simular como um hospital poderia organizar e consultar suas informações de forma estruturada utilizando **SQL**.

## 📂 Estrutura do Projeto
- `create_tables.sql` → Criação das tabelas com chaves primárias e estrangeiras  
- `insert_data.sql` → Inserção de dados fictícios para simulação  
- `queries.sql` → Consultas SQL úteis para análise

## 🔑 Modelo Entidade-Relacionamento
- **Paciente** → pode ter várias **Consultas**  
- **Médico** → pode atender várias **Consultas**  
- **Consulta** → pode gerar vários **Exames** e várias **Prescrições**  
- **Prescrição** → relaciona uma **Consulta** com um **Medicamento**  

## 📊 Exemplos de Consultas
- Paciente com mais consultas  
- Quantidade de consultas por médico  
- Exames realizados por paciente  
- Medicamentos prescritos em cada consulta  

## 🚀 Tecnologias
- SQL Server 
- SQL puro (DDL, DML e consultas)  

## 👨‍💻 Autor
Projeto desenvolvido para fins de estudo e portfólio.  
