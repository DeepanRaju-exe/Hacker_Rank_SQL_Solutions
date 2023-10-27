WITH CTE AS 
(
SELECT h.hacker_id, h.name, COUNT(c.challenge_id) OVER(PARTITION BY h.hacker_id) AS prob_created FROM Hackers h
JOIN Challenges c ON h.hacker_id = c.hacker_id
),

R AS (SELECT * FROM CTE GROUP BY hacker_id,name,prob_created),

Q AS (
SELECT prob_created,COUNT(hacker_id) as counts_of_id,MAX(prob_created) OVER() AS max_p FROM  R
GROUP BY prob_created
)

SELECT R.hacker_id,R.name,R.prob_created FROM Q
JOIN R ON Q.prob_created = R.prob_created AND Q.counts_of_id =1  

UNION 

SELECT R.hacker_id,R.name,R.prob_created FROM Q
JOIN R ON Q.prob_created = R.prob_created AND Q.prob_created = Q.max_p

ORDER BY R.prob_created DESC, R.hacker_id ASC
;
