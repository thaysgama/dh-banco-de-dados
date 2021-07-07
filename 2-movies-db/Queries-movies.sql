USE movies_db;

SELECT title AS Titulo FROM series;

SELECT title FROM movies WHERE rating>3 AND release_date BETWEEN '1998-01-01' AND '2009-12-31' ORDER BY title DESC;

SELECT title FROM movies WHERE rating>3 AND release_date > '1998-01-01' < '2009-12-31' ORDER BY title DESC;

SELECT title FROM movies WHERE rating>3 AND  '1998-01-01' < release_date < '2009-12-31' ORDER BY title DESC;

SELECT title FROM movies WHERE rating>3 AND release_date BETWEEN '1998-01-01' AND '2009-12-31' ORDER BY title DESC LIMIT 10;

SELECT title FROM movies WHERE rating>3 AND release_date BETWEEN '1998-01-01' AND '2009-12-31' ORDER BY title DESC LIMIT 10 OFFSET 10;

SELECT * FROM episodes ORDER BY rating ASC LIMIT 3;

SELECT first_name AS Nome, last_name AS Sobrenome FROM actors ORDER BY Nome ASC;

SELECT * FROM series;

SELECT title AS titulo FROM movies WHERE title LIKE '%St%y%';
