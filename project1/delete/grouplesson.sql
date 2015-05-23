CREATE TABLE grouplesson
(
  group_id serial NOT NULL,
  name int NOT NULL,
  CONSTRAINT group_id PRIMARY KEY (group_id)
)
WITH (
  OIDS=FALSE
);
