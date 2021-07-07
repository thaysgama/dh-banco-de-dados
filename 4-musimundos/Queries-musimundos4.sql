USE musimundos;

SELECT artistas.nome, albuns.titulo FROM artistas
INNER JOIN albuns
ON artistas.id = albuns.id_artista
WHERE nome = "Queen";

SELECT artistas.nome, albuns.titulo FROM artistas
INNER JOIN albuns
ON artistas.id = albuns.id_artista
WHERE nome = "Simply Red";

SELECT artistas.nome, COUNT(itens_da_faturas.quantidade), cancoes.nome FROM artistas
INNER JOIN albuns
ON artistas.id = albuns.id_artista
INNER JOIN cancoes
ON cancoes.id_album = albuns.id
INNER JOIN itens_da_faturas
ON itens_da_faturas.id_cancao = cancoes.id
WHERE artistas.nome = "AC/DC" AND
cancoes.nome = "Overdose";

-- DROP VIEW  FATURAS_NACIONAIS,
-- CREATE VIEW FATURAS_NACIONAIS AS
SELECT faturas.data_fatura, clientes.id, clientes.nome, 
clientes.sobrenome, faturas.valor_total, faturas.pais_cobranca
FROM faturas 
LEFT JOIN clientes ON clientes.id = faturas.id_cliente
WHERE faturas.pais_cobranca = 'Argentina';

SELECT * FROM FATURAS_NACIONAIS;

-- DROP VIEW latinos;

CREATE VIEW latinos AS
SELECT artistas.nome AS nome_artista, 
albuns.titulo AS titulo_album, 
cancoes.nome AS nome_musica 
-- ,generos.nome AS genero
FROM artistas
INNER JOIN albuns
ON artistas.id = albuns.id_artista
INNER JOIN cancoes
ON albuns.id = cancoes.id_album
INNER JOIN generos
ON generos.id = cancoes.id_genero
WHERE generos.nome LIKE "%Latin%"
ORDER BY artistas.nome, cancoes.nome;

SELECT * FROM latinos;
