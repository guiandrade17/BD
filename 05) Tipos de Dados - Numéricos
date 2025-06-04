CREATE DATABASE IF NOT EXISTS bd1;

USE bd1;

CREATE TABLE tb_numero(
   idt_numero INT PRIMARY KEY AUTO_INCREMENT,
   int_pequeno TINYINT,
   int_normal INT,
   real_normal FLOAT,
   real_grande DOUBLE,
   real_personalizado DECIMAL(8,2)
   );
  
INSERT INTO tb_numero VALUES 
   (DEFAULT, 127, 2147483647,
   1.123456,
   3.123456789012345,
   999999.99);
  
SELECT * FROM tb_numero;

INSERT INTO tb_numero VALUES 
  (DEFAULT, -128, -2147483648,
  1.1234569,
  3.1234567890123459,
  -999999.99);
  
SELECT * FROM tb_numero;

INSERT INTO tb_numero VALUES 
   (DEFAULT, -129, -2147483648,
   1.1234569,
   3.1234567890123459,
   -999999.99);
  
INSERT INTO tb_numero VALUES 
   (DEFAULT, -128, -2147483649,
   1.1234569,
   3.1234567890123459,
   -999999.99);
 
INSERT INTO tb_numero VALUES 
   (DEFAULT, -128, -2147483648,
   1.1234569,
   3.1234567890123459,
   -999999.99);
  
SELECT * FROM tb_numero;

INSERT INTO tb_numero VALUES 
  (DEFAULT, 114, 256,
  3.1415,
  1000.123456789,
  10800.50);
  
SELECT * FROM tb_numero;

SELECT int_pequeno, ABS(int_pequeno) AS abs_int_pequeno,
       IF(MOD(int_pequeno, 2) = 0, 'É par', 'É impar') AS tipo_int_pequeno,
       int_normal, ABS(int_normal) AS abs_int_normal,
       IF(MOD(int_normal, 2) = 0, 'É par', 'É impar') AS tipo_int_normal
       FROM tb_numero;

SELECT * FROM tb_numero;

SELECT real_normal, ROUND(real_normal) AS valor_inteiro,
       real_grande, TRUNCATE(real_grande, 3) AS tres_decimais
       FROM tb_numero;

SELECT * FROM tb_numero;

SELECT real_personalizado,
       CONCAT('R$ ', FORMAT(real_personalizado, 2, 'pt_BR')) AS moeda_brasil,
       CONCAT('R$ ', FORMAT(real_personalizado, 2, 'de_DE')) AS moeda_brasil_alternativo,
       CONCAT('€ '), FORMAT(real_personalizado, 2, 'de_DE')) AS moeda_euro,
       CONCAT('¥ '), FORMAT(real_personalizado, 2, 'ja_JP')) AS moeda_japao
       FROM tb_numero;
