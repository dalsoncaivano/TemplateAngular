CREATE DATABASE IF NOT EXISTS fourtalentsacademy;
USE fourtalentsacademy;

/* ******************************************************************************************************

                                          APAGA TODAS AS TABELAS
                                          
   ******************************************************************************************************  */
DROP TABLE IF EXISTS questoes_respostas;
DROP TABLE IF EXISTS questoes;
DROP TABLE IF EXISTS conteudo;
DROP TABLE IF EXISTS respostas;
DROP TABLE IF EXISTS conteudos;
DROP TABLE IF EXISTS capitulos;
DROP TABLE IF EXISTS modulos;
DROP TABLE IF EXISTS cursos;
DROP TABLE IF EXISTS tipos_questoes;
DROP TABLE IF EXISTS tipos_dificuldades;

/* ******************************************************************************************************

                                          CRIACAO DAS TABELAS
                                          
   ******************************************************************************************************  */


/* ****************************************
   * CRIACAO DAS TABELAS (tipos_questoes) *
   ******************************************************************************************************  */
USE fourtalentsacademy;
CREATE TABLE IF NOT EXISTS tipos_questoes
(
	id_Tipo INTEGER,
    descricao VARCHAR(100),/*( (MULTIPLA ESCOLHA(1 RESPOSTA), MULTIPLA ESCOLHA(MAIS DE 1 RESPOSTA), RESPOSTA DISSERTATIVA, NÃO AVALIATIVAS(NOME, EMAIL, TELEFONE, ...)  */
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE tipos_questoes 
ADD CONSTRAINT tipos_questoes_PK PRIMARY KEY CLUSTERED (id_Tipo);

ALTER TABLE tipos_questoes
MODIFY COLUMN id_Tipo INT NOT NULL AUTO_INCREMENT;

/* PRÉ CARGA DE DADOS */
/* ------------------------------------------------- */
INSERT  INTO tipos_questoes(Descricao) 
SELECT 'Múltipla Escolha - 1 resposta correta'
WHERE NOT EXISTS(SELECT 1 FROM tipos_questoes 
WHERE  Descricao = 'Múltipla Escolha - 1 resposta correta') ;

INSERT  INTO tipos_questoes(Descricao) 
SELECT 'Múltipla Escolha - 2 respostas corretas'
WHERE NOT EXISTS(SELECT 1 FROM tipos_questoes 
WHERE  Descricao = 'Múltipla Escolha - 2 respostas corretas') ;

INSERT  INTO tipos_questoes(Descricao) 
SELECT 'Dissertativa'
WHERE NOT EXISTS(SELECT 1 FROM tipos_questoes 
WHERE  Descricao = 'Dissertativa') ;

INSERT  INTO tipos_questoes(Descricao) 
SELECT 'Não avaliativas(nome, email. telefone)'
WHERE NOT EXISTS(SELECT 1 FROM tipos_questoes 
WHERE  Descricao = 'Não avaliativas(nome, email. telefone)') ;

/* ********************************************
   * CRIACAO DAS TABELAS (tipos_dificuldades) *
   ******************************************************************************************************  */
USE fourtalentsacademy;
CREATE TABLE IF NOT EXISTS tipos_dificuldades
	(
    id_Tipo INTEGER,
    descricao VARCHAR(100),/*(  (MUITO FÁCIL, FACIL, MEDIO, DIFICIL, MUITO DIFICIL, DESAFIO)  )*/
    Observacoes VARCHAR(100) DEFAULT '',
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE tipos_dificuldades 
ADD CONSTRAINT tipos_dificuldades_PK PRIMARY KEY CLUSTERED (id_Tipo);

ALTER TABLE tipos_dificuldades
MODIFY COLUMN id_Tipo INT NOT NULL AUTO_INCREMENT;

/* PRÉ CARGA DE DADOS */
/* ------------------------------------------------- */
INSERT  INTO tipos_dificuldades(Descricao, Observacoes) 
SELECT 'Muito fácil',''
WHERE NOT EXISTS(SELECT 1 FROM tipos_dificuldades 
WHERE  Descricao = 'Muito fácil') ;

INSERT  INTO tipos_dificuldades(Descricao, Observacoes) 
SELECT 'Fácil',''
WHERE NOT EXISTS(SELECT 1 FROM tipos_dificuldades 
WHERE  Descricao = 'Fácil') ;

INSERT  INTO tipos_dificuldades(Descricao, Observacoes) 
SELECT 'Médio',''
WHERE NOT EXISTS(SELECT 1 FROM tipos_dificuldades 
WHERE  Descricao = 'Médio') ;

INSERT  INTO tipos_dificuldades(Descricao, Observacoes) 
SELECT 'Difícil',''
WHERE NOT EXISTS(SELECT 1 FROM tipos_dificuldades 
WHERE  Descricao = 'Difícil') ;

INSERT  INTO tipos_dificuldades(Descricao, Observacoes) 
SELECT 'Muito Difícil',''
WHERE NOT EXISTS(SELECT 1 FROM tipos_dificuldades 
WHERE  Descricao = 'Muito Difícil') ;

INSERT  INTO tipos_dificuldades(Descricao, Observacoes) 
SELECT 'Desafio', ''
WHERE NOT EXISTS(SELECT 1 FROM tipos_dificuldades 
WHERE  Descricao = 'Desafio') ;

/* ********************************
   * CRIACAO DAS TABELAS (cursos) *
   ******************************************************************************************************  */
USE fourtalentsacademy;
CREATE TABLE IF NOT EXISTS cursos
(
	idCurso       INTEGER,
	nome          VARCHAR(50),
    descricao     VARCHAR(3000)     DEFAULT '<p style="text-align: justify; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;"><span style="background-color: rgb(255, 255, 0);">Descreva do que se trata o curso. Algo que motive o futuro aluno a querer fazer esse curso.&nbsp;A seguir o conteúdo com Lorem ipsum para você se identificar com a disposição do conteúdo.</span> dolor sit amet, consectetur adipiscing elit. Donec in urna ac neque bibendum ornare. Curabitur purus urna, viverra ornare tincidunt eget, tincidunt quis leo. Quisque finibus viverra eros, nec tempus augue hendrerit vitae. Maecenas non diam arcu. Quisque eget justo suscipit, aliquam urna in, semper enim. Aliquam tincidunt, tellus ac porttitor porttitor, dui erat cursus dolor, at iaculis ligula elit ac nisi. Praesent in dui ac lacus ultrices finibus in et justo. Donec eget purus ac tortor finibus porta. Ut consectetur in felis non ultricies. Sed in odio nec purus maximus condimentum. Integer pharetra mi ut nulla bibendum finibus nec nec eros. Donec pellentesque urna at purus lobortis fringilla. Maecenas porttitor ante quam, et facilisis felis congue a. Donec sodales nunc felis, vitae vestibulum turpis aliquam a.</p><p style="text-align: justify; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;">Suspendisse dui diam, accumsan eu varius ut, iaculis at lectus. Duis at pretium tortor, volutpat ullamcorper turpis. Proin vitae dignissim diam. Fusce a massa consectetur, aliquam nunc vitae, fringilla ipsum. Donec vel pretium justo. Donec vel augue id nulla dignissim porta. Praesent pellentesque auctor ex, sit amet consequat eros egestas ac. Donec id elit vel eros euismod tempus. Proin elementum odio a tellus accumsan ultricies at id libero. Nam elementum pulvinar nibh, in hendrerit dolor ultrices eu. Aliquam erat volutpat. Integer at luctus leo, ut tincidunt nulla. Nulla sit amet turpis eget dui molestie varius ornare sit amet est. Donec laoreet lacus sit amet metus porta facilisis. Ut non est sodales, semper purus quis, sodales magna.</p><p style="text-align: justify; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;">Morbi auctor, orci a feugiat lobortis, eros nunc consectetur orci, nec gravida nisi diam eu risus. Etiam luctus mi nec elit volutpat commodo quis sed lectus. Integer sit amet gravida orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in porttitor leo. Aenean congue elit ac commodo dignissim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed id ornare odio, ac congue justo.</p>',
	img_link       VARCHAR(500)     DEFAULT 'assets/Introdutorias/Imagem_temporaria.png',
    ativo         BIT(1) DEFAULT b'0',
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- select * from cursos;
-- UPDATE cursos SET img_link = 'assets/Introdutorias/Imagem_temporaria.png' where idcurso = 1;
-- UPDATE cursos SET img_link = 'assets/Introdutorias/Imagem_temporaria.png' where idCurso = 1;


ALTER TABLE cursos 
ADD CONSTRAINT cursos_PK PRIMARY KEY CLUSTERED (idCurso);

ALTER TABLE cursos
MODIFY COLUMN idCurso INT NOT NULL AUTO_INCREMENT;

/* *********************************
   * CRIACAO DAS TABELAS (modulos) *
   ******************************************************************************************************  */
USE fourtalentsacademy;
CREATE TABLE IF NOT EXISTS modulos
(
	idModulo       INTEGER,
    nome           VARCHAR(100)   DEFAULT 'Nome do módulo',
    descricao_pag  VARCHAR(3000)  DEFAULT '<p style="text-align: justify; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;"><span style="background-color: rgb(255, 255, 0);">Descreva do que se trata o módulo. Algo que chame atenção do futuro aluno.&nbsp;A seguir o conteúdo com Lorem ipsum para você se identificar com a disposição do conteúdo.</span> dolor sit amet, consectetur adipiscing elit. Donec in urna ac neque bibendum ornare. Curabitur purus urna, viverra ornare tincidunt eget, tincidunt quis leo. Quisque finibus viverra eros, nec tempus augue hendrerit vitae. Maecenas non diam arcu. Quisque eget justo suscipit, aliquam urna in, semper enim. Aliquam tincidunt, tellus ac porttitor porttitor, dui erat cursus dolor, at iaculis ligula elit ac nisi. Praesent in dui ac lacus ultrices finibus in et justo. Donec eget purus ac tortor finibus porta. Ut consectetur in felis non ultricies. Sed in odio nec purus maximus condimentum. Integer pharetra mi ut nulla bibendum finibus nec nec eros. Donec pellentesque urna at purus lobortis fringilla. Maecenas porttitor ante quam, et facilisis felis congue a. Donec sodales nunc felis, vitae vestibulum turpis aliquam a.</p><p style="text-align: justify; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;">Suspendisse dui diam, accumsan eu varius ut, iaculis at lectus. Duis at pretium tortor, volutpat ullamcorper turpis. Proin vitae dignissim diam. Fusce a massa consectetur, aliquam nunc vitae, fringilla ipsum. Donec vel pretium justo. Donec vel augue id nulla dignissim porta. Praesent pellentesque auctor ex, sit amet consequat eros egestas ac. Donec id elit vel eros euismod tempus. Proin elementum odio a tellus accumsan ultricies at id libero. Nam elementum pulvinar nibh, in hendrerit dolor ultrices eu. Aliquam erat volutpat. Integer at luctus leo, ut tincidunt nulla. Nulla sit amet turpis eget dui molestie varius ornare sit amet est. Donec laoreet lacus sit amet metus porta facilisis. Ut non est sodales, semper purus quis, sodales magna.</p><p style="text-align: justify; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;">Morbi auctor, orci a feugiat lobortis, eros nunc consectetur orci, nec gravida nisi diam eu risus. Etiam luctus mi nec elit volutpat commodo quis sed lectus. Integer sit amet gravida orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in porttitor leo. Aenean congue elit ac commodo dignissim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed id ornare odio, ac congue justo.</p>',
    descricao_card VARCHAR(200)    DEFAULT 'Resumo padrão do módulo',
    img_link       VARCHAR(500)   DEFAULT 'assets/Introdutorias/Imagem_temporaria.png',
    ativo          BIT(1) DEFAULT b'0',    
	fkidCurso      INTEGER,
    order_id       INTEGER,
    carga_horaria  DOUBLE,
    data_cadastro  DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- select * from modulos
-- DELETE FROM modulos WHERE idModulo = 4

/* GERA A PK DA TABELA*/
ALTER TABLE modulos 
ADD CONSTRAINT modulos_PK PRIMARY KEY CLUSTERED (idModulo);

ALTER TABLE modulos
MODIFY COLUMN idModulo INT NOT NULL AUTO_INCREMENT;

/* GERA A FK PARA cursos*/
ALTER TABLE modulos 
    ADD CONSTRAINT modulosCurso_FK FOREIGN KEY 
    ( 
     fkidCurso
    ) 
    REFERENCES cursos
    ( 
     idCurso
    );

/* ***********************************
   * CRIACAO DAS TABELAS (capitulos) *
   ******************************************************************************************************  */
USE fourtalentsacademy;
CREATE TABLE IF NOT EXISTS capitulos
(
	idCapitulo INTEGER,
	nome           VARCHAR(50)    DEFAULT 'Nome do capitulo',    
    descricao_card VARCHAR(1000)     DEFAULT 'Resumo padrão do card',
    ativo         BIT(1) DEFAULT b'0',        
    fkidModulo    INTEGER,
    order_id      INTEGER,
    carga_horaria DOUBLE,    
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE capitulos 
ADD CONSTRAINT capitulos_PK PRIMARY KEY CLUSTERED (idCapitulo);

ALTER TABLE capitulos
MODIFY COLUMN idCapitulo INT NOT NULL AUTO_INCREMENT;

ALTER TABLE capitulos 
    ADD CONSTRAINT capitulosmodulos_FK FOREIGN KEY 
    ( 
     fkidModulo
    ) 
    REFERENCES modulos 
    ( 
     idModulo
    );
    
    -- select * from capitulos

/* ***********************************
   * CRIACAO DAS TABELAS (conteudos) *
   ******************************************************************************************************  */
USE fourtalentsacademy;
CREATE TABLE IF NOT EXISTS conteudos (
  idconteudo       INT,
  titulo           VARCHAR(220) NOT NULL,
  descricao        VARCHAR(500) NULL,
  tipo_conteudo    ENUM('video','apostila','anexos','hyperlinks') NULL,
  conteudo_html    MEDIUMTEXT NULL,     -- HTML gerado pelo Summernote
  fkidCapitulo     INTEGER,
  ativo BIT(1)     DEFAULT b'1',
  criado_em        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  atualizado_em    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- select * from conteudos
-- delete from conteudos where idconteudo=null

ALTER TABLE conteudos 
ADD CONSTRAINT conteudo_PK PRIMARY KEY CLUSTERED (idconteudo);

ALTER TABLE conteudos
MODIFY COLUMN idconteudo INT NOT NULL AUTO_INCREMENT;

	ALTER TABLE conteudos 
    ADD CONSTRAINT conteudos_capitulos_FK FOREIGN KEY 
    ( 
     fkidcapitulo
    )
    REFERENCES capitulos
    ( 
          idcapitulo
    );    
    
/* **********************************
   * CRIACAO DAS TABELAS (questoes) *
   ******************************************************************************************************  */
USE fourtalentsacademy;
CREATE TABLE IF NOT EXISTS questoes
	(
    id_Questao INTEGER ,
    descricao VARCHAR(100),/*(1- fourtalentsacademy , 2 - Producao App , 3 - Gamificado, Site , 5 - Padrão )*/
    pontuacao DECIMAL( 4,2), 
   id_Tipo_Questao INTEGER, /*Multipla Escolha, Dissertativa, ...*/ -- FK --> SELECT * FROM tipos_questoes;/
   id_Tipo_Dificuldade INTEGER, /*(FÁCIL, MEDIO, DIFICIL, MUITO DIFICIL, DESAFIO) FK --> SELECT * FROM tipos_dificuldades;*/
   fkidCurso INTEGER,
   fkidModulo INTEGER,
   fkidCapitulo INTEGER,
    ativo BIT(1) DEFAULT b'1',
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE questoes 
ADD CONSTRAINT questoes_PK PRIMARY KEY CLUSTERED (id_Questao);

ALTER TABLE questoes
MODIFY COLUMN id_Questao INT NOT NULL AUTO_INCREMENT;

ALTER TABLE questoes 
    ADD CONSTRAINT tipos_questoes_FK FOREIGN KEY 
    ( 
     id_Tipo_Questao
    ) 
    REFERENCES tipos_questoes 
    ( 
     id_Tipo 
    );
    
ALTER TABLE questoes 
    ADD CONSTRAINT tipos_dificuldades_FK FOREIGN KEY 
    ( 
     id_Tipo_Dificuldade
    )
    REFERENCES tipos_dificuldades 
    ( 
     id_Tipo
    );
    
	ALTER TABLE questoes 
    ADD CONSTRAINT cursos_FK FOREIGN KEY 
    ( 
     fkidCurso
    )
    REFERENCES cursos 
    ( 
     idCurso
    );
    
	ALTER TABLE questoes 
    ADD CONSTRAINT modulos_FK FOREIGN KEY 
    ( 
     fkidModulo
    )
    REFERENCES modulos
    ( 
          idModulo
    );    
    
	ALTER TABLE questoes 
    ADD CONSTRAINT capitulos_FK FOREIGN KEY 
    ( 
     fkidcapitulo
    )
    REFERENCES capitulos
    ( 
          idcapitulo
    );    

/* ***********************************
   * CRIACAO DAS TABELAS (respostas) *
   ******************************************************************************************************  */
USE fourtalentsacademy;
CREATE TABLE IF NOT EXISTS respostas
	(
    id_Resposta INTEGER ,
    descricao VARCHAR(100),/*Texto da resposta*/
   data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE respostas 
ADD CONSTRAINT respostas_PK PRIMARY KEY CLUSTERED (id_Resposta);

ALTER TABLE respostas
MODIFY COLUMN id_Resposta INT NOT NULL AUTO_INCREMENT;

/* PRÉ CARGA DE DADOS */
/* ------------------------------------------------- */
INSERT  INTO respostas(descricao) 
SELECT 'Um conjunto de falhas que ocorrem durante a execução de um programa.'
WHERE NOT EXISTS(SELECT 1 FROM respostas 
WHERE  descricao = 'Um conjunto de falhas que ocorrem durante a execução de um programa.') ;

INSERT  INTO respostas(descricao) 
SELECT 'Um software instalado para melhorar o desempenho do computador.'
WHERE NOT EXISTS(SELECT 1 FROM respostas 
WHERE  descricao = 'Um software instalado para melhorar o desempenho do computador.') ;

INSERT  INTO respostas(descricao) 
SELECT 'Uma linguagem de programação usada para criar sistemas operacionais.'
WHERE NOT EXISTS(SELECT 1 FROM respostas 
WHERE  descricao = 'Uma linguagem de programação usada para criar sistemas operacionais.') ;

INSERT  INTO respostas(descricao) 
SELECT 'Um conjunto de passos lógicos e ordenados para resolver um problema ou executar uma tarefa.'
WHERE NOT EXISTS(SELECT 1 FROM respostas 
WHERE  descricao = 'Um conjunto de passos lógicos e ordenados para resolver um problema ou executar uma tarefa.') ;

INSERT  INTO respostas(descricao) 
SELECT 'Um tipo de hardware responsável por armazenar dados temporários.'
WHERE NOT EXISTS(SELECT 1 FROM respostas 
WHERE  descricao = 'Um tipo de hardware responsável por armazenar dados temporários.') ;

/* ********************************************
   * CRIACAO DAS TABELAS (questoes_respostas) *
   ******************************************************************************************************  */
USE fourtalentsacademy;
CREATE TABLE IF NOT EXISTS questoes_respostas
	(
    id_Questao_Resposta INTEGER ,
    id_Questao INTEGER,
    id_Resposta INTEGER, -- FK
    Resposta_Correta BIT DEFAULT 0, -- FK
    link_Estudo NVARCHAR(4000), /* QUANDO RESPOSTA MARCADA DIFERENTE DA RESPOSTA CORRETA */ 
   data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE questoes_respostas 
ADD CONSTRAINT questoes_respostas_PK PRIMARY KEY CLUSTERED (id_Questao_Resposta);

ALTER TABLE questoes_respostas
MODIFY COLUMN id_Questao_Resposta INT NOT NULL AUTO_INCREMENT;

ALTER TABLE questoes_respostas 
    ADD CONSTRAINT questoes_FK FOREIGN KEY 
    ( 
     id_Questao
    ) 
    REFERENCES questoes 
    ( 
     id_Questao 
    );

ALTER TABLE questoes_respostas
    ADD CONSTRAINT respostas_FK FOREIGN KEY 
    ( 
     id_Resposta
    ) 
    REFERENCES respostas 
    ( 
     id_Resposta
    );

/* ******************************************************************************************************

                                          CONSULTA TODAS AS TABEÇAS
                                          
   ******************************************************************************************************  */
/*

    SELECT * FROM modulos;
    
    
	SELECT * FROM tipos_questoes;
	SELECT * FROM tipos_dificuldades;
    SELECT * FROM cursos;
    SELECT * FROM modulos;
    SELECT * FROM capitulos;
    SELECT * FROM conteudos;
	SELECT * FROM questoes;
    SELECT * FROM respostas;
    SELECT * FROM questoes_respostas;

*/

