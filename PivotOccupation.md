#PIVOTING OCCUPATION TABLE ROWS TO COLUMN

##Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.

Table:

![image](https://github.com/DeepanRaju-exe/Hacker_Rank_SQL_Solutions/assets/68472546/f7208f9c-f384-4d9c-a2a7-579eeb112dd6)

Sample Out Put

![image](https://github.com/DeepanRaju-exe/Hacker_Rank_SQL_Solutions/assets/68472546/f60088a7-8379-4f9d-843e-81f7623d41b4)

---

My Approach :

1.We can use default functions but its different for different data bases so im going by case statements.
2.Using case segregatting the names for each occupation type and labling it as respective occupation , from a table where its ordered alphabatically by names as per question.
3.Now you will see null values as there is no respective data by default we get NULL for those.
4.To filter it out i have created a row labling partitioned by occupation and ordered by name 
5.with this row number we can group it to gether.
6.On top of that apply max function to get our desired value(names here) not the null values.


Solution : [Link]()
====================

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

