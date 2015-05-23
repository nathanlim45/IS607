--Orchetra's instrument distribution
SELECT 
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
    COUNT(*) counts, s.sex
FROM student s LEFT JOIN instrument i ON s.inst_id=i.inst_id
GROUP BY i.inst_id, s.sex
ORDER BY i.inst_id


