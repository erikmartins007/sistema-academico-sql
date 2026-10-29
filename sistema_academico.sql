
-- PROJETO: SISTEMA ACADEMICO
-- Disciplina: Banco de Dados
-- Curso: Sistemas de Informacao
-- Banco de dados: MySQL

-- =====================================
-- 1. CRIACAO DAS TABELAS
-- =====================================

CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(50),
    campus VARCHAR(50)
);

CREATE TABLE docente (
    id_docente INT PRIMARY KEY,
    nome_docente VARCHAR(50),
    titulacao VARCHAR(50),
    email VARCHAR(50),
    id_departamento INT,

    FOREIGN KEY (id_departamento)
        REFERENCES departamento(id_departamento)
);

CREATE TABLE disciplina (
    id_disciplina INT PRIMARY KEY,
    nome_disciplina VARCHAR(50),
    carga_horaria INT,
    id_departamento INT,

    FOREIGN KEY (id_departamento)
        REFERENCES departamento(id_departamento)
);

CREATE TABLE oferta_disciplina (
    id_oferta INT PRIMARY KEY,
    id_disciplina INT,
    semestre INT,
    ano_letivo INT,

    FOREIGN KEY (id_disciplina)
        REFERENCES disciplina(id_disciplina)
);

CREATE TABLE ministra (
    id_docente INT,
    id_oferta INT,
    funcao_docente VARCHAR(50),

    PRIMARY KEY (id_docente, id_oferta),

    FOREIGN KEY (id_docente)
        REFERENCES docente(id_docente),

    FOREIGN KEY (id_oferta)
        REFERENCES oferta_disciplina(id_oferta)
);

-- =====================================
-- 2. INSERCAO DOS DEPARTAMENTOS
-- =====================================

INSERT INTO departamento
(id_departamento, nome_departamento, campus)
VALUES
(1, 'Computacao', 'Brasilia'),
(2, 'Matematica', 'Brasilia'),
(3, 'Administracao', 'Taguatinga'),
(4, 'Direito', 'Ceilandia'),
(5, 'Engenharia', 'Gama'),
(6, 'Contabilidade', 'Brasilia'),
(7, 'Enfermagem', 'Taguatinga'),
(8, 'Psicologia', 'Ceilandia'),
(9, 'Pedagogia', 'Planaltina'),
(10, 'Economia', 'Brasilia');

-- =====================================
-- 3. INSERCAO DOS DOCENTES
-- =====================================

INSERT INTO docente
(id_docente, nome_docente, titulacao, email, id_departamento)
VALUES
(1, 'Carlos Silva', 'Mestre', 'carlos@universidade.com', 1),
(2, 'Ana Souza', 'Doutora', 'ana@universidade.com', 2),
(3, 'Pedro Lima', 'Mestre', 'pedro@universidade.com', 3),
(4, 'Mariana Costa', 'Doutora', 'mariana@universidade.com', 4),
(5, 'Rafael Santos', 'Mestre', 'rafael@universidade.com', 5),
(6, 'Juliana Rocha', 'Doutora', 'juliana@universidade.com', 6),
(7, 'Bruno Alves', 'Mestre', 'bruno@universidade.com', 7),
(8, 'Fernanda Dias', 'Doutora', 'fernanda@universidade.com', 8),
(9, 'Ricardo Gomes', 'Mestre', 'ricardo@universidade.com', 9),
(10, 'Camila Martins', 'Doutora', 'camila@universidade.com', 10);

-- =====================================
-- 4. INSERCAO DAS DISCIPLINAS
-- =====================================

INSERT INTO disciplina
(id_disciplina, nome_disciplina, carga_horaria, id_departamento)
VALUES
(1, 'Banco de Dados', 80, 1),
(2, 'Calculo I', 80, 2),
(3, 'Gestao Empresarial', 60, 3),
(4, 'Direito Civil', 80, 4),
(5, 'Fisica Aplicada', 60, 5),
(6, 'Contabilidade Geral', 80, 6),
(7, 'Anatomia Humana', 80, 7),
(8, 'Psicologia Social', 60, 8),
(9, 'Didatica', 60, 9),
(10, 'Microeconomia', 80, 10);

-- =====================================
-- 5. INSERCAO DAS OFERTAS
-- =====================================

INSERT INTO oferta_disciplina
(id_oferta, id_disciplina, semestre, ano_letivo)
VALUES
(1, 1, 1, 2026),
(2, 2, 1, 2026),
(3, 3, 2, 2026),
(4, 4, 1, 2026),
(5, 5, 2, 2026),
(6, 6, 1, 2026),
(7, 7, 2, 2026),
(8, 8, 1, 2026),
(9, 9, 2, 2026),
(10, 10, 1, 2026);

-- =====================================
-- 6. RELACIONAMENTO DOCENTE E OFERTA
-- =====================================

INSERT INTO ministra
(id_docente, id_oferta, funcao_docente)
VALUES
(1, 1, 'Titular'),
(2, 2, 'Titular'),
(3, 3, 'Substituto'),
(4, 4, 'Titular'),
(5, 5, 'Titular'),
(6, 6, 'Substituto'),
(7, 7, 'Titular'),
(8, 8, 'Titular'),
(9, 9, 'Substituto'),
(10, 10, 'Titular');

-- =====================================
-- 7. VERIFICACAO DAS TABELAS
-- =====================================

DESC departamento;
DESC docente;
DESC disciplina;
DESC oferta_disciplina;
DESC ministra;

-- =====================================
-- 8. CONSULTA COM INNER JOIN
-- =====================================

SELECT
    docente.nome_docente,
    departamento.nome_departamento,
    ministra.funcao_docente,
    oferta_disciplina.semestre,
    oferta_disciplina.ano_letivo,
    disciplina.nome_disciplina,
    disciplina.carga_horaria,
    docente.titulacao,
    docente.email,
    departamento.campus

FROM ministra

INNER JOIN docente
    ON ministra.id_docente = docente.id_docente

INNER JOIN departamento
    ON docente.id_departamento = departamento.id_departamento

INNER JOIN oferta_disciplina
    ON ministra.id_oferta = oferta_disciplina.id_oferta

INNER JOIN disciplina
    ON oferta_disciplina.id_disciplina = disciplina.id_disciplina;
