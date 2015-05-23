SELECT classroom, nw, ny, z
FROM
(SELECT classroom, COUNT(name) nw
FROM student s 
LEFT JOIN levelbelt l ON l.levels=s.levels
LEFT JOIN class c ON c.class_id=s.class_id
WHERE l.belt='white belt'
GROUP BY classroom) AS w,
(SELECT classroom, COUNT(name) ny
FROM student s 
LEFT JOIN levelbelt l ON l.levels=s.levels
LEFT JOIN class c ON c.class_id=s.class_id
WHERE l.belt='yellow belt'
GROUP BY classroom) AS y,
(SELECT classroom, COUNT(name) z
FROM student s 
LEFT JOIN levelbelt l ON l.levels=s.levels
LEFT JOIN class c ON c.class_id=s.class_id
WHERE l.belt=null
GROUP BY classroom) AS n,
LEFT JOIN class c ON c.class_id=s.class_id
ORDER BY classroom