-- Tabela para os Cursos
CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tempo_total INT
);

-- Tabela para as Matérias
CREATE TABLE materia (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    media_pomodoro FLOAT,
    tempo_estudo INT,
    nota FLOAT,
    curso_id INT NOT NULL,
    data_criacao DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (curso_id) REFERENCES curso(id)
);

-- Tabela para os Assuntos
CREATE TABLE assunto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    materia_id INT NOT NULL,
    FOREIGN KEY (materia_id) REFERENCES materia(id)
);

-- Tabela para os Flashcards
CREATE TABLE flashcard (
    id SERIAL PRIMARY KEY,
    pergunta TEXT NOT NULL,
    resposta TEXT NOT NULL,
    assunto_id INT NOT NULL,
    data_criacao DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (assunto_id) REFERENCES assunto(id)
);

-- Tabela para as Sessões Pomodoro
CREATE TABLE pomodoro (
    id SERIAL PRIMARY KEY,
    tempo_estudo INT NOT NULL,
    "data" TIMESTAMP NOT NULL,
    materia_id INT NOT NULL,
    FOREIGN KEY (materia_id) REFERENCES materia(id)
);

-- Tabela para as Metas
CREATE TABLE meta (
    id SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    prazo DATE NOT NULL,
    cumprida BOOLEAN DEFAULT FALSE,
    materia_id INT NOT NULL,
    FOREIGN KEY (materia_id) REFERENCES materia(id)
);
