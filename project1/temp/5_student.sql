﻿CREATE TABLE student
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