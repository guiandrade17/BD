CREATE DATABASE IF NOT EXISTS bd1;

USE bd1;

CREATE TABLE tb_estado(
   idt_estado INT AUTO_INCREMENT PRIMARY KEY,
   sgl_estado CHAR(2) NOT NULL UNIQUE KEY,
   nme_estado VARCHAR(50) NOT NULL UNIQUE KEY);

CREATE TABLE tb_municipio(
   idt_municipio INT AUTO_INCREMENT PRIMARY KEY,
   nme_municipio VARCHAR(50) NOT NULL,
   num_mq_municipio LONG NOT NULL,
   num_pop_municipio INT NOT NULL,
   cod_estado INT,
   CONSTRAINT fk_estado_municipio
     FOREIGN KEY (cod_estado)
     REFERENCES tb_estado(idt_estado),
   CONSTRAINT uq_municipio
	UNIQUE KEY (cod_estado, nme_municipio)
 );

INSERT INTO tb_estado VALUES
  (DEFAULT, 'GO', 'Goiás'),
  (DEFAULT, 'RJ', 'Rio de Janeiro'),
  (DEFAULT, 'BA', 'Bahia'),
  (DEFAULT, 'AL', 'Alagoas');
  
INSERT INTO tb_municipio VALUES
  (DEFAULT, 'Aparecida de Goiânia', 279954000, 527796, 1),
  (DEFAULT, 'Águas Lindas de Goiás', 191817000, 225693, 1),
  (DEFAULT, 'Anápolis', 935672000, 398869, 1),
  (DEFAULT, 'Duque de Caxias', 467319000, 808161, 2),
  (DEFAULT, 'Petrópolis', 791144000, 278881, 2),
  (DEFAULT, 'Feira de Santana', 1304425000, 616727, 3),
  (DEFAULT, 'Barreiras', 8051274000, 159734, 3);
  
SELECT * FROM tb_estado;

SELECT * FROM tb_municipio;

SELECT nme_estado, nme_municipio
  FROM tb_estado JOIN tb_municipio ON idt_estado = cod_estado;
  
SELECT sgl_estado, nme_estado, COUNT(idt_municipio) AS quantidade
  FROM tb_estado JOIN tb_municipio ON idt_estado = cod_estado
  GROUP BY sgl_estado, nme_estado;
  
SELECT sgl_estado, nme_estado, AVG(num_pop_municipio) AS media_populacional
  FROM tb_estado JOIN tb_municipio ON idt_estado = cod_estado
  GROUP BY sgl_estado, nme_estado;
