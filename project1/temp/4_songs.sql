CREATE TABLE songs
(
  song_id serial NOT NULL,
  title character varying,
  levels integer,
  CONSTRAINT song_id PRIMARY KEY (song_id),
  CONSTRAINT levels_fkey FOREIGN KEY (levels)
      REFERENCES levelbelt(levels) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
INSERT INTO songs
(title, levels)
VALUES('get white belt', 1),
('my first solo', 2),
('evening song', 2),
('scouts march', 3),
('march melody', 3),
('song of the wind',4),
('lightly row',4),
('may song',4),
('long, long ago', 5),
('allero', 5),
('in church',6),
('morning song', 6),
('allegretto', 7),
('andantino',7),
('minuet no1',8),
('surprise symphony theme',8),
('twilight serenade',9),
('minuet no2',9),
('gavotte', 10)