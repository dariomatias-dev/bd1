-- Inserir Cursos
INSERT INTO curso (id, nome, tempo_total) VALUES 
(1, 'Ciência da Computação Essencial', 0),
(2, 'Matemática para Programadores', 0);

-- Inserir Matérias
INSERT INTO materia (id, nome, curso_id, data_criacao, nota, tempo_estudo, media_pomodoro) VALUES
(1, 'Algoritmos e Estruturas de Dados', 1, '2025-01-10', 8.5, 0, 25),
(2, 'Banco de Dados SQL', 1, '2025-02-05', 9.0, 0, 25),
(3, 'Redes de Computadores', 1, '2025-03-15', 7.5, 0, 25),
(4, 'Cálculo I', 2, '2025-01-20', 8.0, 0, 25),
(5, 'Álgebra Linear', 2, '2025-02-18', 9.5, 0, 25),
(6, 'Lógica Matemática', 2, '2025-04-01', 8.8, 0, 25),
(7, 'Estatística Básica', 2, '2025-08-01', 0, 0, 0);

-- Inserir Assuntos
INSERT INTO assunto (id, nome, descricao, materia_id) VALUES
(1, 'Modelagem de Dados', 'MER, DER e Normalização.', 2),
(2, 'Consultas SQL', 'SELECT, JOIN, GROUP BY.', 2),
(3, 'Índices e Otimização', 'Como acelerar consultas.', 2),
(4, 'Arrays e Listas', 'Estruturas de dados lineares.', 1),
(5, 'Pilhas e Filas', 'Estruturas de dados abstratas.', 1),
(6, 'Tabela Verdade', 'Proposições lógicas.', 6),
(7, 'Vetores e Espaços Vetoriais', 'Conceitos fundamentais.', 5),
(8, 'Matrizes e Determinantes', 'Operações e propriedades.', 5),
(9, 'Limites e Derivadas', 'Conceitos de cálculo diferencial.', 4),
(10, 'Protocolos de Rede', 'TCP/IP, UDP, HTTP.', 3),
(11, 'Endereçamento e Subnet', 'IPv4, máscaras de rede.', 3),
(12, 'Backup e Restore', 'Técnicas de backup e restauração de bancos de dados.', 2),
(13, 'Equações Diferenciais', 'Conceitos de equações diferenciais.', 4),
(14, 'Probabilidade', 'Introdução à probabilidade.', 7);

-- Inserir Flashcards (incluindo dois do primeiro mês)
INSERT INTO flashcard (pergunta, resposta, assunto_id, data_criacao) VALUES
('O que é uma chave primária?', 'É um campo que identifica unicamente cada registro em uma tabela.', 1, '2025-02-01'),
('O que é um JOIN?', 'É uma cláusula usada para combinar linhas de duas ou mais tabelas.', 2, '2025-02-02'),
('Qual a função do GROUP BY?', 'Agrupar linhas que têm os mesmos valores em colunas especificadas.', 2, '2025-02-03'),
('Para que serve o JOIN INNER?', 'Combina registros de duas tabelas onde há correspondência de valores.', 2, '2025-02-05'),
('O que é um vetor?', 'Um objeto matemático que tem magnitude e direção.', 7, '2025-03-01'),
('Qual a diferença entre pilha e fila?', 'Pilha é LIFO e Fila é FIFO.', 5, '2025-03-05'),
('O que é tabela verdade?', 'Representa todas as combinações possíveis de valores lógicos.', 6, '2025-04-01'),
('O que é um limite?', 'É o valor que uma função se aproxima quando x tende a determinado ponto.', 9, '2025-04-05'),
('O que é TCP?', 'Protocolo de comunicação orientado à conexão.', 10, '2025-04-10'),
('Como calcular o determinante de uma matriz?', 'Multiplicando os elementos da diagonal principal e subtraindo a diagonal secundária.', 8, '2025-04-12'),
('O que é subnet?', 'É a divisão de uma rede em sub-redes menores.', 11, '2025-04-15'),
('O que é array?', 'Estrutura que armazena elementos de mesmo tipo em posições sequenciais.', 4, '2025-04-20');

-- Inserir Sessões Pomodoro
INSERT INTO pomodoro (tempo_estudo, "data", materia_id) VALUES
(25, '2025-02-10 10:00:00', 2),
(25, '2025-02-10 10:30:00', 2),
(25, '2025-02-11 14:00:00', 2),
(25, '2025-07-15 09:00:00', 1),
(25, '2025-07-20 15:00:00', 2),
(25, '2025-07-28 16:00:00', 5),
(25, '2025-03-01 11:00:00', 3),
(25, '2025-03-02 09:30:00', 3),
(25, '2025-03-03 14:00:00', 4),
(25, '2025-03-04 15:00:00', 4),
(25, '2025-03-05 10:00:00', 6);

-- Inserir Metas
INSERT INTO meta (descricao, prazo, cumprida, materia_id) VALUES
('Finalizar capítulo de Normalização', '2025-03-01', FALSE, 2),
('Resolver 10 exercícios de vetores', '2025-03-10', TRUE, 5),
('Criar mapa mental de Redes', '2025-09-01', FALSE, 3),
('Estudar para a prova de Lógica', '2025-10-15', FALSE, 6),
('Estudar arrays e listas', '2025-02-28', FALSE, 1),
('Completar exercícios de cálculo diferencial', '2025-03-20', FALSE, 4),
('Revisar matrizes e determinantes', '2025-03-25', FALSE, 5),
('Estudar protocolos e endereçamento de rede', '2025-04-05', FALSE, 3);
