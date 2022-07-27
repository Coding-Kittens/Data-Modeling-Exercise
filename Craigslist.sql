DROP DATABASE craigslist;
CREATE DATABASE craigslist;
\c craigslist;


CREATE TABLE region(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE user(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
user_name VARCHAR(20) NOT NULL,
preferred_region_id INT REFERENCES region ON DELETE SET NULL
);


CREATE TABLE post(
id SERIAL PRIMARY KEY,
title VARCHAR(20) NOT NULL,
description TEXT NOT NULL,
price FLOAT NOT NULL,
location TEXT NOT NULL,
user_id  INT NOT NULL REFERENCES user ON DELETE CASCADE,
region_id INT REFERENCES region ON DELETE SET NULL
);


CREATE TABLE categories(
id SERIAL PRIMARY KEY,
title TEXT NOT NULL
);


CREATE TABLE cats_of_posts(
id SERIAL PRIMARY KEY,
cat_id INT NOT NULL REFERENCES categories ON DELETE CASCADE,
post_id INT NOT NULL REFERENCES post ON DELETE CASCADE
);


INSERT INTO region(name)
VALUES
('U.S'),
('Euroup'),
('Japan');

INSERT INTO user(name,user_name,preferred_region_id)
VALUES
('nick','LegendOfZelda312',1),
('ruby','CatLover',2);


INSERT INTO post(title,description,price,location,user_id,region_id)
VALUES
('legend of zelda game','An old copy of a legend of zelda game',5.63,'Palm Bay Fl',1,1),
('Cat in Paris','An oil painting of a cat by the Eiffel Tower',60.20,'France',2,2),
('Cat Toy','Homemade cat feather toy',15.23,'France',2,2);

INSERT INTO categories(title)
VALUES
('Art'),
('Decor'),
('Pets'),
('Toys'),
('Homemade'),
('Games');


INSERT INTO cats_of_posts(cat_id,post_id)
VALUES
(6,1),
(1,2),
(2,2),
(5,2),
(3,3),
(4,3),
(5,3);
