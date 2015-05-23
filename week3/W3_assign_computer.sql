
--create Laptop computer database
CREATE DATABASE "Laptop_Computer"
	WITH OWNER= postgres
	ENCODING='UTF8'
	TABLESPACE=pg_default
	LC_COLLATE='C'
	LC_CTYPE='C'
	CONNECTION LIMIT = -1;
	
--create laptop brand table
CREATE TABLE laptop_brand
( 
brand_id serial NOT NULL,
name character varying NOT NULL,
country character varying,
homepage character varying,
CONSTRAINT brand_id PRIMARY KEY (brand_id)
)
WITH (
  OIDS=FALSE
);
--insert data into laptop_brand table
INSERT INTO laptop_brand
(name, country, homepage)
VALUES
('apple', 'USA', 'www.apple.com'),
('samsung', 'South Korea', 'www.samsung.com'),
('toshiba', 'Japan', 'www.toshiba.com'),
('asus', 'Taiwan', 'www.asus.com'),
('lenovo', 'China', 'www.lenovo.com');

--create CPU table
CREATE TABLE cpu
( 
cpu_id serial NOT NULL,
model character varying NOT NULL,
brand character varying,
speed character varying,
price numeric,
CONSTRAINT cpu_id PRIMARY KEY (cpu_id)
)
WITH (
  OIDS=FALSE
);
--insert data into cpu table
INSERT INTO cpu
(model, brand, speed, price)
VALUES
('AMD A6 6310', 'AMD', '1.8Ghz', 39.99),
('4th intel core i5 750', 'intel', '2.66Ghz', 195),
('4th intel core i7 4500U', 'intel', '1.8Ghz', 326),
('4th intel core i7 4510U', 'intel', '2.0Ghz', 393);

--create RAM table
CREATE TABLE ram
( 
ram_id serial NOT NULL,
model character varying NOT NULL,
CONSTRAINT ram_id PRIMARY KEY (ram_id)
)
WITH (
  OIDS=FALSE
);
--insert data into cpu table
INSERT INTO ram
(model)
VALUES
('4G DDR3'),
('8G DDR3'),
('6G DDR3');

--create OS table
CREATE TABLE os
( 
os_id serial NOT NULL,
name character varying NOT NULL,
company character varying,
CONSTRAINT os_id PRIMARY KEY (os_id)
)
WITH (
  OIDS=FALSE
);

--insert data into OS table
INSERT INTO os
(name, company)
VALUES
('chrome', 'google'),
('window', 'micro soft'),
('osx', 'apple'),
('linux',NULL);

--create laptop model table including Foreign Key, b
CREATE TABLE model
( 
model_id serial NOT NULL,
name character varying NOT NULL,
cpu_id integer,
ram_id integer,
brand_id integer,
os_id integer,
price numeric,
CONSTRAINT model_id PRIMARY KEY (model_id),
CONSTRAINT cpu_id_fkey FOREIGN KEY (cpu_id)
      REFERENCES cpu (cpu_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT brand_id_fkey FOREIGN KEY (brand_id)
      REFERENCES laptop_brand (brand_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT ram_id_fkey FOREIGN KEY (ram_id)
      REFERENCES ram (ram_id) MATCH SIMPLE,
CONSTRAINT os_id_fkey FOREIGN KEY (os_id)
      REFERENCES os (os_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

--insert data into model table
INSERT INTO model
(name, cpu_id, ram_id, brand_id, os_id, price)
VALUES
('exynos 5', 4, 1, 2, 1, 399.99),
('flip 2 in 1', 2, 2, 4, 2, 949.99),
('macbook pro', 3, 2, 1, 3, 1199.99),
('yoga2 pro 2 in 1', 3, 2, 5, 2, 1099.99),
('satellite 17.3', 1, 3, 3, 2, 515.36);