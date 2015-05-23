CREATE TABLE levelbelt
(
  level numeric NOT NULL,
  belt character varying NOT NULL,
  song character varying NOT NULL,
  CONSTRAINT level PRIMARY KEY (level)
)
WITH (
  OIDS=FALSE
);

