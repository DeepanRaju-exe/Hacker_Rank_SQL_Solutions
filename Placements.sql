WITH CTE AS(
    SELECT f.id as f_id, p.salary as fsalary 
    FROM Friends f 
    JOIN Packages p ON f.id = p.id
), 
P AS ( 
    SELECT s.ID as student_id, s.Name, f.friend_id as f_id, p.salary AS ssalary 
    FROM Students s 
    JOIN Friends f ON s.ID= f.id 
    JOIN Packages p ON p.ID = s.ID 
) 
SELECT P.Name 
FROM P 
JOIN CTE C ON C.f_id = P.f_id AND P.ssalary < C.fsalary 
ORDER BY C.FSALARY ASC ;
