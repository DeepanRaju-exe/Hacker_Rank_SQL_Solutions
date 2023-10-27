SELECT 
    w.id, 
    p.age, 
    w.coins_needed as min_coins_needed, 
    w.power 
FROM Wands w
JOIN Wands_Property p ON w.code = p.code
JOIN (
    SELECT 
        p.age, 
        w.power, 
        MIN(w.coins_needed) as min_coins_needed
    FROM Wands w
    JOIN Wands_Property p ON w.code = p.code 
    WHERE p.is_evil = 0
    GROUP BY p.age, w.power
) min_coins 
ON p.age = min_coins.age AND w.power = min_coins.power AND w.coins_needed = min_coins.min_coins_needed
WHERE p.is_evil = 0
ORDER BY w.power DESC, p.age DESC;
