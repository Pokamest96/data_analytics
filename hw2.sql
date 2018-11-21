SELECT 'ФИО: Покаместов Александр Игоревич';
-- 1.1
SELECT * FROM ratings LIMIT 10;
-- 1.2
SELECT * FROM links WHERE imdbid LIKE '%42' AND movieid BETWEEN 100 AND 1000 LIMIT 10;
-- 2.1
SELECT IMDBID FROM LINKS INNER JOIN ratings ON links.movieid=ratings.movieid WHERE ratings.rating=5 LIMIT 10;
-- 3.1
SELECT COUNT(*) FROM LINKS LEFT JOIN ratings ON links.movieid=ratings.movieid WHERE ratings.rating IS NULL;
-- 3.2
SELECT userid, avg(rating) AS average_rating FROM ratings GROUP BY userid having AVG(rating) > 3.5 ORDER BY 2 DESC LIMIT 10;
-- 4.1
SELECT imdbid FROM links WHERE imdbid IN (SELECT imdbid FROM ratings GROUP BY imdbid HAVING AVG(rating)>3.5) LIMIT 10;
-- 4.2
WITH sredrat as (SELECT userid FROM ratings GROUP BY userid HAVING count(*)>10)
SELECT AVG(rating) FROM ratings, sredrat WHERE ratings.userid IN (sredrat.userid);
