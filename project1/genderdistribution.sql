--Orchetra's instrument distribution
WITH num AS
(SELECT s.sex, i.instrument, COUNT(*) counts
FROM student s LEFT JOIN instrument i ON s.inst_id=i.inst_id
GROUP BY i.inst_id, s.sex
ORDER BY i.inst_id)
SELECT sex,
(CASE WHEN instrument='violin' THEN counts ELSE NULL END) violin,
(CASE WHEN instrument='viola' THEN counts ELSE NULL END) viola,
(CASE WHEN instrument='cello' THEN counts ELSE NULL END) cello,
(CASE WHEN instrument='bass' THEN counts ELSE NULL END) bass,
(CASE WHEN instrument is null THEN counts ELSE NULL END) Notavailable
FROM num
GROUP BY sex, instrument, counts
ORDER BY instrument