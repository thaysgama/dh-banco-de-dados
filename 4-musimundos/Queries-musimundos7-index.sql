USE musimundos;

SHOW INDEX FROM cancoes;

EXPLAIN SELECT nome FROM cancoes
WHERE compositor = "AC/DC";

CREATE INDEX idx_compositor
ON cancoes(compositor);

EXPLAIN SELECT nome FROM cancoes
WHERE nome = "Hero"; 
-- filtered = 10.00 / rows 3503
-- depois do idx => filtered = 100.00 / rows 1

CREATE INDEX idx_cancoes_nome
ON cancoes(nome);

DROP INDEX idx_cancoes_nome ON cancoes;

EXPLAIN SELECT titulo FROM albuns
WHERE titulo = "Na Pista"; 
-- filtered = 10.00 / rows 347
-- depois do idx => filtered = 100.00 / rows 1

CREATE INDEX idx_albuns_titulo
ON albuns(titulo);

DROP INDEX idx_albuns_titulo ON albuns;
