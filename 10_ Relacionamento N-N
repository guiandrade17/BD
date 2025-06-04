CREATE DATABASE IF NOT EXISTS atividades;

USE atividades;

CREATE TABLE tb_hobby(
   idt_hobby INT AUTO_INCREMENT PRIMARY KEY,
   nme_hobby VARCHAR(50) NOT NULL,
   CONSTRAINT uq_hobby UNIQUE KEY (nme_hobby)
   );

CREATE TABLE tb_pessoa(
   idt_pessoa INT AUTO_INCREMENT PRIMARY KEY,
   nme_pessoa VARCHAR(50) NOT NULL,
   CONSTRAINT uq_pessoa UNIQUE KEY (nme_pessoa)
   
CREATE TABLE tb_atividade(
   cod_hobby INT NOT NULL,
   cod_pessoa INT NOT NULL,
   tmp_atividade TIME NOT NULL,
   num_frequencia_atividade TINYINT NOT NULL,
   CONSTRAINT pk_atividade PRIMARY KEY (cod_hobby, cod_pessoa),
   CONSTRAINT fk_hobby_atividade FOREIGN KEY (cod_hobby)
     REFERENCES tb_hobby(idt_hobby),
   CONSTRAINT fk_pessoa_atividade FOREIGN KEY (cod_pessoa)
     REFERENCES tb_pessoa(idt_pessoa)
   );
   
INSERT INTO tb_pessoa (nme_pessoa) VALUES 
('Ana Silva'),
('Bruno Oliveira'),
('Carla Rodrigues'),
('Daniel Santos');

INSERT INTO tb_hobby (nme_hobby) VALUES
('Leitura'),
('Esportes'),
('Música'),
('Jogos'),
('Culinária'),
('Viagens');

INSERT INTO tb_atividades (cod_hobby, cod_pessoa, tmp_atividade, num_frequencia_atividade) VALUES
(1, 1, '02:00:00', 3), -- Ana lê por 2 horas, 3 vezes por semana
(2, 1, '01:30:00', 2), -- Ana pratica esportes por 1 hora e meia, 2 vezes por semana
(3, 2, '03:00:00', 1), -- Bruno toca música por 3 horas, 1 vez por semana
(4, 2, '02:30:00', 4), -- Bruno joga por 2 horas e meia, 4 vezes por semana
(5, 3, '01:00:00', 5), -- Carla cozinha por 1 hora, 5 vezes por semana
(6, 3, '04:00:00', 1), -- Carla viaja por 4 horas, 1 vez por semana
(1, 4, '01:30:00', 2), -- Daniel lê por 1 hora e meia, 2 vezes por semana
(2, 4, '02:00:00', 3), -- Daniel pratica esportes por 2 horas, 3 vezes por semana
(3, 1, '01:00:00', 2), -- Ana toca música por 1 hora, 2 vezes por semana
(4, 3, '01:30:00', 3), -- Carla joga por 1 hora e meia, 3 vezes por semana
(5, 2, '02:00:00', 1), -- Bruno cozinha por 2 horas, 1 vez por semana
(6, 4, '03:00:00', 2); -- Daniel viaja por 3 horas, 2 vezes por semana

SELECT nme_pessoa, nme_hobby
  FROM tb_pessoa JOIN tb_atividade ON idt_pessoa = cod_pessoa
    JOIN tb_hobby ON idt_hobby = cod_hobby
  ORDER BY nme_pessoa, nme_hobby;  
  
 SELECT nme_pessoa, nme_hobby
  FROM tb_pessoa JOIN tb_atividade ON idt_pessoa = cod_pessoa
    JOIN tb_hobby ON idt_hobby = cod_hobby
  GROUP BY nme_pessoa;
