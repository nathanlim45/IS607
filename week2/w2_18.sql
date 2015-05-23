SELECT tailnum, year, month, day, dep_delay, arr_delay, dest, airports.name 
FROM flights JOIN airports ON flights.dest=airports.faa
WHERE flights.year=2013 AND 
year=2013 AND month=2 AND day>=14 AND day<=17
AND flights.tailnum IN ('N125UW', 'N848MQ', 'N328AA', 'N247JB') 
ORDER BY flights.tailnum
