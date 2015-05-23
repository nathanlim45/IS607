CREATE TABLE songs
(
  song_id serial NOT NULL,
  title character varying,
  levels integer,
  inst_id integer,
  CONSTRAINT song_id PRIMARY KEY (song_id),
  CONSTRAINT inst_id_fkey FOREIGN KEY (inst_id)
      REFERENCES instrument (inst_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT levels_fkey FOREIGN KEY (levels)
      REFERENCES levelbelt(levels) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

INSERT INTO songs
(title, levels, inst_id)
VALUES('get white belt', 1,1),
('my first solo', 2, 1),
('evening song', 2, 1),
('scouts march', 3, 1),
('march melody', 3, 1),
('song of the wind',4,1),
('lightly row',4,1),
('may song',4,1),
('long, long ago', 5,1),
('allero', 5,1),
('in church',6,1),
('morning song', 6, 1),
('allegretto', 7, 1),
('andantino',7,1),
('minuet no1',8,1),
('surprise symphony theme',8,1),
('twilight serenade',9,1),
('minuet no2',9,1),
('gavotte', 10,1)