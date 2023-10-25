

SELECT CASE WHEN g.Grade >7 THEN s.Name
ELSE Null END As name, g.Grade, s.Marks FROM Students s 
JOIN Grades g ON s.Marks >= g.Min_Mark AND  s.Marks <= g.Max_Mark
ORDER BY g.Grade DESC, s.Name ASC;
