//   ### 2. Exercício 2 (Modelagem PostgreSQL)

 //   *Crie um arquivo chamado `script_banco.sql` contendo o script estruturado de criação das tabelas e os dados iniciais:*

    ```sql
    -- Criação das tabelas
    CREATE TABLE item (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        codigo VARCHAR(50) NOT NULL UNIQUE,
        titulo VARCHAR(150) NOT NULL,
        tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('livro', 'revista')),
        autor VARCHAR(100),
        edicao INT,
        disponivel BOOLEAN NOT NULL DEFAULT TRUE
    );

    CREATE TABLE usuario (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        nome VARCHAR(100) NOT NULL,
        tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('aluno', 'professor')),
        limite_itens INT NOT NULL
    );

    CREATE TABLE emprestimo (
        id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        item_id INT NOT NULL REFERENCES item(id),
        usuario_id INT NOT NULL REFERENCES usuario(id),
        data_retirada DATE NOT NULL DEFAULT CURRENT_DATE,
        data_devolucao_prevista DATE NOT NULL,
        data_devolucao DATE,
        valor_multa NUMERIC(10, 2) DEFAULT 0.00
    );

    -- Dados de teste
    INSERT INTO item (codigo, titulo, tipo, autor, edicao, disponivel) VALUES
    ('L01', 'Clean Code', 'livro', 'Robert C. Martin', 1, FALSE),
    ('L02', 'Arquitetura Limpa', 'livro', 'Robert C. Martin', 1, TRUE),
    ('R01', 'Super Interessante', 'revista', 'Editora Abril', 450, TRUE),
    ('R02', 'National Geographic', 'revista', 'NatGeo', 120, FALSE);

    INSERT INTO usuario (nome, tipo, limite_itens) VALUES
    ('Ana Souza', 'aluno', 3),
    ('Prof. Carlos Mendes', 'professor', 5);

    INSERT INTO emprestimo (item_id, usuario_id, data_retirada, data_devolucao_prevista, data_devolucao, valor_multa) VALUES
    (1, 1, '2026-03-01', '2026-03-15', NULL, 0.00),
    (4, 2, '2026-02-10', '2026-02-17', '2026-02-20', 3.00);

    ```
