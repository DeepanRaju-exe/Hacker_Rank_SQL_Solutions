
SELECT MAX(salary * months) , 
       COUNT(employee_id) 
FROM employee
WHERE (salary * months) = (SELECT MAX(salary * months) FROM employee);
