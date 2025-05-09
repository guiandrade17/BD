USE minha_agenda;

CREATE TABLE agenda(
   numero INT PRIMARY KEY AUTO_INCREMENT,
   atividade VARCHAR(50),
   data_atividade DATE,
   hora_atividade TIME);

SELECT * FROM agenda;

INSERT INTO agenda(atividade, data_atividade, hora_atividade) VALUES ('Banco de Dados-I', '2024-08-05', '19:10');
INSERT INTO agenda(atividade, data_atividade, hora_atividade) VALUES ('Pensamento Computacional', '2024-08-09','19:10');

UPDATE agenda SET data_atividade + '2024-08-10', hora_atividade = '10:00' WHERE numero = 2;

DELETE FROM agenda WHERE numero = 2;
