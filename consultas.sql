//    ### 3. Exercício 3 (Consultas SQL)

 //   *Crie um arquivo chamado `consultas.sql` contendo os comandos solicitados:*

    ```sql
    -- 1. Listar todo o acervo com código, título, tipo e disponibilidade
    SELECT codigo, titulo, tipo, disponivel FROM item;

    -- 2. Listar empréstimos em aberto com nome do usuário e título do item
    SELECT e.id, u.nome AS usuario, i.titulo AS item, e.data_retirada 
    FROM emprestimo e
    JOIN usuario u ON e.usuario_id = u.id
    JOIN item i ON e.item_id = i.id
    WHERE e.data_devolucao IS NULL;

    -- 3. Calcular o total de multas acumuladas por usuário
    SELECT u.nome AS usuario, SUM(e.valor_multa) AS total_multas
    FROM emprestimo e
    JOIN usuario u ON e.usuario_id = u.id
    GROUP BY u.id, u.nome;

    -- 4. Listar os itens que nunca foram emprestados
    SELECT i.id, i.codigo, i.titulo 
    FROM item i
    LEFT JOIN emprestimo e ON i.id = e.item_id
    WHERE e.id IS NULL;

    ```
