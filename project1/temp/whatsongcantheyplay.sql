SELECT s.name, l.belt, 
(SELECT title FROM songs
 WHERE songs.levels=l.levels
 ORDER BY title LIMIT 0,1) AS song1,
(SELECT title FROM songs
 WHERE songs.levels=l.levels
 ORDER BY title LIMIT 1,1) AS song2
FROM student s
JOIN levelbelt l ON l.levels=s.levels JOIN songs ON songs.levels=l.levels
WHERE s.levels=2
ORDER BY s.name