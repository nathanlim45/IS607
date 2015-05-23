SELECT airports.name, delays.total_delay
FROM airports
INNER JOIN

(SELECT DISTINCT origin, SUM(dep_delay) AS "total_delay"
FROM flights
WHERE dep_delay>0
GROUP BY origin) AS delays

ON airports.faa=delays.origin
ORDER BY delays.total_delay;