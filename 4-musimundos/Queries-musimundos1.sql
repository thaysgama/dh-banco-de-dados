USE musimundos;

SELECT * FROM faturas;

SELECT MAX(valor_total) FROM faturas WHERE cidade_cobranca LIKE 'Oslo';

SELECT MIN(valor_total) FROM faturas;

SELECT AVG(valor_total) FROM faturas WHERE pais_cobranca = 'Canada';

SELECT COUNT(*) FROM faturas WHERE pais_cobranca ='Canada';

SELECT SUM(valor_total) FROM faturas;

SELECT id, data_fatura, valor_total
FROM faturas
WHERE valor_total < (
SELECT AVG (valor_total) FROM faturas);

SELECT AVG (valor_total) FROM faturas;

