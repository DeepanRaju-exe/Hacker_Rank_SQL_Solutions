WITH ch_views AS (
    SELECT 
        c.contest_id,
        SUM(v.total_views) AS tot_v,
        SUM(v.total_unique_views) AS tot_uv  
    FROM challenges ch
    JOIN colleges c ON c.college_id = ch.college_id
    JOIN view_stats v ON v.challenge_id = ch.challenge_id
    GROUP BY c.contest_id
), 
sub_stat AS (
    SELECT 
        c.contest_id,
        SUM(s.total_submissions) AS tot_s,
        SUM(s.total_accepted_submissions) AS tot_as  
    FROM challenges ch
    JOIN colleges c ON c.college_id = ch.college_id
    JOIN submission_stats s ON s.challenge_id = ch.challenge_id
    GROUP BY c.contest_id
)
SELECT 
      c.contest_id,c.hacker_id,c.name,s.tot_s,s.tot_as,v.tot_v,v.tot_uv 
    FROM contests c
    JOIN sub_stat s ON s.contest_id = c.contest_id
    JOIN ch_views v ON v.contest_id = c.contest_id
    WHERE 
    s.tot_s >0 OR s.tot_as > 0 OR v.tot_v > 0 OR v.tot_uv > 0 

    ORDER BY c.contest_id;
