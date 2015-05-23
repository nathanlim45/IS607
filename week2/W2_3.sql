


/*After the Join flights table and weather table, I extracted the result and analysed thru R program. W2_3.R file*/
SELECT f.dep_delay, w.temp, w.dewp, w.humid, w.wind_dir, w.wind_speed, w.wind_gust, w.precip, w.pressure, w.visib
FROM flights AS f 
JOIN weather AS w 
ON f.origin=w.origin AND f.year=w.year AND f.month=w.month AND f.day=w.day
WHERE dep_delay>0
ORDER BY dep_delay DESC
