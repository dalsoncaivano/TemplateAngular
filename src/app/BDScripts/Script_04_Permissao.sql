-- RENOMEAR TODAS TABELAS E CAMPOS EM PORTUGUES <<< 
-- VINCULAR TUDO A CURSOS(ONDE ESTÁ COURSE)
-- ============================================================
-- SCHEMA: Access & Identity Management + Training Assignment
-- ============================================================
/*drop database access_training_db;*/

CREATE DATABASE IF NOT EXISTS access_training_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE fourtalentsacademy;

-- ============================================================
-- TABELA: ROLES
-- ============================================================
CREATE TABLE IF NOT EXISTS regras (
    idRegra BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    drescricao VARCHAR(255)
) ENGINE=InnoDB COMMENT='Papéis (roles) que agrupam permissões de acesso.';

-- ============================================================
-- TABELA: PERMISSIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS permissoes (
    idPermissao BIGINT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(255)
) ENGINE=InnoDB COMMENT='Permissões individuais atribuíveis a roles.';

-- ============================================================
-- TABELA: ROLE_PERMISSIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS regras_permissoes (
    idRegra BIGINT NOT NULL,
    idPermissao BIGINT NOT NULL,
    PRIMARY KEY (idRegra, idPermissao),
    CONSTRAINT fk_regra_perm_regra FOREIGN KEY (idRegra)
        REFERENCES regras (idRegra) ON DELETE CASCADE,
    CONSTRAINT fk_regra_perm_perm FOREIGN KEY (idPermissao)
        REFERENCES Permissoes (idPermissao) ON DELETE CASCADE
) ENGINE=InnoDB COMMENT='Associa permissões a papéis (roles).';

