CREATE TABLE class
(
  class_id serial NOT NULL,
  classroom numeric,
  grade int,
  CONSTRAINT class_id PRIMARY KEY (class_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE class
  OWNER TO postgres;

INSERT INTO class
(classroom, grade)
VALUES(401,4),
(402,4),(403,4),(501,5),(502,5),(503,5),(504,4),(505,5);