/*To find the correlation between delay and production year
I have joined the planes and the flights*/
SELECT p.year, AVG(f.dep_delay) FROM planes p 
JOIN flights f ON p.tailnum=f.tailnum
WHERE p.year>0
GROUP BY p.year
ORDER BY AVG(f.dep_delay) DESC
/*According to the result of the query above, 
it is hard to say that there is a correlation
between production year and delay of departure*/