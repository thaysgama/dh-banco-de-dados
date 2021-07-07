CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE usuarios(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE livros(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100)
);

CREATE TABLE emprestimos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	data_emprest DATE,
    data_devolucao DATE,
    id_usuarios INT,
    id_livros INT,
    FOREIGN KEY (id_usuarios) REFERENCES usuarios (id),
    FOREIGN KEY (id_livros) REFERENCES livros (id)
);

INSERT INTO usuarios (nome, email, telefone)
VALUES
("Fe", "fe@digitalhouse.com", "85885466382"),
("Pedro", "pedro@digitalhouse.com", "81995486322"),
("Silas", "silas@digitalhouse.com", "88595411382");

INSERT INTO livros (titulo)
VALUES
("Diario de um banana"),
("O senhor dos aneis"),
("Verdade Tropical");

INSERT INTO emprestimos (data_emprest, data_devolucao, id_usuarios, id_livros)
VALUES
("2021-06-18", "2021-06-30", 1,1),
("2021-05-25","2021-06-18",3,2),
("2021-06-17","2021-06-30",2,3);

SELECT * FROM emprestimos;
SELECT nome, email FROM usuarios;

SELECT nome FROM usuarios
WHERE id =1;

SELECT titulo FROM livros
WHERE id=1;

UPDATE usuarios SET nome="Felipe" 
WHERE nome="Fe";

DELETE FROM emprestimos
WHERE id_usuarios = 1;

DROP DATABASE biblioteca;
