DROP DATABASE IF EXISTS bd_tarefas;

CREATE DATABASE bd_tarefas;

USE bd_tarefas;

DROP TABLE IF EXISTS tb_tarefa;

CREATE TABLE tb_tarefa(
   idt_tarefa INT AUTO_INCREMENT PRIMARY KEY,
   nme_tarefa VARCHAR(60) NOT NULL,
   dsc_tarefa TEXT NULL,
   dti_ini_tarefa DATETIME NOT NULL,
   dti_fim_tarefa DATETIME NOT NULL);
   
   INSERT INTO tb_tarefa VALUES 
      (DEFAULT, 'Estudar funções DATE/TIME de MySQL', null, '2024-08-20 10:00', '2024-08-20 12:00'),
      (DEFAULT, 'Estudar funções TEXTO de MySQL', null, '2024-08-21 14:00', '2024-08-21 16:30'),
      (DEFAULT, 'Revisar materia de BD-I', 'Revisar as aulas 1, 2 e 3 de Banco de Dados-I', '2024-08-23 08:00', '2024-08-23 11:45');
      
      SELECT * FROM tb_tarefa;
      
      SELECT nme_tarefa
             DATE_FORMAT(dti_ini_tarefa, '%d/%m/%Y - %H:%i') as inicio,
             DATE_FORMAT(dti_fim_tarefa, '%d/%m/%Y - %H:%i') as inicio,
             TIMESTAMPDIFF(HOUR, CURDATE(), dti_ini_tarefa) as faltam_horas,
             TIMESTAMPDIFF(MINUTE, dti_ini_tarefa, dti_fim_tarefa) as tempo_exec_minutos
             FROM tb_tarefa
