CREATE TABLE  Movies (
    movie_id int PRIMARY KEY,
    movie_name VARCHAR(40),
    release_date DATE
);

CREATE TABLE Gender (
    gender_id int PRIMARY KEY,
    name VARCHAR(40)
);

CREATE TABLE Actors (
    actor_id int PRIMARY KEY,
    actor_name VARCHAR(40),
    gender int REFERENCES gender(gender_id)
);

CREATE TABLE Characters (
    character_id int PRIMARY KEY,
    character_name VARCHAR(40),
    actor_id int REFERENCES Actors(actor_id),
    movie_id int REFERENCES Movies(movie_id)
);

INSERT INTO Movies 
(movie_id, movie_name, release_date)
VALUES
(1, 'Your Name', '2016/07/03'),
(2, 'Senhor dos anéis: o retorno do rei', '2003/12/01'),
(3, 'Django Unchained', '2013-01-18'),
(4, 'Inception', '2010-08-06'),
(5, 'Pulp Fiction', '1995-02-18');

INSERT INTO Gender 
(gender_id, name)
VALUES
(1, 'Female'),
(2, 'Male');

INSERT INTO Actors
(actor_id, actor_name, gender)
VALUES
(1, 'Mone Kamishiraishi', 1),
(2, 'Orlando Bloom', 2),
(3, 'Leonardo DiCaprio', 1),
(4, 'Samuel L. Jackson', 2),
(5, 'Uma Turman', 1);

INSERT INTO Characters
(character_id, character_name, actor_id, movie_id)
VALUES
(1, 'Mitsuha Miyamizu', 1, 1),
(2, 'Legolas', 2, 2),
(3, 'Calvin Candle', 3, 3),
(4, 'Cobb', 3, 4),
(5, 'Jules Winnfield', 4, 5);

SELECT * 
FROM Movies 
WHERE release_date < '2011/01/01';

UPDATE Actors 
SET actor_name='Uma Thurman' 
WHERE actor_name='Uma Turman';

ALTER TABLE Actors
ADD birth_date DATE;

UPDATE Actors 
SET birth_date='1977/01/13'
WHERE actor_name='Orlando Bloom';
