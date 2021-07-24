USE musimundos;

-- EXEMPLO PROFESSORA
CREATE VIEW musicas_rock AS
SELECT cancoes.id, cancoes.nome, generos.nome AS genero
FROM cancoes
INNER JOIN generos ON cancoes.id_genero = generos.id
WHERE generos.nome IN ('Rock', 'Rock And Roll');

SELECT * FROM musicas_rock;

UPDATE faturas SET id_cliente = NULL WHERE id_cliente > 50;
UPDATE cancoes SET cancoes.id_tipo_de_arquivo = NULL WHERE cancoes.id > 850;

-- A) Selecione os nomes dos artistas (tabela artistas) que tem albuns, e o nome de seus albuns 
-- (tabelas albuns) ordenado por id do artista (Order by). [Inner]
SELECT artistas.nome, albuns.titulo FROM artistas 
INNER JOIN albuns
ON artistas.id = albuns.id_artista
ORDER BY artistas.id;

-- B) Agora selecione os nomes dos artistas (tabela artistas) que tem, e que não tem albuns, 
-- e o nome de seus albuns quando houver (tabelas albuns) ordenado por id do artista (Order by). [left]
SELECT artistas.nome, albuns.titulo FROM artistas
LEFT JOIN albuns 
ON artistas.id = albuns.id_artista
ORDER BY artistas.id; 

-- A) Selecione o id e o nome dos cliente (clientes) e o valor suas faturas (faturas) [inner].
SELECT clientes.id, clientes.nome, faturas.valor_total FROM clientes
INNER JOIN faturas
ON clientes.id = faturas.id_cliente;

-- B) Agora selecione o id e o nome dos cliente (clientes) e o valor suas faturas
-- (faturas). E selecione também as faturas que não tem clientes. [right]
SELECT clientes.id, clientes.nome, faturas.valor_total 
FROM clientes
RIGHT JOIN faturas
ON clientes.id = faturas.id_cliente;

-- A) Selecione o nome da canção (cancoes) e o tipo e arquivo delas [inner].
SELECT cancoes.nome, tipos_de_arquivo.nome FROM cancoes
INNER JOIN tipos_de_arquivo
ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id;

-- B) Agora selecione o nome da canção (cancoes) e o tipo e arquivo delas. E
-- selecione também os tipos de arquivo que não tem musicas. [right].
SELECT cancoes.nome, tipos_de_arquivo.nome FROM cancoes
RIGHT JOIN tipos_de_arquivo
ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id;

-- C) Agora selecione o nome da canção (cancoes) e o tipo e arquivo delas. E
-- selecione também as musicas que não tem tipo de arquivo. [left].
SELECT cancoes.nome, tipos_de_arquivo.nome FROM cancoes
LEFT JOIN tipos_de_arquivo
ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id;

-- Transforme todas as consultas feitas nos exercícios anteriores (A - JOINS) em views. E salve-as.

CREATE VIEW inner_artistas_albuns AS
SELECT artistas.nome, albuns.titulo FROM artistas 
INNER JOIN albuns
ON artistas.id = albuns.id_artista
ORDER BY artistas.id;

CREATE VIEW left_artistas_albuns AS
SELECT artistas.nome, albuns.titulo FROM artistas
LEFT JOIN albuns 
ON artistas.id = albuns.id_artista
ORDER BY artistas.id; 

CREATE VIEW inner_clientes_faturas_valor AS
SELECT clientes.id, clientes.nome, faturas.valor_total FROM clientes
INNER JOIN faturas
ON clientes.id = faturas.id_cliente;

CREATE VIEW right_clientes_faturas_valor AS
SELECT clientes.id, clientes.nome, faturas.valor_total 
FROM clientes
RIGHT JOIN faturas
ON clientes.id = faturas.id_cliente;

CREATE VIEW inner_cancoes_tipo_arquivo AS
SELECT cancoes.nome, tipos_de_arquivo.nome AS tipo FROM cancoes
INNER JOIN tipos_de_arquivo
ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id;

CREATE VIEW right_cancoes_tipo_arquivo AS
SELECT cancoes.nome, tipos_de_arquivo.nome AS tipo FROM cancoes
RIGHT JOIN tipos_de_arquivo
ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id;

CREATE VIEW left_cancoes_tipo_arquivo AS
SELECT cancoes.nome, tipos_de_arquivo.nome AS tipo FROM cancoes
LEFT JOIN tipos_de_arquivo
ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id;

-- Crie Views para as seguintes consultas:
-- Consultar todas as canções;
CREATE VIEW todas_cancoes AS
SELECT * FROM cancoes;

-- Consultar todas as faturas com valor maior que 5.
CREATE VIEW faturas_maior5 AS
SELECT * FROM faturas WHERE valor_total > 5 ;

-- Consultar todos artistas cujo o nome começa com a letra B.
CREATE VIEW artistas_letra_b AS
SELECT * FROM artistas 
WHERE nome LIKE 'b%';

SELECT * FROM artistas_letra_b;