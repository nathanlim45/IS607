SELECT f.year, f.month, f.day, f.origin, f.carrier, w.temp, f.dep_delay, f.arr_delay, f.air_time, p.seats FROM flights f
LEFT JOIN planes p ON f.tailnum=p.tailnum 
LEFT JOIN weather w ON f.origin=w.origin AND f.year=w.year AND f.month=w.month AND f.day=w.day
WHERE f.dest='LAX' AND f.year=2013 AND 
((f.month=2 AND f.day>22) OR (f.month=3 AND f.day=1))