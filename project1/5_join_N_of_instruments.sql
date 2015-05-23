--Orchetra's instrument distribution

WITH T AS
(SELECT 
    (CASE i.inst_id
        WHEN 1 
            THEN 'violin' 
        WHEN 2
            THEN 'viola'
        WHEN 3
            THEN 'cello'
        WHEN 4
            THEN 'bass'
        ELSE 'NO CHOICE YET' -- in case of NULL VALUE
    END) instrument, 
    COUNT(*) counts, (round(Count(*)* 100.0 / (SELECT COUNT(*) FROM student))) percentage 
FROM student s LEFT JOIN instrument i ON s.inst_id=i.inst_id
GROUP BY i.inst_id
ORDER BY i.inst_id)
SELECT * FROM T UNION ALL SELECT 'TOTAL', SUM(counts), SUM(percentage) FROM T --get total count and percentage


