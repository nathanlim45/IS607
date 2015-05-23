--IS607 W5 assignment
--this table has many null values because JFK temps are missing
COPY --export the table as a csv file
(SELECT f.year, f.month, f.day, f.origin, f.dep_time, f.dest, f.tailnum, f.carrier, w.temp, f.dep_delay, f.arr_delay, f.air_time, p.seats 
FROM flights f
LEFT JOIN planes p ON f.tailnum=p.tailnum 
LEFT JOIN weather w ON f.origin=w.origin 
AND f.year=w.year AND f.month=w.month 
AND f.day=w.day AND round(f.dep_time,-2)=w.hour*100  --Approximate temp of departure time
WHERE f.dest='LAX' AND f.year=2013 AND
((f.month=2 AND f.day>22) OR (f.month=3 AND f.day=1)) --choose the flights to 'LAX' between Feb 23,2013 and Mar 1,2013
)
TO '/Users/shared/flightfromnewyork1.csv' DELIMITER ',' CSV HEADER  --export the table as a csv file
