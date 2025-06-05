CREATE DATABASE MOVIES;
-- Table: directors
CREATE TABLE directors (
    director_id INT PRIMARY KEY,
    director_name VARCHAR(255) NOT NULL
);

-- Table: actors
CREATE TABLE actors (
    actor_id INT PRIMARY KEY,
    actor_name VARCHAR(255) NOT NULL
);

-- Table: studios
CREATE TABLE studios (
    studio_id INT PRIMARY KEY,
    studio_name VARCHAR(255) NOT NULL
);

-- Table: genres
CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

-- Table: movies
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    director_id INT,
    studio_id INT,
    genre_id INT,
    FOREIGN KEY (director_id) REFERENCES directors(director_id),
    FOREIGN KEY (studio_id) REFERENCES studios(studio_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- Table: reviews
CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    rating DECIMAL(3, 1),
    review_text TEXT,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Table: users
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Table: movie_actors (to represent the many-to-many relationship between movies and actors)
CREATE TABLE movie_actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);
-- Insert 10 values into the directors table
INSERT INTO directors (director_id, director_name) VALUES
(1, 'Christopher Nolan'),
(2, 'Quentin Tarantino'),
(3, 'Steven Spielberg'),
(4, 'Martin Scorsese'),
(5, 'David Fincher'),
(6, 'James Cameron'),
(7, 'Ridley Scott'),
(8, 'Coen Brothers'),
(9, 'Wes Anderson'),
(10, 'Francis Ford Coppola');

-- Insert 10 values into the actors table
INSERT INTO actors (actor_id, actor_name) VALUES
(1, 'Tom Hanks'),
(2, 'Leonardo DiCaprio'),
(3, 'Scarlett Johansson'),
(4, 'Brad Pitt'),
(5, 'Meryl Streep'),
(6, 'Johnny Depp'),
(7, 'Jennifer Lawrence'),
(8, 'Robert De Niro'),
(9, 'Emma Stone'),
(10, 'Cate Blanchett');

-- Insert 10 values into the studios table
INSERT INTO studios (studio_id, studio_name) VALUES
(1, 'Warner Bros.'),
(2, 'Paramount Pictures'),
(3, 'Universal Pictures'),
(4, '20th Century Studios'),
(5, 'Sony Pictures'),
(6, 'Disney'),
(7, 'Columbia Pictures'),
(8, 'MGM'),
(9, 'Miramax'),
(10, 'Focus Features');

-- Insert 10 values into the genres table
INSERT INTO genres (genre_id, genre_name) VALUES
(1, 'Action'),
(2, 'Drama'),
(3, 'Comedy'),
(4, 'Sci-Fi'),
(5, 'Thriller'),
(6, 'Horror'),
(7, 'Romance'),
(8, 'Adventure'),
(9, 'Crime'),
(10, 'Fantasy');

-- Insert 10 values into the users table
INSERT INTO users (  UserID,username, email) VALUES
(1, 'user1', 'user1@example.com'),
(2, 'user2', 'user2@example.com'),
(3, 'user3', 'user3@example.com'),
(4, 'user4', 'user4@example.com'),
(5, 'user5', 'user5@example.com'),
(6, 'user6', 'user6@example.com'),
(7, 'user7', 'user7@example.com'),
(8, 'user8', 'user8@example.com'),
(9, 'user9', 'user9@example.com'),
(10, 'user10', 'user10@example.com');

-- Insert 10 values into the movies table
INSERT INTO movies (movie_id, title, release_year, director_id, studio_id, genre_id) VALUES
(1, 'Inception', 2010, 1, 1, 1),
(2, 'Pulp Fiction', 1994, 2, 2, 2),
(3, 'Jurassic Park', 1993, 3, 3, 4),
(4, 'The Godfather', 1972, 10, 4, 2),
(5, 'Fight Club', 1999, 5, 5, 5),
(6, 'Avatar', 2009, 6, 6, 1),
(7, 'Blade Runner', 1982, 7, 7, 4),
(8, 'Fargo', 1996, 8, 8, 9),
(9, 'The Grand Budapest Hotel', 2014, 9, 9, 7),
(10, 'The Shawshank Redemption', 1994, 3, 1, 2);

-- Insert 10 values into the reviews table
INSERT INTO reviews (review_id, movie_id, user_id, rating, review_text) VALUES
(1, 1, 1, 4.5, 'Incredible movie, mind-bending plot!'),
(2, 2, 2, 5.0, 'Tarantino at his best!'),
(3, 3, 3, 4.0, 'Dinosaurs and adventure, loved it!'),
(4, 4, 4, 5.0, 'A classic masterpiece, timeless!'),
(5, 5, 5, 4.0, 'Twists and turns, great performance by Pitt!'),
(6, 6, 6, 4.5, 'Visually stunning, a cinematic marvel!'),
(7, 7, 7, 4.0, 'A sci-fi classic ahead of its time.'),
(8, 8, 8, 4.5, 'Darkly humorous and brilliantly written!'),
(9, 9, 9, 4.0, 'Quirky and delightful, Wes Anderson style!'),
(10, 10, 10, 5.0, 'A must-watch, incredible story and acting!');
-- List movies with their directors' names and associated reviews
SELECT
    m.movie_id,
    m.title,
    m.release_year,
    (SELECT director_name FROM directors WHERE directors.director_id = m.director_id) AS director_name,
    r.rating,
    r.review_text
FROM
    movies m
LEFT JOIN
    reviews r ON m.movie_id = r.movie_id;
SELECT
    movie_id,
    title,
    release_year,
    (SELECT director_name FROM directors WHERE directors.director_id = movies.director_id) AS director_name
FROM movies;