-- ============================================================
-- TABELA: USER_TYPES
-- ============================================================
CREATE TABLE IF NOT EXISTS tiposUsuarios (
    idTipousuario BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(255),
    idRegra BIGINT NOT NULL,
    CONSTRAINT fk_tipousuario_regra FOREIGN KEY (idRegra)
        REFERENCES regras (idRegra)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='Define tipos de usuário e o papel padrão associado.';

-- ============================================================
-- TABELA: Departamentos
-- ============================================================
CREATE TABLE IF NOT EXISTS departamentos (
    idDepartamento BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL UNIQUE,
    descricao VARCHAR(255)
) ENGINE=InnoDB COMMENT='Departamentos organizacionais.';

-- ============================================================
-- TABELA: positions
-- ============================================================
CREATE TABLE IF NOT EXISTS cargos (
    idCargo BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL UNIQUE,
    descricao VARCHAR(255)
) ENGINE=InnoDB COMMENT='positions/funções ocupadas por usuários.';

-- ============================================================
-- TABELA: usuarios
-- ============================================================
CREATE TABLE IF NOT EXISTS usuarios (
    idUsuario BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha_criptografada VARCHAR(255) NOT NULL,
    idCargo BIGINT,
    idDepartamento BIGINT,
    idTipousuario BIGINT NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    dataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_cargo FOREIGN KEY (idCargo)
        REFERENCES cargos (idCargo) ON DELETE SET NULL,
    CONSTRAINT fk_usuario_dept FOREIGN KEY (idDepartamento)
        REFERENCES departamentos (idDepartamento) ON DELETE SET NULL,
    CONSTRAINT fk_tipoUsuario FOREIGN KEY (idTipoUsuario)
        REFERENCES tiposUsuarios (idTipousuario) ON DELETE RESTRICT
) ENGINE=InnoDB COMMENT='Usuários com vínculo a cargo, departamento e tipo.';

/* select * from usuarios;*/
-- ============================================================
-- TABELA: COURSES
-- ============================================================
/*
DROP TABLE courses ;
CREATE TABLE courses (
    course_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    duration_hours INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB COMMENT='Cursos disponíveis para usuários, positions, departamentos.';
*/
/* ********************************
   * CRIACAO DAS TABELAS (cursos) *
   ******************************************************************************************************  */
/*
USE fourtalentsacademy;
CREATE TABLE IF NOT EXISTS cursos
(
	idCurso       INTEGER,
	nome          VARCHAR(50),
	descricao_card VARCHAR(200) 	NOT NULL DEFAULT 'Resumo padrão do curso',
    descricao     VARCHAR(3000)     DEFAULT '<p style="text-align: justify; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;"><span style="background-color: rgb(255, 255, 0);">Descreva do que se trata o curso. Algo que motive o futuro aluno a querer fazer esse curso.&nbsp;A seguir o conteúdo com Lorem ipsum para você se identificar com a disposição do conteúdo.</span> dolor sit amet, consectetur adipiscing elit. Donec in urna ac neque bibendum ornare. Curabitur purus urna, viverra ornare tincidunt eget, tincidunt quis leo. Quisque finibus viverra eros, nec tempus augue hendrerit vitae. Maecenas non diam arcu. Quisque eget justo suscipit, aliquam urna in, semper enim. Aliquam tincidunt, tellus ac porttitor porttitor, dui erat cursus dolor, at iaculis ligula elit ac nisi. Praesent in dui ac lacus ultrices finibus in et justo. Donec eget purus ac tortor finibus porta. Ut consectetur in felis non ultricies. Sed in odio nec purus maximus condimentum. Integer pharetra mi ut nulla bibendum finibus nec nec eros. Donec pellentesque urna at purus lobortis fringilla. Maecenas porttitor ante quam, et facilisis felis congue a. Donec sodales nunc felis, vitae vestibulum turpis aliquam a.</p><p style="text-align: justify; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;">Suspendisse dui diam, accumsan eu varius ut, iaculis at lectus. Duis at pretium tortor, volutpat ullamcorper turpis. Proin vitae dignissim diam. Fusce a massa consectetur, aliquam nunc vitae, fringilla ipsum. Donec vel pretium justo. Donec vel augue id nulla dignissim porta. Praesent pellentesque auctor ex, sit amet consequat eros egestas ac. Donec id elit vel eros euismod tempus. Proin elementum odio a tellus accumsan ultricies at id libero. Nam elementum pulvinar nibh, in hendrerit dolor ultrices eu. Aliquam erat volutpat. Integer at luctus leo, ut tincidunt nulla. Nulla sit amet turpis eget dui molestie varius ornare sit amet est. Donec laoreet lacus sit amet metus porta facilisis. Ut non est sodales, semper purus quis, sodales magna.</p><p style="text-align: justify; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;">Morbi auctor, orci a feugiat lobortis, eros nunc consectetur orci, nec gravida nisi diam eu risus. Etiam luctus mi nec elit volutpat commodo quis sed lectus. Integer sit amet gravida orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in porttitor leo. Aenean congue elit ac commodo dignissim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed id ornare odio, ac congue justo.</p>',
	img_link       VARCHAR(500)     DEFAULT 'assets/Introdutorias/Imagem_temporaria.png',
    ativo         BIT(1) DEFAULT b'0',
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);
*/

-- select * from cursos;
-- UPDATE cursos SET img_link = 'assets/Introdutorias/Imagem_temporaria.png' where idcurso = 1;
-- UPDATE cursos SET img_link = 'assets/Introdutorias/Imagem_temporaria.png' where idCurso = 1;

/*ALTER TABLE cursos ADD CONSTRAINT cursos_PK PRIMARY KEY CLUSTERED (idCurso);*/
/*use fourtalentsacademy;*/
/*ALTER TABLE cursos MODIFY COLUMN idCurso INT NOT NULL AUTO_INCREMENT;*/

/*select * from cursos;*/
-- ============================================================
-- TABELA: COURSE_ASSIGNMENTS
-- ============================================================
/*DROP TABLE cursosAssociados; */
CREATE TABLE IF NOT EXISTS cursosAssociados (
    idAssociacao BIGINT AUTO_INCREMENT PRIMARY KEY,
    idCurso INT NOT NULL,
    idUsuario BIGINT NOT NULL,
    /*department_id BIGINT NULL,
    user_type_id BIGINT NULL,
    cargo_id BIGINT NULL,*/
    associadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_curso_assoc FOREIGN KEY (idCurso)
        REFERENCES cursos (idCurso) ON DELETE CASCADE,
	CONSTRAINT fk_usuario_assoc FOREIGN KEY (idUsuario)
        REFERENCES usuarios(idUsuario) ON DELETE CASCADE
 /*   CONSTRAINT fk_assignment_department FOREIGN KEY (department_id)
        REFERENCES departments (department_id) ON DELETE CASCADE,*/
 /*   CONSTRAINT fk_assignment_cargo FOREIGN KEY (cargo_id)
        REFERENCES positions (cargo_id) ON DELETE CASCADE,*/
/*    CONSTRAINT chk_only_one_target CHECK (
        (department_id IS NOT NULL AND cargo_id IS NULL) OR
        (department_id IS NULL AND user_type_id IS NOT NULL AND cargo_id IS NULL) OR
        (department_id IS NULL AND user_type_id IS NULL AND cargo_id IS NOT NULL)
    )*/
) ENGINE=InnoDB COMMENT='Associa cursos a usuários. ';
