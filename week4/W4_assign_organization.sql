-- Database: organization

-- DROP DATABASE organization;

CREATE DATABASE organization
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'C'
       LC_CTYPE = 'C'
       CONNECTION LIMIT = -1;

CREATE TABLE etm
(
  employee_id serial NOT NULL,
  name character varying NOT NULL,
  job_title character varying,
  team character varying,
  supervisor_id integer,
  CONSTRAINT employee_id PRIMARY KEY (employee_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE etm
  OWNER TO postgres;

INSERT INTO etm
(name, job_title, team, supervisor_id)
VALUES('Michael Schaefer', 'ceo', NULL, NULL),
('Emiily Susskind', 'vp', NULL, 1),
('Rob Weisstuch', 'vp', NULL, 1),
('Katherine Elliott', 'director', 'sales', 2),
('Aly Alibhai', 'director', 'production', 2),
('Joshua Bell', 'director', 'marketing', 3),
('Rick Dobbis', 'director', 'human resource', 1),
('Aidan Fitzmaurice', 'secretary', NULL, 1),
('Victor Goldberg', 'sales analyst', 'sales', 4),
('Karen Karlsrud', 'manager', 'sales', 4),
('Andrew Malik', 'production analyst', 'production', 5),
('Joseph Mcdonald', 'manager', 'production', 5),
('Lori Murphy', 'marketing analyst', 'marketing', 6),
('Amie Patel', 'manager', 'marketing', 6),
('Steven Williams', 'manager', 'marketing', 6),
('Diana Broberg', 'recruiter', 'human resource', 7);


