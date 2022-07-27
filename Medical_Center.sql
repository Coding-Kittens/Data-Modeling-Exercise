
DROP DATABASE medical_centers;
CREATE DATABASE medical_centers;
\c medical_Centers;


CREATE TABLE centers(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
);

CREATE TABLE docters(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  center_id INT NOT NULL REFERENCES centers ON DELETE CASCADE
);

CREATE TABLE patients(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  center_id INT NOT NULL REFERENCES centers ON DELETE CASCADE
);

CREATE TABLE diseases(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT
);

CREATE TABLE docters_patients(
  id SERIAL PRIMARY KEY,
  docters_id INT REFERENCES docters ON DELETE SET NULL,
  patient_id INT NOT NULL REFERENCES patients ON DELETE CASCADE
);


CREATE TABLE patients_diseases(
  id SERIAL PRIMARY KEY,
  patient_id INT NOT NULL REFERENCES patients ON DELETE CASCADE,
  disease_id INT NOT NULL REFERENCES diseases ON DELETE CASCADE
);

INSERT INTO centers(name) VALUES('Random center');

INSERT INTO docters(first_name,last_name,center_id)
VALUES
('Thadeus', 'Gathercoal',1),
('Waneta', 'Skeleton',1);


INSERT INTO patients(first_name,last_name,center_id)
VALUES
('Jennifer', 'Finch',1),
('Berkie', 'Wycliff',1);


INSERT INTO diseases(name)
VALUES
('flu'),
('cold');


INSERT INTO docters_patients(docters_id,patient_id)
VALUES
(1,2),
(2,1),
(2,2);

INSERT INTO patients_diseases(patient_id,disease_id)
VALUES
(1,1),
(2,1),
(2,2);
