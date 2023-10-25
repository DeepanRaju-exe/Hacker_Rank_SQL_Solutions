WITH CTE AS (
    SELECT 
        h.name AS name,
        s.hacker_id AS hackid,
        s.challenge_id AS challengeid, 
        s.score AS score_got,
        d.score AS score_max 
    FROM 
        Submissions s
    JOIN 
        Challenges c ON s.challenge_id = c.challenge_id 
    JOIN 
        Difficulty d ON c.difficulty_level = d.difficulty_level AND s.score = d.score
    JOIN 
        Hackers h ON h.hacker_id = s.hacker_id
)

SELECT 
    a.hackid AS hackid,
    a.name AS name

FROM 
    CTE a 
JOIN 
    CTE b ON  a.hackid = b.hackid
GROUP BY
    a.hackid, a.name
HAVING 
    COUNT(a.challengeid) > 1
ORDER BY 
    COUNT(a.challengeid) DESC, hackid ASC;
;

------------------------------------------------------------------------   Approach 2  ---------------------------------------------------------------------

WITH FullScores AS (
    SELECT
        s.hacker_id,
        COUNT(*) AS full_scores_count
    FROM
        Submissions s
    JOIN
        Challenges c ON s.challenge_id = c.challenge_id
    WHERE
        s.score = (SELECT MAX(score) FROM Difficulty WHERE difficulty_level = c.difficulty_level)
    GROUP BY
        s.hacker_id
    HAVING
        COUNT(*) > 1
)

SELECT
    h.hacker_id,
    h.name
FROM
    Hackers h
JOIN
    FullScores f ON h.hacker_id = f.hacker_id
ORDER BY
    f.full_scores_count DESC, h.hacker_id ASC;

