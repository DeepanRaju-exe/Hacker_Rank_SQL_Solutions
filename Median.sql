/*
Enter your query here.
*/
WITH CTE AS (
  SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N ASC) AS rn 
  FROM STATION
)

SELECT CASE 
         WHEN (SELECT MAX(rn) FROM CTE) % 2 <> 0 
              THEN ROUND((SELECT LAT_N FROM CTE WHERE rn = (SELECT (MAX(rn)+1)/2 FROM CTE)), 4)
         WHEN (SELECT MAX(rn) FROM CTE) % 2 = 0 
              THEN ROUND(
                    ((SELECT LAT_N FROM CTE WHERE rn = (SELECT MAX(rn)/2 FROM CTE)) +
                     (SELECT LAT_N FROM CTE WHERE rn = (SELECT MAX(rn)/2 + 1 FROM CTE))
                    ) / 2, 4
              )
       END AS median
FROM CTE
ORDER BY MEDIAN
LIMIT 1;
