CREATE TABLE instrument
(
  inst_id serial NOT NULL,
  instrument character varying NOT NULL,
  rental_price numeric,
  CONSTRAINT inst_id PRIMARY KEY (inst_id)
)
WITH (
  OIDS=FALSE
);

INSERT INTO instrument
(instrument, rental_price)
VALUES ('violin',120),('viola',120),('cello',185),('bass',220);