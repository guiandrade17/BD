-- 1. Criação do Banco de Dados
CREATE SCHEMA bd_curso_dis DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- 2. Selecionar o Banco de Dados para Uso
USE bd_curso_dis;

-- 3. Criação da Tabela tb_curso
CREATE TABLE tb_curso (
  idt_curso INT NOT NULL AUTO_INCREMENT,
  nme_curso VARCHAR(100) NOT NULL,
  dta_criacao_curso DATE NOT NULL,
  PRIMARY KEY (idt_curso),
  UNIQUE INDEX nme_curso_UNIQUE (nme_curso ASC) 
);

-- 4. Criação da Tabela tb_dis
CREATE TABLE tb_dis (
  idt_dis INT NOT NULL AUTO_INCREMENT,
  nme_dis VARCHAR(100) NOT NULL,
  num_ch_dis INT NOT NULL,
  PRIMARY KEY (idt_dis),
  UNIQUE INDEX nme_dis_UNIQUE (nme_dis ASC) 
);

-- 5. Criação da Tabela tb_grade (com Chaves Estrangeiras e Chave Primária Composta)
CREATE TABLE tb_grade (
  cod_curso INT NOT NULL,
  cod_dis INT NOT NULL,
  num_semestre_grade INT NOT NULL,
  PRIMARY KEY (cod_curso, cod_dis), -- Chave Primária Composta
  INDEX fk_tb_grade_tb_dis_idx (cod_dis ASC),
  CONSTRAINT fk_tb_grade_tb_curso
    FOREIGN KEY (cod_curso)
    REFERENCES tb_curso (idt_curso)
ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_tb_grade_tb_dis
    FOREIGN KEY (cod_dis)
    REFERENCES tb_dis (idt_dis)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

USE bd_curso_dis;

-- População da tabela tb_curso
INSERT INTO tb_curso (nme_curso, dta_criacao_curso) VALUES
('Ciência da Computação', '2000-08-01'),
('Direito', '1995-02-10'),
('Administração', '1998-05-15'),
('Psicologia', '2005-01-20'),
('Engenharia Civil', '2010-07-01'),
('Arquitetura e Urbanismo', '2008-09-01');

-- População da tabela tb_dis
INSERT INTO tb_dis (nme_dis, num_ch_dis) VALUES
('Algoritmos e Programação', 80),
('Banco de Dados I', 60),
('Direito Civil I', 75),
('Teoria Geral do Estado', 60),
('Marketing Digital', 60),
('Contabilidade Geral', 75),
('Psicologia do Desenvolvimento', 70),
('Neurociências e Comportamento', 60),
('Cálculo Diferencial e Integral I', 90),
('Desenho Técnico', 60),
('Ética Profissional', 30),
('Comunicação Empresarial', 45);

-- População da tabela tb_grade (associando cursos e disciplinas por semestre)

-- Curso: Ciência da Computação (ID 1)
INSERT INTO tb_grade (cod_curso, cod_dis, num_semestre_grade) VALUES
(1, 1, 1), -- Algoritmos e Programação no 1º semestre
(1, 2, 3), -- Banco de Dados I no 3º semestre
(1, 9, 2), -- Cálculo Diferencial e Integral I no 2º semestre
(1, 11, 1); -- Ética Profissional no 1º semestre

-- Curso: Direito (ID 2)
INSERT INTO tb_grade (cod_curso, cod_dis, num_semestre_grade) VALUES
(2, 3, 1), -- Direito Civil I no 1º semestre
(2, 4, 1), -- Teoria Geral do Estado no 1º semestre
(2, 11, 2); -- Ética Profissional no 2º semestre

-- Curso: Administração (ID 3)
INSERT INTO tb_grade (cod_curso, cod_dis, num_semestre_grade) VALUES
(3, 5, 3), -- Marketing Digital no 3º semestre
(3, 6, 1), -- Contabilidade Geral no 1º semestre
(3, 11, 2), -- Ética Profissional no 2º semestre
(3, 12, 1); -- Comunicação Empresarial no 1º semestre

-- Curso: Psicologia (ID 4)
INSERT INTO tb_grade (cod_curso, cod_dis, num_semestre_grade) VALUES
(4, 7, 1), -- Psicologia do Desenvolvimento no 1º semestre
(4, 8, 3), -- Neurociências e Comportamento no 3º semestre
(4, 11, 1); -- Ética Profissional no 1º semestre

-- Curso: Engenharia Civil (ID 5)
INSERT INTO tb_grade (cod_curso, cod_dis, num_semestre_grade) VALUES
(5, 9, 1), -- Cálculo Diferencial e Integral I no 1º semestre
(5, 10, 1), -- Desenho Técnico no 1º semestre
(5, 11, 2); -- Ética Profissional no 2º semestre

-- Curso: Arquitetura e Urbanismo (ID 6)
INSERT INTO tb_grade (cod_curso, cod_dis, num_semestre_grade) VALUES
(6, 9, 1), -- Cálculo Diferencial e Integral I no 1º semestre
(6, 10, 1), -- Desenho Técnico no 1º semestre
(6, 11, 2); -- Ética Profissional no 2º semestre

SELECT
    nme_curso,
    dta_criacao_curso
FROM
    tb_curso;

SELECT
    nme_dis,
    num_ch_dis
FROM
    tb_dis;

SELECT
    TC.nme_curso,
    TD.nme_dis,
    TG.num_semestre_grade
FROM
    tb_curso AS TC
JOIN
    tb_grade AS TG ON TC.idt_curso = TG.cod_curso
JOIN
    tb_dis AS TD ON TG.cod_dis = TD.idt_dis
WHERE
    TC.nme_curso = 'Ciência da Computação'
ORDER BY
    TG.num_semestre_grade, TD.nme_dis;

SELECT
    TD.nme_dis,
    TC_EngCivil.nme_curso AS Curso_EngenhariaCivil,
    TG_EngCivil.num_semestre_grade AS Semestre_EngenhariaCivil,
    TC_ArqUrb.nme_curso AS Curso_ArquiteturaUrbanismo,
    TG_ArqUrb.num_semestre_grade AS Semestre_ArquiteturaUrbanismo
FROM
    tb_dis AS TD
JOIN
    tb_grade AS TG_EngCivil ON TD.idt_dis = TG_EngCivil.cod_dis
JOIN
    tb_curso AS TC_EngCivil ON TG_EngCivil.cod_curso = TC_EngCivil.idt_curso
JOIN
    tb_grade AS TG_ArqUrb ON TD.idt_dis = TG_ArqUrb.cod_dis
JOIN
    tb_curso AS TC_ArqUrb ON TG_ArqUrb.cod_curso = TC_ArqUrb.idt_curso
WHERE
    TC_EngCivil.nme_curso = 'Engenharia Civil'
AND
    TC_ArqUrb.nme_curso = 'Arquitetura e Urbanismo'
AND
    TD.nme_dis IN (
        SELECT TD_sub.nme_dis
        FROM tb_dis AS TD_sub
        JOIN tb_grade AS TG_sub ON TD_sub.idt_dis = TG_sub.cod_dis
        JOIN tb_curso AS TC_sub ON TG_sub.cod_curso = TC_sub.idt_curso
        WHERE TC_sub.nme_curso = 'Engenharia Civil'
        INTERSECT
        SELECT TD_sub.nme_dis
        FROM tb_dis AS TD_sub
        JOIN tb_grade AS TG_sub ON TD_sub.idt_dis = TG_sub.cod_dis
        JOIN tb_curso AS TC_sub ON TG_sub.cod_curso = TC_sub.idt_curso
        WHERE TC_sub.nme_curso = 'Arquitetura e Urbanismo'
    )
ORDER BY TD.nme_dis;

SELECT
    TC.nme_curso,
    COUNT(TG.cod_dis) AS total_disciplinas
FROM
    tb_curso AS TC
LEFT JOIN
    tb_grade AS TG ON TC.idt_curso = TG.cod_curso
GROUP BY
    TC.nme_curso
ORDER BY
    TC.nme_curso;
