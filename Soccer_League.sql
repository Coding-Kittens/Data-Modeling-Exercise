DROP DATABASE sports_league;
CREATE DATABASE sports_league;
\c sports_league;


CREATE TABLE leagues(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
);

CREATE TABLE teams(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  ranking INT,
  league_id INT REFERENCES leagues ON DELETE SET NULL
);

CREATE TABLE players(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  player_number INT NOT NULL,
  team_id INT REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE referees(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  team_id INT REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE games(
  id SERIAL PRIMARY KEY,
  location TEXT NOT NULL,
  game_date DATE
);

CREATE TABLE seasons(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  league_id INT REFERENCES leagues ON DELETE SET NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE referees_in_games(
  id SERIAL PRIMARY KEY,
  game_id INT REFERENCES games ON DELETE SET NULL,
  referee_id INT REFERENCES referees ON DELETE SET NULL
);

CREATE TABLE goals(
  id SERIAL PRIMARY KEY,
  player_id INT REFERENCES players ON DELETE SET NULL,
  game_id INT REFERENCES games ON DELETE SET NULL
);

CREATE TABLE matches(
  id SERIAL PRIMARY KEY,
  game_id INT REFERENCES games ON DELETE SET NULL,
  team_id INT REFERENCES teams ON DELETE SET NULL
);




INSERT INTO leagues(title) VALUES ('some League');

INSERT INTO teams(name,ranking,league_id)
VALUES
('blue team',1,1),
('red team',2,1);

INSERT INTO players(name,player_number,team_id)
VALUES
('Harry',7,1),
('Ron',2,1),
('Ginny',6,1),
('Fred',3,2),
('George',4,2),
('Dobby',1,2);

INSERT INTO referees(name,team_id) VALUES ('James',1),('Snape',2);

INSERT INTO games(location) VALUES('somewhere'),('somewhere else');

INSERT INTO seasons(title,league_id,start_date,end_date) VALUES('summer',1,'2018-05-08','2018-08-08');

INSERT INTO referees_in_games(game_id,referee_id)
VALUES
(1,1),
(1,2)
(2,1),
(2,2);

INSERT INTO goals(player_id,game_id)
VALUES
(1,1),
(3,2),
(6,1),
(1,2);

INSERT INTO matches(game_id,team_id)
VALUES
(1,1),
(1,2),
(2,1),
(2,2);
