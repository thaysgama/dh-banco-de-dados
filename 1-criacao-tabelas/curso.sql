CREATE SCHEMA `playground`;

USE playground;

CREATE TABLE `playground`.`categorias`(
`idcategoria` INT NOT NULL,
`nome` VARCHAR(100) NULL,
PRIMARY KEY (`idcategoria`));

CREATE TABLE `playground`.`usuarios` (
`idusuario` INT NOT NULL,
`nome` VARCHAR(100) NULL,
`apelido` VARCHAR(100) NULL,
`email` VARCHAR(50) NULL,
`categoria` INT NULL,
PRIMARY KEY (`idusuario`),
INDEX `FKcategoria_idx` (`categoria` ASC) VISIBLE,
CONSTRAINT `FKcategoria`
FOREIGN KEY (`categoria`)
REFERENCES `playground`.`categorias` (`idcategoria`)
);

CREATE TABLE `playground`.`curso` (
`idcurso` INT NOT NULL,
`titulo` VARCHAR(45) NULL,
`descricao` VARCHAR(100) NULL,
PRIMARY KEY (`idcurso`)
);

CREATE TABLE `playground`.`usuarios_curso` (
`id` INT NOT NULL,
`usuario` INT NULL, 
`curso` INT NULL,
`datadeinscricao` DATE NULL,
PRIMARY KEY (`id`),
INDEX `usuario_idx` (`usuario` ASC) VISIBLE,
INDEX `curso_idx` (`curso` ASC) VISIBLE,
CONSTRAINT `usuario`
FOREIGN KEY (`usuario`)
REFERENCES `playground`.`usuarios` (`idusuario`),
CONSTRAINT `curso`
FOREIGN KEY (`curso`)
REFERENCES `playground`.`curso` (`idcurso`)
);

USE playground;
INSERT INTO categorias (`idategoria`, `nome`)
VALUES
(1, 'Aluno'),
(2, 'Docente'),
(3, 'Editor'),
(4, 'Administrador');

INSERT INTO usuarios (`idusuario`, `nome`, `sobrenome`, `email`,`categoria`)
VALUES
(1, 'Thays', 'Gama', 'thays@digitalhouse.com', 1),
(2, 'Paula','Augusto', 'paula@digitalhouse.com', 1),
(3, 'Dario', 'Olah', 'dario@digitalhouse.com', 3),
(4, 'Mario', 'Biondo', 'mario@digitalhouse.com', 4);

INSERT INTO curso (`idcurso`, `titulo`, `descricao`)
VALUES
(1, 'Full Stack', 'Loren'),
(2, 'Back-end','Loren'),
(3, 'Front-end', 'Loren');

INSERT INTO usuarios_curso (`id`, `usuario`, `curso`, `datadeinscricao`)
VALUES
(1, 1, 1, '2021-05-01'),
(2, 2, 3, '2021-05-01'),
(3, 3, 2, '2021-05-01'),
(4, 4, 3, '2021-05-01');

SELECT * FROM categorias;
SELECT * FROM usuarios;
SELECT * FROM curso;
SELECT * FROM usuarios_curso;

UPDATE `usuarios` set `nome` = "Paulinha" WHERE `nome`="Paula";
DELETE FROM `usuarios` WHERE `categoria` = 1;