SELECT planes.year, AVG(dep_delay) FROM planes JOIN flights ON planes.tailnum=flights.tailnum
WHERE planes.year>0
GROUP BY planes.year
ORDER BY planes.year