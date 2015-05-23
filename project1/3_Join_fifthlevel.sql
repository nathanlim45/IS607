--5th graders level

SELECT s.name, i.instrument, l.belt,
      (CASE 
         WHEN l.levels=1 THEN 'Good'
         WHEN l.levels=2 THEN 'Better than good'
         WHEN l.levels>=3 THEN 'Great'
         WHEN l.levels is null THEN 'No belt yet!'   --in case that level is null, the student did not pass any level test yet.
         ELSE 'check!!'
      END) Status
FROM student s LEFT JOIN levelbelt l ON s.levels=l.levels
LEFT JOIN instrument i ON i.inst_id=s.inst_id
LEFT JOIN class c ON c.class_id=s.class_id
WHERE c.grade=5
ORDER BY l.levels DESC;