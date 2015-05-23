SELECT s.name, l.belt,
(SELECT title FROM songs
WHERE levels=3 LIMIT 1),
(SELECT title FROM songs
WHERE levels=3 LIMIT 1 OFFSET 1) 
FROM student s
JOIN levelbelt l ON s.levels=l.levels
JOIN songs ON songs.levels=l.levels
WHERE s.levels=3