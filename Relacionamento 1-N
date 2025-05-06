CREATE SCHEMA IF NOT EXISTS bd1;

USE bd1;

CREATE TABLE tb_categoria(
  idt_categoria INT PRIMARY AUTO_INCREMENT,
  nme_categoria VARCHAR(50) NOT NULL,
  CONSTRAINT uq_categoria UNIQUE KEY (nme_categoria)
  );
  
CREATE TABLE tb_produto(
   idt_produto INT PRIMARY AUTO_INCREMENT,
   nme_produto VARCHAR(50) NOT NULL,
   vlr_produto DECIMAL(10,2) NOT NULL, 
   qtd_estoque_produto INT NOT NULL,
   cod_categoria INT NOT NULL,
   CONSTRAINT uq_produto UNIQUE KEY (nme_produto, cod_categoria),
   CONSTRAINT fk_produto_categoria FOREIGN KEY (cod_categoria)
      REFERENCES tb_categoria(idt_categoria)
    );
    
    -- Inserts para tb_categoria
INSERT INTO tb_categoria (nme_categoria) VALUES
('Eletrônicos'),
('Vestuário'),
('Alimentos'),
('Livros'),
('Ferramentas');

-- Inserts para tb_produto
INSERT INTO tb_produto (nme_produto, vlr_produto, qtd_estoque_produto, cod_categoria) VALUES
('Smartphone', 1200.00, 50, 1),
('Camiseta', 35.00, 100, 2),
('Arroz', 15.00, 200, 3),
('Livro de Ficção', 40.00, 30, 4),
('Chave de Fenda', 20.00, 75, 5),
('Notebook', 2500.00, 20, 1),
('Calça Jeans', 80.00, 80, 2),
('Macarrão', 8.00, 300, 3),
('Livro de História', 45.00, 25, 4),
('Martelo', 30.00, 60, 5),
('Tablet', 800.00, 40, 1),
('Meias', 10.00, 150, 2),

SELECT * FROM tb_categoria;

SELECT * FROM tb_produto;

-- Não pode incluir porque essa categoria já existe, "uq_categoria"
INSERT INTO tb_categoria (nme_categoria) VALUES ('Eletrônicos');

-- Não pode incluir um filho de um pai inexistente
INSERT INTO tb_produto (nme_produto, vlr_produto, qtd_estoque_produto, cod_categoria) VALUES
('Calção', 49.00, 150, 7);

-- Não pode incluir o mesmo produto dentro de uma categoria
INSERT INTO tb_produto (nme_produto, vlr_produto, qtd_estoque_produto, cod_categoria) VALUES
('Smartphone', 1200.00, 50, 1);

SELECT nme_categoria, nme_produto, vlr_produto, qtd_estoque_produto
  FROM tb_categoria JOIN tb_produto ON idt_categoria = cod_categoria;
  
SELECT nme_categoria, nme_produto, vlr_produto, qtd_estoque_produto
  FROM tb_categoria JOIN tb_produto ON idt_categoria = cod_categoria
  WHERE idt_categoria = 1;
  
SELECT nme_categoria, nme_produto, vlr_produto, qtd_estoque_produto
  FROM tb_categoria JOIN tb_produto ON idt_categoria = cod_categoria
  ORDER BY nme_categoria ASC, vlr_produto ASC;
