CREATE DATABASE IF NOT EXISTS bd1;

USE bd1;
CREATE TABLE tb_string(
   idt_string INT PRIMARY KEY AUTO_INCREMENT,
   vch_string VARCHAR(30) NOT NULL,
   ch_string VARCHAR(10) NOT NULL,
   txt_string TEXT NOT NULL
   );

INSERT INTO tb_string VALUES
(DEFAULT, 'ABCDABCDABCDABCDABCDABCDABCDABCDAB', '0123456789',
'ABCDABCDABCDABCDABCDABCDABCDABCDABCDABabcdabcdabcdabcdabcdabcdabcdabcd'),
(DEFAULT, 'Mysql Server', '8.041',
'Sistema Gerenciador de Banco de Dados MySQL'),
(DEFAULT, 'Postgres SQL', '16.4',
'Sistema Gerenciador de Banco de Dados Postgres SQL');

SELECT * FROM tb_string;

INSERT INTO tb_string VALUES
(DEFAULT, 'ABCDABCDABCDABCDABCDABCDABCDABCDABX', '0123456789',
'ABCDABCDABCDABCDABCDABCDABCDABCDABCDABabcdabcdabcdabcdabcdabcdabcdabcd');

INSERT INTO tb_string VALUES
(DEFAULT, 'ABCDABCDABCDABCDABCDABCDABCDABCDAB', '0123456789X',
'ABCDABCDABCDABCDABCDABCDABCDABCDABCDABabcdabcdabcdabcdabcdabcdabcdabcd');

SELECT vch_string, LENGTH(vch_string) AS qtd_car1,
       ch_string, LENGTH(ch_string) AS qtd_car2
       FROM tb_string;

SELECT vch_string, REPLACE(vch_string, 'A', 'ALFA') AS nova_string1,
       ch_string, REPLACE(ch_string,'0', 'Zero') AS nova_string2
       FROM tb_string;

SELECT vch_string, MID(vch_string, 3, 3) AS nova_string1,
       ch_string, SUBSTR(ch_string, 2, 3) AS nova_string2
       FROM tb_string;

INSERT INTO tb_string VALUES 
  (DEFAULT, 'MySQL Server', '8.041,'
   'Sistema Gerenciador de Banco de Dados MySQL'),
  (DEFAULT, 'MaSQL Server', '8.041,'
   'Sistema Gerenciador de Banco de Dados MySQL');
  
SELECT * FROM tb_string WHERE vch_string LIKE '%MySQL Server%';

SELECT * FROM tb_string WHERE vch_string SOUNDS LIKE 'MySQL Server';
