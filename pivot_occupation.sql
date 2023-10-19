WITH CTE AS (

SELECT 
CASE WHEN Occupation like 'Doctor' THEN Name END AS Doctor,
CASE WHEN Occupation like 'Professor' THEN Name END AS Professor,
CASE WHEN Occupation like 'Singer' THEN Name END AS Singer,
CASE WHEN Occupation like 'Actor' THEN Name END AS Actor,rn
FROM 
(SELECT *,ROW_NUMBER() OVER(PARTITION BY Occupation Order BY Name) as rn FROM OCCUPATIONS)x
)

SELECT MAX(Doctor),MAX(Professor),MAX(Singer),MAX(Actor) FROM CTE 
GROUP BY rn;