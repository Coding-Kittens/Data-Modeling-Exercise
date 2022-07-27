-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic;


CREATE TABLE travler
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE country(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE city(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE location(
  id SERIAL PRIMARY KEY,
  city_id INT NOT NULL REFERENCES city ON DELETE CASCADE,
  country_id INT NOT NULL REFERENCES country ON DELETE CASCADE
);

CREATE TABLE airline()
{
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
};

CREATE TABLE plane
(
  id SERIAL PRIMARY KEY,
  airline_id INT NOT NULL REFERENCES airline ON DELETE CASCADE,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  start_location INT NOT NULL REFERENCES location ON DELETE CASCADE,
  destanation INT NOT NULL REFERENCES location ON DELETE CASCADE
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  terminal TEXT NOT NULL,
  boarding_group TEXT NOT NULL,
  boarding_time TIMESTAMP NOT NULL,
  travler_id INT NOT NULL REFERENCES travler ON DELETE CASCADE,
  plane_id INT REFERENCES plane ON DELETE SET NULL
);



INSERT INTO travler(first_name,last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');


INSERT INTO country(name)
VALUES
('United States'),
('United Kingdom'),
('Mexico'),
('Morocco'),
('China'),
('Chile'),
('Japan'),
('France'),
('UAE'),
('Brazil');

INSERT INTO city(name)
VALUES
('Washington DC'),
('Seattle'),
('Tokyo'),
('London'),
('Los Angeles'),
('Las Vegas'),
('Mexico City'),
('Paris'),
('Casablanca'),
('Dubai'),
('Beijing'),
('New York'),
('Charlotte'),
('Cedar Rapids'),
('Chicago'),
('New Orleans'),
('Sao Paolo'),
('Santiago');



INSERT INTO location(city_id,country_id)
VALUES
(1,1),
(2,1),
(5,1),
(6,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(4,2),
(7,3),
(9,4),
(11,5),
(18,6),
(3,7),
(8,8),
(10,9),
(17,10);



INSERT INTO airline(name)
VALUES
('United'),
('American Airlines'),
('Delta'),
('British Airways'),
('Avianca Brasil'),
('Air China'),
('TUI Fly Belgium');

INSERT INTO plane(airline_id,departure,arrival,start_location,destanation)
VALUES
(1,'2018-04-08 09:00:00', '2018-04-08 12:00:00',1,2),
(4,'2018-12-19 12:45:00', '2018-12-19 16:15:00',15,10),
(3,'2018-01-02 07:00:00', '2018-01-02 08:03:00',3,4),
(3,'2018-04-15 16:50:00', '2018-04-15 21:00:00',2,11),
(7,'2018-08-01 18:30:00', '2018-08-01 21:50:00',16,12),
(6,'2018-10-31 01:15:00', '2018-10-31 12:55:00',17,13),
(1,'2019-02-06 06:00:00', '2019-02-06 07:47:00',5,6),
(2,'2018-12-22 14:42:00', '2018-12-22 15:56:00',7,8),
(2,'2019-02-06 16:28:00', '2019-02-06 19:18:00',8,9),
(5,'2019-01-20 19:30:00', '2019-01-20 22:45:00',18,14);


INSERT INTO tickets(seat,terminal,boarding_group,boarding_time,travler_id,plane_id)
VALUES
('33B','D12','A1','2018-04-08 08:30:00',1,1),
('8A','E13','A12','2018-12-19 12:15:00',2,2),
('12F','D1','B2','2018-01-02 06:30:00',3,3),
('20A','A23','E13','2018-04-15 16:20:00',1,4),
('23D','A4','B2','2018-08-01 18:00:00',4,5),
('18C','C22','C10','2018-10-31 24:45:00',2,6),
('9E','D3','E1','2019-02-06 05:30:00',5,7),
('1A','D5','B2','2018-12-22 14:12:00',6,8),
('32B','D73','C4','2019-02-06 15:58:00',5,9),
('10D','A30','C3','2019-01-20 19:00:00',7,10);
