-- Week2HOLSolutions.sql

-- All of the queries use tables in the flights database.  

-- 1. Write a SELECT statement that returns all of the rows and columns in the airplanes table

SELECT * FROM planes;

-- 2. Using the weather table, concatenate the year, month, and day columns to display a date in the form "3/17/2013"
-- see:  http://www.postgresql.org/docs/9.1/static/functions-string.html; PostgreSQL delimiter is ||
-- note that PostgreSQL does not support computed columns directly; there are ways to implement this in a function or a view


SELECT Month  || '/' || Day || '/' || Year FROM weather;

-- 3. Order by planes table by number of seats, in descending order.

SELECT * FROM planes ORDER BY seats DESC;

-- 4. List only those planes that have an engine that is "Reciprocating"

SELECT * FROM planes WHERE engine = 'Reciprocating';

-- 5. List only the first 5 rows in the flights table

SELECT * FROM flights LIMIT 5;

-- 6. What was the longest (non-blank) air time?

SELECT air_time FROM flights WHERE air_time > 0 ORDER BY air_time DESC LIMIT 1;

-- 7. What was the shortest (non-blank) air time for Delta?

SELECT air_time FROM flights WHERE air_time > 0 AND carrier = 'DL' ORDER BY air_time LIMIT 1;

-- 8. Show all of the Alaska Airlines flights between June 1st, 2013 and June 3rd, 2013.  Is the way the data is stored in the database
--    helpful to you in making your query?

SELECT * 
  FROM flights 
 WHERE carrier = 'AS' 
   AND year = 2013 AND month = 6 AND day >= 1 AND day <= 3;

-- or

SELECT * 
  FROM flights 
 WHERE carrier = 'AS' 
   AND year = 2013 AND month = 6 AND day BETWEEN 1 AND 3;

--9.  Show all of the airlines whose names contain 'America'
 SELECT * FROM airlines WHERE name LIKE '%America%';

--10. How many flights went to Miami?

SELECT COUNT(*) FROM flights WHERE dest = 'MIA';

--11. Were there more flights to Miami in January 2013 or July 2013?  (Multiple queries are OK)

SELECT COUNT(*) FROM flights WHERE dest = 'MIA' AND year = 2013 AND month = 1;
SELECT COUNT(*) FROM flights WHERE dest = 'MIA' AND year = 2013 AND month = 7;

--12. what is the average altitude of airports?

SELECT AVG(alt) FROM airports;

--13. What is the average altitude of the three major New York airports?

SELECT AVG(alt) FROM airports WHERE faa IN ('EWR','LGA','JFK');

SELECT AVG(alt) FROM airports WHERE faa = 'EWR' OR faa = 'LGA' OR faa = 'JFK';

--14. What is the average altitude for airports grouped by timezone.  Which timezone has the highest altitude?  Why?

SELECT tz, AVG(alt) 
FROM airports
GROUP BY tz
ORDER BY tz;

-- 15. Which of these four airplanes made the most flights out of New York City airports in 2013?
-- Plane tailnums: 'N125UW','N848MQ','N328AA','N247JB'
SELECT tailnum, COUNT(*)
  FROM flights WHERE tailnum IN ('N125UW','N848MQ','N328AA','N247JB')
  GROUP BY tailnum
  ORDER BY COUNT(*) DESC;

-- 16. For each of these planes, show the corresponding meta-data (model, manufacturer, engines, etc.) about each plane?  
-- What is surprising about the information returned?  How do you think this could happen?
SELECT * 
FROM planes
WHERE tailnum IN ('N125UW','N848MQ','N328AA','N247JB');

-- 17. Write a SELECT statement that shows for all of the flights during the period February 14th to February 17th  
-- for each of the four planes above: 'N125UW','N848MQ','N328AA','N247JB'
-- Your select statement should return the following information:  
-- tailnum, flight date information, departure delay, arrival delay, 3 digit destination code
SELECT tailnum, year, month, day, dep_delay, arr_delay, dest
FROM flights 
WHERE year = 2013 AND month = 2 AND day BETWEEN 14 AND 17 AND
      tailnum IN ('N125UW','N848MQ','N328AA','N247JB')
ORDER BY tailnum;


-- 18. Add a join clause, to also show destination airport name.  
--    How many rows were returned?

SELECT tailnum, year, month, day, dep_delay, arr_delay, dest, airports.name
FROM flights JOIN airports
ON flights.dest = airports.faa
WHERE flights.year = 2013 AND month = 2 AND day BETWEEN 14 AND 17 AND
      flights.tailnum IN ('N125UW','N848MQ','N328AA','N247JB')
ORDER BY flights.tailnum;

-- 19. now use a LEFT JOIN instead.  How many rows were returned?

SELECT tailnum, year, month, day, dep_delay, arr_delay, dest, airports.name
FROM flights LEFT JOIN airports
ON flights.dest = airports.faa
WHERE flights.year = 2013 AND month = 2 AND day BETWEEN 14 AND 17 AND
      flights.tailnum IN ('N125UW','N848MQ','N328AA','N247JB')
ORDER BY flights.tailnum;


-- 20. Add a second left join clause to also show the number of seats in the planes
SELECT flights.tailnum, flights.year, month, day, dep_delay, arr_delay, dest, airports.name, planes.seats
FROM flights
LEFT JOIN airports ON flights.dest = airports.faa 
LEFT JOIN planes ON flights.tailnum = planes.tailnum
WHERE flights.year = 2013 AND month = 2 AND day BETWEEN 14 AND 17 AND
      flights.tailnum IN ('N125UW','N848MQ','N328AA','N247JB')
ORDER BY flights.tailnum;


-- 21. rewrite your query using table aliases
SELECT f.tailnum, f.year, month, day, dep_delay, arr_delay, dest, a.name, p.seats
FROM flights f
LEFT JOIN airports a ON f.dest = a.faa 
LEFT JOIN planes p ON f.tailnum = p.tailnum
WHERE f.year = 2013 AND month = 2 AND day BETWEEN 14 AND 17 AND
      f.tailnum IN ('N125UW','N848MQ','N328AA','N247JB')
ORDER BY f.tailnum;


-- 22. What are the names of the five airports that receive the most flights?  

SELECT airports.name, COUNT(*) FROM flights
INNER JOIN airports
ON flights.dest = airports.faa
GROUP BY airports.name
ORDER BY COUNT(*) DESC LIMIT 5;

-- 23. What are American Airlines’ destination cities from the New York airports?

SELECT DISTINCT airports.name AS airport
 FROM flights JOIN airports
   ON flights.dest = airports.faa
   JOIN airlines
   ON flights.carrier = airlines.carrier
   WHERE airlines.name LIKE 'Am%'
   ORDER BY airport;  









   



