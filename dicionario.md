# Dicionário de Dados do Banco de Estudos (para PostgreSQL)

Este documento descreve a estrutura final do banco de dados, com os tipos de dados específicos para implementação em PostgreSQL.

## 1. Descrição das Tabelas e Atributos

### Tabela: curso

**Descrição:** Armazena os cursos gerais que o usuário está seguindo.

**Atributos:**

| Nome do Atributo | Tipo de Dado (PostgreSQL) | Descrição do Atributo                             | Restrições             |
| :--------------- | :------------------------ | :------------------------------------------------ | :--------------------- |
| id               | SERIAL                    | Identificador numérico único, auto-incrementável. | Chave Primária (PK)    |
| nome             | VARCHAR(255)              | O nome oficial do curso.                          | Obrigatório (NOT NULL) |
| tempo_total      | INTEGER                   | Tempo total de estudo para o curso, em minutos.   | Opcional               |

### Tabela: materia

**Descrição:** Representa uma disciplina específica que pertence a um curso.

**Atributos:**

| Nome do Atributo | Tipo de Dado (PostgreSQL) | Descrição do Atributo                             | Restrições                           |
| :--------------- | :------------------------ | :------------------------------------------------ | :----------------------------------- |
| id               | SERIAL                    | Identificador numérico único, auto-incrementável. | Chave Primária (PK)                  |
| nome             | VARCHAR(255)              | O nome da matéria.                                | Obrigatório (NOT NULL)               |
| media_pomodoro   | FLOAT                     | Média de duração das sessões de pomodoro.         | Opcional                             |
| tempo_estudo     | INTEGER                   | Tempo total de estudo acumulado, em minutos.      | Opcional                             |
| nota             | FLOAT                     | Nota de autoavaliação ou oficial na matéria.      | Opcional                             |
| data_criacao     | DATE                      | Data em que a matéria foi registrada no sistema.  | Opcional, Padrão CURRENT_DATE        |
| curso_id         | INTEGER                   | Chave que conecta a matéria ao seu curso.         | Chave Estrangeira (FK) para curso.id |

### Tabela: assunto

**Descrição:** Detalha um tópico ou capítulo de estudo dentro de uma matéria.

**Atributos:**

| Nome do Atributo | Tipo de Dado (PostgreSQL) | Descrição do Atributo                             | Restrições                             |
| :--------------- | :------------------------ | :------------------------------------------------ | :------------------------------------- |
| id               | SERIAL                    | Identificador numérico único, auto-incrementável. | Chave Primária (PK)                    |
| nome             | VARCHAR(255)              | O nome do assunto.                                | Obrigatório (NOT NULL)                 |
| descricao        | TEXT                      | Descrição detalhada sobre o que o assunto aborda. | Opcional                               |
| materia_id       | INTEGER                   | Chave que conecta o assunto à sua matéria.        | Chave Estrangeira (FK) para materia.id |

### Tabela: flashcard

**Descrição:** Armazena cartões de memorização (pergunta e resposta) vinculados a um assunto.

**Atributos:**

| Nome do Atributo | Tipo de Dado (PostgreSQL) | Descrição do Atributo                             | Restrições                             |
| :--------------- | :------------------------ | :------------------------------------------------ | :------------------------------------- |
| id               | SERIAL                    | Identificador numérico único, auto-incrementável. | Chave Primária (PK)                    |
| pergunta         | TEXT                      | O texto da pergunta no flashcard.                 | Obrigatório (NOT NULL)                 |
| resposta         | TEXT                      | O texto da resposta no flashcard.                 | Obrigatório (NOT NULL)                 |
| data_criacao     | DATE                      | Data em que o flashcard foi criado.               | Opcional, Padrão CURRENT_DATE          |
| assunto_id       | INTEGER                   | Chave que conecta o flashcard ao seu assunto.     | Chave Estrangeira (FK) para assunto.id |

### Tabela: pomodoro

**Descrição:** Registra cada sessão de estudo focada, baseada na técnica Pomodoro.

**Atributos:**

| Nome do Atributo | Tipo de Dado (PostgreSQL) | Descrição do Atributo                             | Restrições                             |
| :--------------- | :------------------------ | :------------------------------------------------ | :------------------------------------- |
| id               | SERIAL                    | Identificador numérico único, auto-incrementável. | Chave Primária (PK)                    |
| tempo_estudo     | INTEGER                   | Duração da sessão de estudo em minutos.           | Obrigatório (NOT NULL)                 |
| data             | TIMESTAMP                 | Data e hora exatas em que a sessão foi realizada. | Obrigatório (NOT NULL)                 |
| materia_id       | INTEGER                   | Chave que vincula a sessão à matéria estudada.    | Chave Estrangeira (FK) para materia.id |

### Tabela: meta

**Descrição:** Descreve as metas de estudo a serem alcançadas para uma matéria.

**Atributos:**

| Nome do Atributo | Tipo de Dado (PostgreSQL) | Descrição do Atributo                                    | Restrições                             |
| :--------------- | :------------------------ | :------------------------------------------------------- | :------------------------------------- |
| id               | SERIAL                    | Identificador numérico único, auto-incrementável.        | Chave Primária (PK)                    |
| descricao        | TEXT                      | Descrição clara do objetivo da meta.                     | Obrigatório (NOT NULL)                 |
| prazo            | DATE                      | Data limite para a conclusão da meta.                    | Obrigatório (NOT NULL)                 |
| cumprida         | BOOLEAN                   | Indicador de status (True = cumprida, False = pendente). | Padrão FALSE                           |
| materia_id       | INTEGER                   | Chave que conecta a meta à sua matéria.                  | Chave Estrangeira (FK) para materia.id |

## 2. Descrição dos Relacionamentos

**Curso ↔ Matéria**  
Descrição: Um curso possui uma ou mais matérias.  
Cardinalidade: Um curso pode ter zero ou muitas matérias (0,n), enquanto uma matéria deve pertencer a exatamente um curso (1,1).  
Implementação: Chave estrangeira `curso_id` na tabela `materia` referenciando `id` na tabela `curso`.

**Matéria ↔ Pomodoro**  
Descrição: Uma matéria está vinculada a sessões de estudo pomodoro.  
Cardinalidade: Uma matéria pode ter zero ou muitas sessões pomodoro (0,n), e uma sessão pomodoro deve estar ligada a exatamente uma matéria (1,1).  
Implementação: Chave estrangeira `materia_id` na tabela `pomodoro` referenciando `id` na tabela `materia`.

**Matéria ↔ Meta**  
Descrição: Uma matéria possui metas de estudo.  
Cardinalidade: Uma matéria pode ter zero ou muitas metas (0,n), e uma meta deve pertencer a exatamente uma matéria (1,1).  
Implementação: Chave estrangeira `materia_id` na tabela `meta` referenciando `id` na tabela `materia`.

**Matéria ↔ Assunto**  
Descrição: Uma matéria contém um ou mais assuntos.  
Cardinalidade: Uma matéria pode ter zero ou muitos assuntos (0,n), e um assunto deve pertencer a exatamente uma matéria (1,1).  
Implementação: Chave estrangeira `materia_id` na tabela `assunto` referenciando `id` na tabela `materia`.

**Assunto ↔ Flashcard**  
Descrição: Um assunto possui um ou mais flashcards.  
Cardinalidade: Um assunto pode ter zero ou muitos flashcards (0,n), e um flashcard deve pertencer a exatamente um assunto (1,1).  
Implementação: Chave estrangeira `assunto_id` na tabela `flashcard` referenciando `id` na tabela `assunto`.
