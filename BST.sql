WITH cte AS 
(SELECT DISTINCT N1 AS InnerNode 
 FROM 
(SELECT a.n as N1 FROM BST a
JOIN BST b ON a.p = b.n
JOIN BST C ON c.p =a.n)x
)

SELECT n,CASE 
WHEN N iN (SELECT InnerNode from cte) THEN "Inner"
WHEN N NOT IN (SELECT InnerNode from cte) AND p IS NOT NULL THEN "Leaf"
ELSE "Root" END AS Node_type
FROM BST 
ORDER BY n ASC ;

###################################
#Another approach is simplier but its via sub query 
#1. for every node we are checking the how many node has it as parent and we select only those are having 1 or more
#2. Becuase those nodes are inner nodes

select N,
       if(P is null, 'Root', if((select count(*) from BST where P = B.N)> 0, 'Inner', 'Leaf')) 
from BST as B 
order by N;