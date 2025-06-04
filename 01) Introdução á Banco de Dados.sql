CREATE DATABASE Biblioteca;

USE Biblioteca;

CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY, 
    NOME VARCHAR(100) NOT NULL
);

CREATE TABLE Livro (
   id_livro INT AUTO_INCREMENT PRIMARY KEY,
   titulo VARCHAR(150) NOT NULL,
   id_autor INT, 
   quantidade_disponivel INT DEFAULT 1,
   FOREIGN KEY (id_autor) REFERENCES autor(id_autor) ON DELETE SET NULL
);

CREATE TABLE Usuario (
   id_usuario INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Emprestimo (
   id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
   id_usuario INT,
   id_livro INT,
   data_emprestimo DATE NOT NULL,
   data_devolucao DATE,
   FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
   FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);

INSERT INTO Autor (nome) VALUES ('Machado de Assis'), ('J. K. Rowling');

INSERT INTO Livro (titulo, id_autor, quantidade_disponivel) VALUES('Dom Casmurro', 1, 5), ('Harry Potter e a Pedra Filosofal', 2, 3);

INSERT INTO Usuario (nome, email) VALUES ('Guilherme Brito', 'guilhermebritoandrade17@gmail.com'), ('Maria Carla', 'mariaccarla@email.com');

INSERT INTO Emprestimo (id_usuario, id_livro, data_devolucao) VALUES (1, 1, '2025-04-10');
