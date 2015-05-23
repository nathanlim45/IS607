CREATE TABLE levelbelt
(
  levels numeric NOT NULL,
  belt character varying NOT NULL,
  CONSTRAINT levels PRIMARY KEY (levels)
)
WITH (
  OIDS=FALSE
);

INSERT INTO levelbelt
(levels, belt)
VALUES (1, 'white belt'),
(2,'yellow belt'),
(3,'orange belt'),
(4,'green belt'),
(5,'blue belt'),
(6,'purple belt'),
(7,'red belt'),
(8,'brown belt'),
(9,'black belt'),
(10,'gold belt');