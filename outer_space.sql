-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space;


CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE stars
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
galaxy INT NOT NULL REFERENCES galaxies ON DELETE CASCADE
);

CREATE TABLE satellites
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period TEXT NOT NULL,
  orbits_around_satellite INT REFERENCES satellites ON DELETE CASCADE,
  orbits_around_star INT REFERENCES stars ON DELETE CASCADE,
  galaxy INT NOT NULL REFERENCES galaxies ON DELETE CASCADE
);



INSERT INTO galaxies(name) VALUES ('Milky Way');


INSERT INTO stars(name,galaxy)
VALUES
('The Sun',1),
('Proxima Centauri',1),
('Gliese 876',1);

INSERT INTO satellites (name,orbital_period,orbits_around_star,galaxy)
VALUES
('Earth','1y',1,1),
('Mars','1.88y',1,1),
('Venus','0.62y',1,1),
('Neptune','164.8y',1,1),
('Proxima Centauri b','0.03y',2,1),
('Gliese 876 b','0.23y',3,1);

INSERT INTO satellites (name,orbital_period,orbits_around_satellite,galaxy)
VALUES
('The Moon','27d',1,1),
('Phobos','8hr',2,1),
('Deimos','30hr',2,1),
('Naiad','7hr',4,1),
('Thalassa','7hr',4,1),
('Despina','8hr',4,1),
('Galatea','10hr',4,1),
('Larissa','13hr',4,1),
('S/2004 N 1','23hr',4,1),
('Proteus','27hr',4,1),
('Triton','5d 21hr',4,1),
('Nereid','360d',4,1),
('Halimede','5y 54d',4,1),
('Sao','7y 358d',4,1),
('Laomedeia','8y 251d',4,1),
('Psamathe','25y',4,1),
('Neso','27y',4,1);
