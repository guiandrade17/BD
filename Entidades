DROP DATABASE IF EXISTS db_dib;

CREATE DATABASE db_dib;

USE db_dib;

DROP TABLE IF EXISTS tb_livro;

CREATE TABLE tb_livro(
  isbn CHAR(17) NOT NULL PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  ano_pub YEAR NOT NULL,
  genero ENUM('Narrativo', 'Lírico', 'Dramático', 'Histórico', 'Outros') NOT NULL);
  
INSERT INTO tb_livro VALUES 
   ('978-6555320350', 'A hora da estrela', 2020, 'Lírico'),
   ('978-6550971298', 'Vidas secas', 2024, 'Dramático'),
   ('978-6550970390', 'Os sertões', 2020, 'Narrativo');

SELECT * FROM tb_livro;

SELECT * FROM tb_livro ORDER BY titulo;

SELECT UPPER(titulo) AS tit_maiusculo FROM tb_livro

SELECT * FROM tb_livro WHERE isbn = '978-6550971298'
