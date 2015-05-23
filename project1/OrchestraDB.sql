--The school is one of NYC public schools in Bronx. 
--It has recently started Orchestra program. 
--This database is to manage the orchestra and its students' practice.

CREATE DATABASE "Orchestra"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'C'
       LC_CTYPE = 'C'
       CONNECTION LIMIT = -1;

--Create class table, the orchestra consists of 4th graders and 5th graders
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
(402,4),(403,4),(501,5),(502,5),(503,5),(504,4),(505,5);  --504 classroom is used by 4th grade students




--Create instrument table, there are four kinds of instruments
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


--Create levelbelt table, each color shows students' level of playing instruments
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


--Create songs table that has one foreign key from levelbelt table
-- the student has to play certain songs in front of the teacher to get a level belt
CREATE TABLE songs
(
  song_id serial NOT NULL,
  title character varying,
  levels integer,
  CONSTRAINT song_id PRIMARY KEY (song_id),
  CONSTRAINT levels_fkey FOREIGN KEY (levels)
      REFERENCES levelbelt(levels) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
INSERT INTO songs
(title, levels)
VALUES('get white belt', 1),
('my first solo', 2),
('evening song', 2),
('scouts march', 3),
('march melody', 3),
('song of the wind',4),
('lightly row',4),
('may song',4),
('long, long ago', 5),
('allero', 5),
('in church',6),
('morning song', 6),
('allegretto', 7),
('andantino',7),
('minuet no1',8),
('surprise symphony theme',8),
('twilight serenade',9),
('minuet no2',9),
('gavotte', 10);


--Create student table that has three Foreign keys, two students have NULL values
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

INSERT INTO student
(class_id, inst_id, name, sex, levels)
VALUES  (7,1,'Naima Agarrat','f', 2),
(2,3,'Nathan Anderson','m', 2),
(4,3,'Mohan Bishnudat','m', 2),
(7,3,'Greann Brown','f', 1),
(1,2,'Rohanna Buchanan','f', 1),
(7,1,'Benjamin Byfield','m', 2),
(7,2,'Marlon Eliot','m', 2),
(6,1,'Alicia Fleming','f', 1),
(7,2,'Justin Forbes','m', 1),
(8,2,'Jaeden Fore','m', 1),
(2,4,'Tarick Fuller','m', 1),
(5,2,'Lamere Grant-Constantine','m', 2),
(4,1,'Destiney Green','f', 3),
(7,2,'Jaedean Hall','f', 2),
(5,null,'Nathan Fore','m', null),  -- he submitted application, but he's never shown up to the orchestra
(4,1,'Jahde Harley','f', 2),
(4,2,'Joshua Hart','m', 2),
(3,1,'Shani Hedge','f', 2),
(1,1,'Wayne Jones','m', 1),
(1,1,'Amanda Joseph','f', 1),
(1,1,'Deandre Kidd','m', 1),
(5,1,'Cheyenne Kinard','f', 2),
(8,2,'Milanya Lamar','f', 1),
(5,3,'Kymura Lamar','f', 1),
(4,1,'Asauna Lawrence','f', 3),
(3,2,'Razi Martin','m', 1),
(5,3,'Sebastian Mason','m', 2),
(4,2,'Krysanthe Mattis','f', 2),
(5,4,'Olivia McCallum','f', 3),
(1,3,'Kaden Moodie','m', 1),
(3,1,'Kira Moodie','f', 1),
(1,1,'Justin Morgan','m', 1),
(7,1,'Sarah Parker','f', 2),
(3,3,'Eric Payne','m', 1),
(7,1,'Christine Ray','f', 1),
(2,1,'Diamond Richardson','f', 2),
(5,1,'Milan Rivera','f', 1),
(7,3,'Skyla Sayers','f', 2),
(4,1,'Rachael Scott','f', 2),
(5,4,'Renee Scott','f', 3),
(4,2,'Jason Sukhram','m', 2),
(4,1,'Imani Talabera','f', 2),
(5,2,'Tyrese Taylor','m', 3),
(6,1,'Gabriel Wallace','f',null), -- she didn't pass any level test yet
(5,2,'Ronique Walters','f', 2),
(2,1,'Immanuel Welsh','m', 2),
(5,3,'Nathaniel Williams','m', 2),
(2,2,'Josiah Woodhouse','m', 2);
