CREATE DATABASE IF NOT EXISTS bd1;

USE bd1;

CREATE TABLE Livros(
id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(255) NOT NULL,
isbn VARCHAR(20) UNIQUE,
ano_publicacao YEAR
);

CREATE TABLE Autores(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
sobrenome VARCHAR(255)
);

CREATE TABLE LivroAutor(
livro_id INT,
autor_id INT,
PRIMARY KEY (livro_id,autor_id), 
FOREIGN KEY (livro_id) REFERENCES Livros(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (autor_id) REFERENCES Autores(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Livros (titulo, isbn, ano_publicacao) VALUES
('Dom Quixote', '978-85-7888-517-9', 1905),
('Cem Anos de Solidão', '978-85-05-06570-3', 1967),
('1984', '978-85-254-2208-2', 1949),
('O Pequeno Príncipe', '978-85-9508-146-4', 1943);

INSERT INTO Autores (nome, sobrenome) VALUES
('Miguel', 'de Cervantes'),
('Gabriel', 'García Márquez'),
('George', 'Orwell'),
('Antoine', 'de Saint-Exupéry'),
('Machado', 'de Assis');

INSERT INTO LivroAutor(livro_id,autor_id) VALUES
(1, 1), -- Dom Quixote por Miguel de Cervantes
(2, 2), -- Cem Anos de Solidão por Gabriel García Márquez
(3, 3), -- 1984 por George Orwell
(4, 4), -- O Pequeno Príncipe por Antoine de Saint-Exupéry
(2, 5); -- Cem Anos de Solidão também por Machado de Assis (exemplo hipotético)

SELECT
    L.titulo AS Livro,
    A.nome AS NomeAutor,
    A.sobrenome AS SobrenomeAutor
FROM
    Livros L
JOIN
    LivroAutor LA ON L.id = LA.livro_id
JOIN
    Autores A ON LA.autor_id = A.id;
SELECT
    A.nome AS NomeAutor,
    A.sobrenome AS SobrenomeAutor,
    L.titulo AS Livro
FROM
    Autores A
JOIN
    LivroAutor LA ON A.id = LA.autor_id
JOIN
    Livros L ON LA.livro_id = L.id;
SELECT
    A.nome AS NomeAutor,
    A.sobrenome AS SobrenomeAutor
FROM
    Livros L
JOIN
    LivroAutor LA ON L.id = LA.livro_id
JOIN
    Autores A ON LA.autor_id = A.id
WHERE
    L.titulo = 'Cem Anos de Solidão';
SELECT
    L.titulo AS Livro
FROM
    Autores A
JOIN
    LivroAutor LA ON A.id = LA.autor_id
JOIN
    Livros L ON LA.livro_id = L.id
WHERE
    A.nome = 'Gabriel' AND A.sobrenome = 'García Márquez';
SELECT
    L.titulo AS Livro,
    COUNT(LA.autor_id) AS NumeroDeAutores
FROM
    Livros L
LEFT JOIN
    LivroAutor LA ON L.id = LA.livro_id
GROUP BY
    L.titulo
ORDER BY
    NumeroDeAutores DESC;
SELECT
    A.nome AS NomeAutor,
    A.sobrenome AS SobrenomeAutor,
    COUNT(LA.livro_id) AS NumeroDeLivros
FROM
    Autores A
LEFT JOIN
    LivroAutor LA ON A.id = LA.autor_id
GROUP BY
    A.id, A.nome, A.sobrenome
ORDER BY
    NumeroDeLivros DESC;
SELECT
    L.titulo AS Livro,
    COUNT(LA.autor_id) AS NumeroDeAutores
FROM
    Livros L
JOIN
    LivroAutor LA ON L.id = LA.livro_id
GROUP BY
    L.titulo
ORDER BY
    NumeroDeAutores DESC
LIMIT 1;
SELECT
    A.nome AS NomeAutor,
    A.sobrenome AS SobrenomeAutor,
    COUNT(LA.livro_id) AS NumeroDeLivros
FROM
  Autores A
JOIN
    LivroAutor LA ON A.id = LA.autor_id
GROUP BY
    A.id, A.nome, A.sobrenome
ORDER BY
    NumeroDeLivros DESC
LIMIT 1;
