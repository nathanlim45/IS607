
CREATE TABLE levelbelt
(
  levels numeric NOT NULL,
  belt character varying NOT NULL,
  CONSTRAINT levels PRIMARY KEY (levels)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE levelbelt
  OWNER TO postgres;
