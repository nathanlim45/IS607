/*Q:Do the plane speeds affect to the time in the air?*/
SELECT AVG(flights.distance/flights.air_time), planes.speed 
--to get the speeds, distance is divided by air_time
FROM flights JOIN planes ON flights.tailnum=planes.tailnum
GROUP BY planes.speed
ORDER BY AVG(flights.distance/flights.air_time) DESC;
/*According to the result of the query, 
it is hard to say that there is a relation between speed and time in the air*/