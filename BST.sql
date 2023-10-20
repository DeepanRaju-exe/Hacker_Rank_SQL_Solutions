WITH cte AS 
(SELECT DISTINCT N1 AS InnerNode 
 FROM 
(SELECT a.n as N1,a.p as P1 ,b.n AS N2, b.p AS P2, c.n AS N1ispar FROM BST a
JOIN BST b ON a.p = b.n
JOIN BST C ON c.p =a.n)x
)

SELECT n,CASE 
WHEN N iN (SELECT InnerNode from cte) THEN "Inner"
WHEN N NOT IN (SELECT InnerNode from cte) AND p IS NOT NULL THEN "Leaf"
ELSE "Root" END AS Node_type
FROM BST 
ORDER BY n ASC ;