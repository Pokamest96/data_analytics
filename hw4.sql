SELECT 'ФИО: Покаместов Александр Игоревич';

SELECT table_name, CASE WHEN table_schema <> 'information_schema' THEN  pg_relation_size(table_name) ELSE 0 END AS razmer  
FROM information_schema.tables ORDER BY 2 DESC
LIMIT 5;

SELECT userID, array_agg(movieId) as user_views INTO public.user_movies_agg FROM ratings GROUP BY userID;

CREATE OR REPLACE FUNCTION cross_arr (bigint[], bigint[]) RETURNS bigint[] language sql as 'SELECT CASE WHEN $1 IS NULL THEN $2 WHEN $2 IS NULL THEN $1 ELSE array_agg(tmp) END FROM (SELECT tmp FROM unnest($1) a(tmp) INTERSECT SELECT tmp FROM unnest($2) a(tmp)) buf'; 

CREATE OR REPLACE FUNCTION diff_arr (bigint[], bigint[]) RETURNS bigint[] language sql as 'SELECT CASE WHEN $1 IS NULL THEN $2 WHEN $2 IS NULL THEN $1 ELSE array_agg(tmp) END FROM (SELECT tmp FROM unnest($1) a(tmp) EXCEPT SELECT tmp FROM unnest($2) a(tmp)) buf';
 
WITH animal AS (SELECT cat.userid as catpole, cat.user_views as kot, dog.userid as dogpole, dog.user_views as sob from user_movies_agg as cat CROSS JOIN user_movies_agg as dog WHERE cat.userid <> dog.userid AND cat.userid < 70 AND dog.userid < 70)
SELECT catpole, dogpole, cross_arr(kot, sob) AS pooh INTO common_user_views FROM animal;

SELECT catpole, dogpole, array_length(pooh, 1) AS sort FROM common_user_views WHERE catpole < dogpole ORDER BY 3 DESC LIMIT 10;

SELECT catpole, diff_arr(user_views, pooh) FROM common_user_views INNER JOIN user_movies_agg ON userid = dogpole;
 
