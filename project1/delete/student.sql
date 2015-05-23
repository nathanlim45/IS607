CREATE TABLE student
(
  student_id serial NOT NULL,
  name character varying NOT NULL,
  sex char(1),
  class_id integer,
  inst_id integer,
  levels integer,
  CONSTRAINT student_id PRIMARY KEY (student_id),
  CONSTRAINT class_id_fkey FOREIGN KEY (class_id)
      REFERENCES class (class_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT inst_id_fkey FOREIGN KEY (inst_id)
      REFERENCES instrument (inst_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT levels_fkey FOREIGN KEY (levels)
      REFERENCES levelbelt (levels) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE class
  OWNER TO postgres;
