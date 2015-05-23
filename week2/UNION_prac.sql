SELECT month, flight, origin, dest, tailnum FROM flights
WHERE year=2013 AND month=1 AND day=5 AND hour=12 AND minute<30 AND origin='EWR'
UNION
SELECT month, flight, origin, dest, tailnum FROM flights
WHERE year=2013 AND month=2 AND day=5 AND hour=12 AND minute<20 AND origin='EWR' 
ORDER BY month, flight, origin, dest, tailnum