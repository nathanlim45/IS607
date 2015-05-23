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