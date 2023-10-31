With Project_Start AS (
    SELECT
            Start_Date,ROW_Number() OVER (ORDER BY Start_Date) as Row_start
    FROM    Projects
    WHERE   Start_Date NOT IN(SELECT End_Date FROM Projects)

),

Project_End as (
    SELECT
        End_Date,ROW_Number() OVER (ORDER BY End_Date) as Row_end
FROM    Projects
WHERE   End_Date NOT IN(SELECT Start_Date FROM Projects)
)

SELECT
        Start_Date,End_Date
FROM    Project_Start, Project_End
WHERE   Row_Start = Row_End

ORDER BY 
DATEDIFF(day,Start_Date,End_Date),Start_Date;
