SELECT 
ROUND(
SQRT(

POW((ROUND(MAX(LAT_N) - MIN(LAT_N),4)),2) + 
POW((ROUND(MAX(LONG_W) - MIN(LONG_W),4)),2)
) 
,4)AS man_b
FROM STATION;
