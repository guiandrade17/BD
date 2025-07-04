-- Cria o usuário 'usuario_leitor_curso' que se conecta apenas de 'localhost'
CREATE USER 'usuario_leitor_curso'@'localhost' IDENTIFIED BY 'senha_leitor';

-- Cria o usuário 'usuario_gerente_curso' que se conecta de qualquer host ('%')
CREATE USER 'usuario_gerente_curso'@'%' IDENTIFIED BY 'senha_gerente';

-- Cria o usuário 'usuario_dev_dis' que se conecta apenas de 'localhost'
CREATE USER 'usuario_dev_dis'@'localhost' IDENTIFIED BY 'senha_dev';

-- Opcional: Se estiver em uma versão mais antiga do MySQL (antes do 8.0), execute para recarregar as tabelas de privilégios.
-- FLUSH PRIVILEGES;

-- Concede permissão de SELECT (leitura) em todas as tabelas do banco 'bd_curso_dis'
GRANT SELECT ON bd_curso_dis.* TO 'usuario_leitor_curso'@'localhost';

-- Concede permissões de SELECT, INSERT, UPDATE e DELETE em todas as tabelas do banco 'bd_curso_dis'
GRANT SELECT, INSERT, UPDATE, DELETE ON bd_curso_dis.* TO 'usuario_gerente_curso'@'%';

-- Concede permissões de INSERT, UPDATE e DELETE APENAS na tabela 'tb_dis' do banco 'bd_curso_dis'
GRANT INSERT, UPDATE, DELETE ON bd_curso_dis.tb_dis TO 'usuario_dev_dis'@'localhost';

-- Concede permissão de SELECT (leitura) em TODAS as tabelas do banco 'bd_curso_dis'
GRANT SELECT ON bd_curso_dis.* TO 'usuario_dev_dis'@'localhost';

SHOW GRANTS FOR 'usuario_leitor_curso'@'localhost';
SHOW GRANTS FOR 'usuario_gerente_curso'@'%';
SHOW GRANTS FOR 'usuario_dev_dis'@'localhost';

USE bd_curso_dis;

-- DEVE FUNCIONAR:
SELECT * FROM tb_curso;
SELECT nme_dis FROM tb_dis WHERE idt_dis = 1;

-- DEVE FALHAR com "Access denied":
INSERT INTO tb_curso (nme_curso, dta_criacao_curso) VALUES ('Novo Curso por Leitor', '2025-01-01');
DELETE FROM tb_dis WHERE idt_dis = 1;

USE bd_curso_dis;

-- DEVE FUNCIONAR:
SELECT * FROM tb_curso;
INSERT INTO tb_curso (nme_curso, dta_criacao_curso) VALUES ('Estatística Aplicada', '2025-06-01');
UPDATE tb_dis SET num_ch_dis = 65 WHERE idt_dis = 2;
DELETE FROM tb_curso WHERE nme_curso = 'Estatística Aplicada';

USE bd_curso_dis;

-- DEVE FUNCIONAR:
SELECT * FROM tb_curso;
SELECT * FROM tb_dis;
INSERT INTO tb_dis (nme_dis, num_ch_dis) VALUES ('Programação Web II', 70);
UPDATE tb_dis SET num_ch_dis = 75 WHERE nme_dis = 'Programação Web II';

-- DEVE FALHAR com "Access denied":
INSERT INTO tb_curso (nme_curso, dta_criacao_curso) VALUES ('Sociologia', '2025-01-01');
DELETE FROM tb_curso WHERE nme_curso = 'Sociologia';

REVOKE INSERT ON bd_curso_dis.tb_dis FROM 'usuario_dev_dis'@'localhost';

REVOKE SELECT, INSERT, UPDATE, DELETE ON bd_curso_dis.* FROM 'usuario_gerente_curso'@'%';
-- Alternativamente, se você concedeu ALL PRIVILEGES antes:
-- REVOKE ALL PRIVILEGES ON bd_curso_dis.* FROM 'usuario_gerente_curso'@'%';

FLUSH PRIVILEGES; -- Importante para garantir que as alterações sejam aplicadas imediatamente.

DROP USER 'usuario_leitor_curso'@'localhost';
DROP USER 'usuario_gerente_curso'@'%';
DROP USER 'usuario_dev_dis'@'localhost';

FLUSH PRIVILEGES; -- Recomenda-se após operações de DROP USER.
