/*Average seats according to number of engines*/
SELECT engines, AVG(seats) FROM planes
GROUP BY engines
ORDER BY AVG(seats) DESC;
/*3 engines plane has the highest seat number, 256.67*/

/*Average seats according to tailnums*/
SELECT tailnum, AVG(seats) FROM planes
GROUP BY tailnum
ORDER BY AVG(seats) DESC;
/*N670US has the highest seat number, 450*/

/*Average seats according to manufacturer*/
SELECT manufacturer, AVG(seats) FROM planes
GROUP BY manufacturer
ORDER BY AVG(seats) DESC;
/*AIRBUS has the highest seat number, 221.20*/

/*Average seats according to engine type*/
SELECT type, AVG(seats) FROM planes
GROUP BY type
ORDER BY AVG(seats) DESC;
/*Fixed wing multi engine has the highest seat number, 155.68*/
