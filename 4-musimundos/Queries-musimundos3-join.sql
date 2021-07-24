USE musimundos;

-- 1) Liste a quantidade de canções existem para cada gênero musical, agrupando a consulta por gênero e ordenando da maior quantidade para a menor. --
SELECT COUNT(*), generos.nome FROM cancoes 
INNER JOIN generos 
ON cancoes.id_genero = generos.id
GROUP BY id_genero 
ORDER BY COUNT(*) DESC;

-- 2) Liste a quantidade de canções existentes para gênero musical, agrupando por gênero. Exiba apenas os genêros que tem mais de 10 canções. --
SELECT COUNT(*), generos.nome FROM cancoes 
INNER JOIN generos 
ON cancoes.id_genero = generos.id
GROUP BY id_genero
HAVING COUNT(*) >10
ORDER BY COUNT(*) DESC;

-- 3) Utilizando as tabelas clientes e faturas, liste os países,a quantidade de clientes e a soma das faturas por país,ordenando do maior para o menor, limitando a consulta a 7 registros. --
SELECT COUNT(DISTINCT clientes.id), faturas.pais_cobranca, SUM(faturas.valor_total) 
FROM clientes
JOIN faturas 
ON clientes.id = faturas.id_cliente
GROUP BY faturas.pais_cobranca
ORDER BY COUNT(clientes.id) DESC
LIMIT 7;