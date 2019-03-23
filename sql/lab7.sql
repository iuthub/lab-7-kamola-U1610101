--A
SELECT * FROM imdb_small.movies WHERE year=1995;
--B: 51 peoples
SELECT first_name, last_name FROM imdb_small.actors
JOIN imdb_small.roles ON imdb_small.actors.id = imdb_small.roles.actor_id
JOIN imdb_small.movies ON imdb_small.movies.id = imdb_small.roles.movie_id
WHERE imdb_small.movies.name = "Lost in Translation";
--C
SELECT actors.first_name, actors.last_name, directors.first_name, directors.last_name FROM actors
JOIN roles ON actors.id = roles.actor_id
JOIN movies ON roles.movie_id = movies.id
JOIN movies_directors ON movies.id = movies_directors.movie_id
JOIN directors ON movies_directors.director_id = directors.id
WHERE movies.name = "Lost in Translation";
--D
SELECT first_name, last_name FROM directors
JOIN movies_directors ON directors.id = movies_directors.director_id
JOIN movies ON movies_directors.movie_id = movies.id
WHERE movies.name = "Fight Club";
--E/F Only one
SELECT movies.name FROM movies
JOIN movies_directors ON movies.id = movies_directors.movie_id
JOIN directors ON movies_directors.director_id = directors.id
WHERE directors.first_name = "Clint" AND directors.last_name = "Eastwood";
--G 
SELECT first_name, last_name FROM directors
JOIN movies_directors ON directors.id = movies_directors.director_id
JOIN movies_genres ON movies_directors.movie_id = movies_genres.movie_id
WHERE movies_genres.genre = "Horror"
--H
SELECT a.first_name, a.last_name FROM actors a
JOIN roles r ON a.id = r.actor_id
JOIN movies m ON r.movie_id = m.id
JOIN movies_directors md ON m.id = md.movie_id
JOIN directors d ON md.director_id = d.id
WHERE d.first_name = "Christopher" AND d.last_name = "Nolan";