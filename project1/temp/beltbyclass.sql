CREATE VIEW y as
(SELECT classroom, COUNT(name) ny
FROM student s 
LEFT JOIN levelbelt l ON l.levels=s.levels
LEFT JOIN class c ON c.class_id=s.class_id
WHERE l.belt='yellow belt'
GROUP BY classroom);

CREATE VIEW o as
(SELECT classroom, COUNT(name) ob
FROM student s 
LEFT JOIN levelbelt l ON l.levels=s.levels
LEFT JOIN class c ON c.class_id=s.class_id
WHERE l.belt='orange belt'
GROUP BY classroom);

CREATE VIEW n as
(SELECT classroom, COUNT(name) z
FROM student s 
LEFT JOIN levelbelt l ON l.levels=s.levels
LEFT JOIN class c ON c.class_id=s.class_id
WHERE l.belt is null
GROUP BY classroom);

SELECT w.classroom, n.z AS nobelt, w.nw AS whitebelt, y.ny AS yellowbelt, 
       o.ob AS orangebelt
FROM
(SELECT classroom, COUNT(name) nw
FROM student s 
LEFT JOIN levelbelt l ON l.levels=s.levels
LEFT JOIN class c ON c.class_id=s.class_id
WHERE l.belt='white belt'
GROUP BY classroom) w
FULL JOIN y ON w.classroom=y.classroom
FULL JOIN o ON w.classroom=o.classroom
FULL JOIN n ON w.classroom=n.classroom