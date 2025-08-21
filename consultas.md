# Questões de consultas ao banco de dados com seus respectivos scripts SQL

## Q1 - Qual o tempo total estudado na primeira matéria criada no segundo mês:

```sql
SELECT SUM(p.tempo_estudo) AS tempo_total_estudado
FROM pomodoro p
JOIN (
    SELECT id
    FROM materia
    WHERE EXTRACT(YEAR FROM data_criacao) = 2025 AND EXTRACT(MONTH FROM data_criacao) = 2
    ORDER BY data_criacao, id
    LIMIT 1
) AS primeira_materia_fev ON p.materia_id = primeira_materia_fev.id;
```

## Q2 - Listar todos os flashcards de um assunto específico, com data de criação:

```sql
SELECT f.pergunta, f.resposta, f.data_criacao
FROM flashcard f
JOIN assunto a ON f.assunto_id = a.id
WHERE a.nome = 'Consultas SQL';
```

## Q3 - Quais as metas que já passaram do prazo e não foram cumpridas:

```sql
SELECT m.descricao, m.prazo, mat.nome AS nome_materia
FROM meta m
JOIN materia mat ON m.materia_id = mat.id
WHERE m.prazo < CURRENT_DATE AND m.cumprida = FALSE;
```

## Q4 - Qual a média das notas de uma autoavaliação em um mês:

```sql
SELECT AVG(nota) AS media_das_notas
FROM materia
WHERE EXTRACT(YEAR FROM data_criacao) = 2025 AND EXTRACT(MONTH FROM data_criacao) = 2;
```

## Q5 - Quantas sessões de pomodoro foram realizadas no último mês:

```sql
SELECT COUNT(*) AS total_sessoes_ultimo_mes
FROM pomodoro
WHERE "data" >= date_trunc('month', CURRENT_DATE - interval '1 month')
  AND "data" < date_trunc('month', CURRENT_DATE);
```

## Q6 - Quais assuntos de uma matéria ainda não possuem flashcards criados:

```sql
SELECT a.nome AS assunto_sem_flashcard
FROM assunto a
LEFT JOIN flashcard f ON a.id = f.assunto_id
JOIN materia m ON a.materia_id = m.id
WHERE m.nome = 'Banco de Dados SQL' AND f.id IS NULL;
```

## Q7 - Liste todas as matérias do segundo curso:

```sql
SELECT m.nome AS nome_materia
FROM materia m
WHERE m.curso_id = 2;
```

## Q8 - Quantas metas de estudo foram criadas no total:

```sql
SELECT COUNT(*) AS total_metas
FROM meta;
```

## Q9 - Quais assuntos não tem flashcards:

```sql
SELECT a.nome AS assunto_sem_flashcard, m.nome AS materia
FROM assunto a
LEFT JOIN flashcard f ON a.id = f.assunto_id
JOIN materia m ON a.materia_id = m.id
WHERE f.id IS NULL;
```

## Q10 - Quantas horas no total foram dedicadas para os estudos:

```sql
SELECT 
    SUM(tempo_estudo) AS total_minutos,
    (SUM(tempo_estudo) / 60) AS horas,
    (SUM(tempo_estudo) % 60) AS minutos
FROM pomodoro;
```

## Q11 - Qual o tempo total dos pomodoro:

```sql
SELECT SUM(tempo_estudo) AS total_minutos_pomodoro
FROM pomodoro;
```

## Q12 - Liste os flashcards do primeiro mês de estudo:

```sql
SELECT pergunta, resposta
FROM flashcard
WHERE EXTRACT(YEAR FROM data_criacao) = (SELECT EXTRACT(YEAR FROM MIN(data_criacao)) FROM flashcard)
  AND EXTRACT(MONTH FROM data_criacao) = (SELECT EXTRACT(MONTH FROM MIN(data_criacao)) FROM flashcard);
```

## Q13 - Retorne as matérias que não possuem pomodora:

```sql
SELECT m.nome AS materia_sem_pomodoro
FROM materia m
LEFT JOIN pomodoro p ON m.id = p.materia_id
WHERE p.id IS NULL;
```

## Q14 - Qual o tempo total por curso:

```sql
SELECT c.nome, SUM(p.tempo_estudo) AS tempo_total_minutos
FROM curso c
JOIN materia m ON c.id = m.curso_id
JOIN pomodoro p ON m.id = p.materia_id
GROUP BY c.id, c.nome;
```

## Q15 - Quantas matérias existem por curso:

```sql
SELECT c.nome, COUNT(m.id) AS quantidade_materias
FROM curso c
JOIN materia m ON c.id = m.curso_id
GROUP BY c.id, c.nome;
```
