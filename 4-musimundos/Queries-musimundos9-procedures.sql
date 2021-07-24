USE musimundos;

DELIMITER $$
CREATE PROCEDURE `todosClientes`()
BEGIN
SELECT * FROM `clientes`;
END $$
DELIMITER ;

CALL `todosClientes`;
DROP PROCEDURE `todosClientes`;

DELIMITER $$
CREATE PROCEDURE nomeUsuario(IN id_usuario INT)
BEGIN
SELECT nome FROM clientes WHERE id = id_usuario;
END $$
DELIMITER ;

CALL nomeUsuario(5);

-- 1) Crie uma procedure que selecione o valor da fatura com o valor mais baixo.

DELIMITER $$
CREATE PROCEDURE menorValorFatura()
BEGIN
SELECT MIN(valor_total) FROM faturas;
END $$
DELIMITER ;

CALL `menorValorFatura`;
DROP PROCEDURE menorValorFatura;

-- 2) Crie uma procedure que retorna a quantidade de faturas que tem o país de cobrança como “Canada”.

DELIMITER $$
CREATE PROCEDURE qtFaturasCanada()
BEGIN
SELECT COUNT(*) FROM faturas WHERE pais_cobranca  = "Canada";
END $$
DELIMITER ;

CALL qtFaturasCanada;
-- DROP PROCEDURE qtFaturasCanada;

-- 3) Uma procedure que retorna o valor somado de todas as faturas.
DELIMITER $$
CREATE PROCEDURE valorTodasFaturas()
BEGIN
SELECT SUM(valor_total) FROM faturas;
END $$
DELIMITER ;

CALL valorTodasFaturas;
-- DROP PROCEDURE valorTodasFaturas;

-- 4) Uma procedure que retorna o valor médio de todas as faturas.

DELIMITER $$
CREATE PROCEDURE mediaTodasFaturas()
BEGIN
SELECT AVG(valor_total) FROM faturas;
END $$
DELIMITER ;

CALL mediaTodasFaturas;
-- DROP PROCEDURE valorTodasFaturas;


-- 1) Crie uma procedure que retorna o tamanho em bytes e a duração de uma canção pelo seu id.
DELIMITER $$
CREATE PROCEDURE tamanhoCancao(IN id_cancoes INT)
BEGIN
SELECT bytes, duracao_milisegundos FROM cancoes WHERE id = id_cancoes;
END $$
DELIMITER ;

CALL tamanhoCancao(4);
-- DROP PROCEDURE tamanhoCancao;

-- 2) Crie uma procedure que retorna o preço unitário uma canção pelo seu id.

DELIMITER $$
CREATE PROCEDURE precoUnitCancao(IN id_cancoes INT)
BEGIN
SELECT preco_unitario FROM cancoes WHERE id = id_cancoes;
END $$
DELIMITER ;

CALL precoUnitCancao(4);

/* 3) Crie uma procedure que retorna o id da canção, o nome da canção e o tipo
de arquivo(table tipos_de_arquivo) desta canção á partir de um id da
canção informado. */

DELIMITER $$
CREATE PROCEDURE cancoesTipoArquivo(IN id_cancoes INT)
BEGIN
SELECT cancoes.id, cancoes.nome, tipos_de_arquivo.nome 
FROM cancoes 
INNER JOIN tipos_de_arquivo
ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id
WHERE cancoes.id = id_cancoes;
END $$
DELIMITER ;

CALL cancoesTipoArquivo(4);

-- 1) Crie uma procedure que retorna o nome e sobrenome concatenados e também o email de todos os clientes.
DELIMITER $$
CREATE PROCEDURE infoClientes()
BEGIN
SELECT CONCAT(nome, " " , sobrenome), email FROM clientes;
END $$ 
DELIMITER ;

CALL infoClientes;
DROP PROCEDURE infoClientes;

/* 2) Crie uma procedure que retorna o nome completo (nome e sobrenome
concatenados) e também o endereço completo (endereço, cidade, estado
e país) de um cliente pelo id informado. */

DELIMITER $$
CREATE PROCEDURE infoCliEndereco(IN id_cliente INT)
BEGIN
SELECT CONCAT(nome, " " , sobrenome), 
endereco, cidade, estado, pais FROM clientes
WHERE id = id_cliente;
END $$ 
DELIMITER ;

CALL infoCliEndereco(8);

/* 3) Crie uma procedure que retorna o nome do cliente e o valor total de cada
uma das suas faturas pelo id do cliente informado.*/
DELIMITER $$
CREATE PROCEDURE CliValorFaturas(IN id_cliente INT)
BEGIN
SELECT clientes.nome, faturas.valor_total
FROM clientes
INNER JOIN faturas
ON clientes.id = faturas.id_cliente
WHERE clientes.id = id_cliente;
END $$ 
DELIMITER ;

CALL CliValorFaturas(8);

DROP PROCEDURE CliValorFAturas;