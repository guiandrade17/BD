DROP DATABASE IF EXISTS db_loja;

CREATE DATABASE db_loja;

USE db_loja;

DROP TABLE IF EXISTS tb_produto;

CREATE TABLE tb_produto(
   cod_barra CHAR(13) NOT NULL PRIMARY KEY,
   nme_produto VARCHAR(50) NOT NULL,
   vlr_produto DECIMAL(8,2) NOT NULL,
   qtd_produto INT NOT NULL); 

INSERT INTO tb_produto VALUES 
   ('1234567890123', 'Galaxy Book 4 360', 4799, 10),
   ('2345678901234', 'Galaxy Tab S9 FE', 3199, 15),
   ('3456789012345', 'Galaxy Tab S6', 1916.09, 20),
   ('4567890123456', 'Monitor Samsung T350', 569.01, 5);
 
SELECT * FROM tb_produto;

SELECT * FROM tb_produto ORDER BY vlr_produto DESC;

SELECT UPPER(nme_produto) AS produto, CONCAT('R$ ', vlr_produto) as preco FROM tb_produto;

SELECT * FROM tb_produto WHERE nme_produto LIKE '%Tab%';

SELECT nme_produto, vlr_produto, qtd_produto, (vlr_produto * qtd_produto) AS total FROM tb_produto;

SELECT nme_produto, vlr_produto,
       IF(vlr_produto > 2000, 'Muito Caro', 'Só Caro') AS avaliacao FROM tb_produto;
