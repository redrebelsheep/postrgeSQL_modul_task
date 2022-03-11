

-- create tables command
create CREATE DATABASE vacations;

CREATE TABLE destinations (
  id serial,
  name varchar(255) NOT NULL,
  cost_of_flight integer,
  average_temp integer,
  has_beach BOOLEAN,
  has_mountains BOOLEAN
);

CREATE TABLE airlines (
  id serial,
  name varchar(255) NOT NULL
);


-- Insert commands 
INSERT INTO destinations (name, average_temp, cost_of_flight, has_beach, has_mountains ) VALUES ('Thailand', 82, 765, true, true);
INSERT INTO destinations (name, average_temp, cost_of_flight, has_beach, has_mountains ) VALUES ('Minnesota', 41, 235, false, false);
INSERT INTO destinations (name, average_temp, cost_of_flight, has_beach, has_mountains ) VALUES ('New Zealand', 66, 433, true, true);
INSERT INTO destinations (name, average_temp, cost_of_flight, has_beach, has_mountains ) VALUES ('Tristan da Cunha', 59, 1304, true, true);
INSERT INTO destinations (name, average_temp, cost_of_flight, has_beach, has_mountains ) VALUES ('England', 45, 290, false, false);

INSERT INTO airlines (name) values('Spirit');
INSERT INTO airlines (name) values('Lufthansa');
INSERT INTO airlines (name) values('Delta');
INSERT INTO airlines (name) values('Southwest');

CHALLENGE 1
All of the vacation destinations.
SELECT *
	FROM destinations;
1	"Thailand"	765	82	true	true
2	"Minnesota"	235	41	false	false
3	"New Zealand"	433	66	true	true
4	"Tristan da Cunha"	1304	59	true	true
5	"England"	290	45	false	false

ChALLENGE 2
SELECT *
	FROM destinations where has_beach=true;
1	"Thailand"	765	82	true	true
3	"New Zealand"	433	66	true	true
4	"Tristan da Cunha"	1304	59	true	true

CHALLENGE 3
SELECT *
	FROM destinations where average_temp>60;
1	"Thailand"	765	82	true	true
3	"New Zealand"	433	66	true	true

CHALLENGE 4 
SELECT *
	FROM destinations where has_beach=true AND has_mountains=true;
1	"Thailand"	765	82	true	true
3	"New Zealand"	433	66	true	true
4	"Tristan da Cunha"	1304	59	true	true  

CHALLENGE 5
SELECT *
	FROM destinations where cost_of_flight<500 AND has_mountains=true;
 3	"New Zealand"	433	66	true	true  

CHALLENGE 6
 INSERT INTO destinations (name, average_temp, cost_of_flight, has_beach, has_mountains ) 
VALUES ('Bahamas', 78, 345, true, false);

CHALLENGE 7
Update destinations set cost_of_flight = 1000 where name = 'New Zealand';

CHALLENGE 8
DELETE FROM destinations where name = 'Minnesota';

CHALLENGE 9 
Update destinations set name = 'Scotland' where name = 'England';

CHALLENGE 10 
ALTER TABLE destinations 
ADD PRIMARY KEY (id);

ALTER TABLE airlines 
ADD PRIMARY KEY (id);

CREATE TABLE airlines_destinations (
id serial,
airline_id integer,
destination_id integer,
FOREIGN KEY(airline_id) REFERENCES airlines(id),
FOREIGN KEY(destination_id) REFERENCES destinations(id)
);

Insert into airlines_destinations (airline_id, destination_id) values (1,3);
Insert into airlines_destinations (airline_id, destination_id) values (1,5);
Insert into airlines_destinations (airline_id, destination_id) values (2,4);
Insert into airlines_destinations (airline_id, destination_id) values (2,5);
Insert into airlines_destinations (airline_id, destination_id) values (2,1);
Insert into airlines_destinations (airline_id, destination_id) values (3,1);
Insert into airlines_destinations (airline_id, destination_id) values (3,5);
Insert into airlines_destinations (airline_id, destination_id) values (4,3);
Insert into airlines_destinations (airline_id, destination_id) values (4,4);

CHALLENGE 11
select a.name, d.name from airlines as a 
inner join airlines_destinations as ad
ON a.id = ad.airline_id 
inner join destinations as  d on ad.destination_id = d.id 
where d.name = 'New Zealand';

CHALLENGE 12
SELECT DISTINCT a.name FROM airlines 
AS a JOIN airlines_destinations AS ad ON a.id = ad.airline_id 
WHERE airline_id NOT IN
(SELECT airline_id FROM airlines_destinations WHERE destination_id = 4);

CHALLENGE 13
SELECT *
	FROM destinations;

