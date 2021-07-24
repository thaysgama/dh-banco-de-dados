USE musimundos;

SELECT nome, titulo 
FROM artistas 
INNER JOIN albuns 
ON artistas.id = id_artista 
ORDER BY id_artista;

SELECT nome, titulo 
FROM artistas 
INNER JOIN albuns 
ON artistas.id = albuns.id_artista 
ORDER BY id_artista;

SELECT nome, valor_total 
FROM clientes 
INNER JOIN faturas 
ON clientes.id = id_cliente 
HAVING valor_total >5 
ORDER BY valor_total DESC; 

SELECT clientes.nome, faturas.valor_total
FROM clientes
INNER JOIN faturas
ON clientes.id = faturas.id_cliente
HAVING faturas.valor_total > 5
ORDER BY faturas.valor_total DESC;

SELECT clientes.nome, clientes.sobrenome, faturas.*
FROM clientes
INNER JOIN faturas
ON clientes.id = faturas.id_cliente
HAVING valor_total > 5
ORDER BY valor_total DESC;

SELECT cancoes.nome, tipos_de_arquivo.nome 
FROM cancoes 
INNER JOIN tipos_de_arquivo 
ON tipos_de_arquivo.id = id_tipo_de_arquivo
ORDER BY cancoes.id;

SELECT cancoes.nome, tipos_de_arquivo.nome 
FROM cancoes 
INNER JOIN tipos_de_arquivo 
ON cancoes.id_tipo_de_arquivo = tipos_de_arquivo.id
ORDER BY cancoes.id;