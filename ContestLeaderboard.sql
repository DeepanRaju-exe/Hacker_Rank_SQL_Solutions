WITH CTE AS (
    SELECT 
        h.hacker_id, 
        h.name, 
        s.challenge_id,
        MAX(s.score) AS max_score 
    FROM Hackers h
    JOIN Submissions s ON h.hacker_id = s.hacker_id
    GROUP BY h.hacker_id, h.name, s.challenge_id
),R AS

(SELECT 
    hacker_id, 
    name, 
    SUM(max_score) AS sum_total
     
FROM CTE
group by hacker_id,name

)

SELECT *  FROM R 
WHERE sum_total > 0
ORDER BY sum_total DESC, hacker_id ASC;
