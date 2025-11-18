ALTER TABLE cursos
ADD COLUMN descricao_card VARCHAR(200)
    NOT NULL
    DEFAULT 'Resumo padrão do curso'
    AFTER nome;