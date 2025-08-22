# Projeto de Banco de Dados BD1

Este repositório contém toda a documentação e scripts relacionados ao projeto da disciplina de Banco de Dados 1. O projeto abrange desde a modelagem conceitual até a implementação e consulta de um banco de dados relacional.

## 1. Minimundo do Projeto

A descrição do domínio do problema, incluindo as entidades, seus relacionamentos e as regras de negócio que nortearam o desenvolvimento do banco de dados, está detalhada no arquivo:

- [mini_mundo.md](mini_mundo.md)

## 2. Esquema Conceitual do Projeto

O Modelo Entidade-Relacionamento (MER) que representa abstratamente a estrutura do banco de dados pode ser visualizado abaixo:

![Modelo Conceitual](esquema_conceitual.png)

## 3. Dicionário de Dados

A documentação completa de todas as tabelas, atributos, tipos de dados, restrições e relacionamentos está disponível no dicionário de dados:

- [dicionario.md](dicionario.md)

### 4. Esquema Relacional do Projeto

O esquema relacional, que descreve a estrutura lógica das tabelas do banco de dados, foi mapeado a partir do modelo conceitual e está detalhado no seguinte arquivo:

- [esquema_relacional.md](esquema_relacional.md)

## 5. Script DDL para Criação do Banco de Dados

O script SQL contendo os comandos `CREATE TABLE` para gerar a estrutura do banco de dados no PostgreSQL está localizado no arquivo:

- [criacao_de_tabelas.sql](criacao_de_tabelas.sql)

## 6. Script de Povoamento do Banco de Dados

Os dados para povoamento do banco de dados:

- [povoamento.sql](povoamento.sql)

## 7. URL de Conexão com o Banco de Dados

O projeto está hospedado na plataforma Neon (PostgreSQL serverless). A URL para conexão direta com o banco de dados já populado é:

```bash
postgresql://neondb_owner:npg_7Qhj1BXMGqpa@ep-tiny-haze-acnuw6db-pooler.sa-east-1.aws.neon.tech/neondb?sslmode=require&channel_binding=require
```

## 8. Questões e Consultas SQL

As 15 questões de consulta ao banco de dados com seus respectivos scripts SQL:

- [consultas.md](consultas.md)
