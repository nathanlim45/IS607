/*IS607 W2 problem1
 To find longest distance, order the data by distance*/
SELECT DISTINCT dest, origin, distance FROM flights
ORDER BY distance DESC limit 1;
/*From JFK To HNL is the longest, distance=4983*/