SELECT flight, origin, flights.tailnum, dest, airports.name, manufacturer, seats
FROM flights
INNER JOIN airports
ON flights.dest = airports.faa
LEFT JOIN planes
ON flights.tailnum=planes.tailnum
WHERE flights.year=2013 AND month=11 and day=5 and hour=12 and minute<30 and origin='JFK'