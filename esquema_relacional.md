# Esquema Relacional do Projeto

O esquema relacional é a representação lógica da estrutura do banco de dados, mapeada a partir do Modelo Entidade-Relacionamento. Ele define as tabelas, as colunas (atributos), os tipos de dados, as chaves primárias e as chaves estrangeiras que implementam os relacionamentos entre as tabelas.

A seguir, a estrutura detalhada de cada tabela, incluindo tipos de dados e restrições de chave.

### CURSO
```sql
CURSO (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tempo_total INTEGER
);
```

### MATERIA

```sql
MATERIA (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    media_pomodoro FLOAT,
    tempo_estudo INTEGER,
    nota FLOAT,
    data_criacao DATE DEFAULT CURRENT_DATE,
    curso_id INTEGER,
    FOREIGN KEY (curso_id) REFERENCES CURSO(id)
);
```

### ASSUNTO

```sql
ASSUNTO (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    materia_id INTEGER,
    FOREIGN KEY (materia_id) REFERENCES MATERIA(id)
);
```

### FLASHCARD

```sql
FLASHCARD (
    id SERIAL PRIMARY KEY,
    pergunta TEXT NOT NULL,
    resposta TEXT NOT NULL,
    data_criacao DATE DEFAULT CURRENT_DATE,
    assunto_id INTEGER,
    FOREIGN KEY (assunto_id) REFERENCES ASSUNTO(id)
);
```

### POMODORO

```sql
POMODORO (
    id SERIAL PRIMARY KEY,
    tempo_estudo INTEGER NOT NULL,
    data TIMESTAMP NOT NULL,
    materia_id INTEGER,
    FOREIGN KEY (materia_id) REFERENCES MATERIA(id)
);
```

### META

```sql
META (
    id SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    prazo DATE NOT NULL,
    cumprida BOOLEAN DEFAULT FALSE,
    materia_id INTEGER,
    FOREIGN KEY (materia_id) REFERENCES MATERIA(id)
);
```
