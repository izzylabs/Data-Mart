--task 1
INSERT INTO film (title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext)
VALUES ('Inception', 'A mind-bending heist thriller', 2010, 1, NULL, 14, 4.99, 148, 19.99, 'PG-13', CURRENT_TIMESTAMP, '{"Special Features Here"}', 'Full Text Here');

--task 2
-- Add actors for the film "Inception" to the "actor" table.
INSERT INTO actor (first_name, last_name, last_update)
VALUES
    ('Leonardo', 'DiCaprio', CURRENT_TIMESTAMP),
    ('Joseph', 'Gordon-Levitt', CURRENT_TIMESTAMP),
    ('Ellen', 'Page', CURRENT_TIMESTAMP);

-- Add entries to the "film_actor" table linking actors to the film "Inception."
INSERT INTO film_actor (actor_id, film_id, last_update)
VALUES
    ((SELECT actor_id FROM actor WHERE first_name = 'Leonardo'), (SELECT film_id FROM film WHERE title = 'Inception'), CURRENT_TIMESTAMP),
    ((SELECT actor_id FROM actor WHERE first_name = 'Joseph'), (SELECT film_id FROM film WHERE title = 'Inception'), CURRENT_TIMESTAMP),
    ((SELECT actor_id FROM actor WHERE first_name = 'Ellen'), (SELECT film_id FROM film WHERE title = 'Inception'), CURRENT_TIMESTAMP);

--task 3
-- Add your favorite movies to the "film" table.
INSERT INTO film (title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext)
VALUES
    ('Spider-Man3', 'This is a superhero movie', 2009, 1, NULL, 14, 4.99, 120, 19.99, 'R', CURRENT_TIMESTAMP, '{"Special Features Here"}', 'Full Text Here'),
    ('Interstellar', 'This is a film about saving the earth', 2014, 2, NULL, 7, 3.99, 105, 14.99, 'R', CURRENT_TIMESTAMP, '{"Special Features Here"}', 'Full Text Here'),
    ('Star Wars 5', 'About space battles', 2019, 1, NULL, 10, 2.99, 150, 24.99, 'R', CURRENT_TIMESTAMP, '{"Special Features Here"}', 'Full Text Here');

-- Add the movies to a store's inventory.
INSERT INTO inventory (film_id, store_id, last_update)
VALUES
    ((SELECT film_id FROM film WHERE title = 'Inception' LIMIT 1), (SELECT store_id FROM store WHERE store_id IN (1, 2) LIMIT 1), CURRENT_TIMESTAMP),
    ((SELECT film_id FROM film WHERE title = 'Spider-Man3' LIMIT 1), (SELECT store_id FROM store WHERE store_id IN (1, 2) LIMIT 1), CURRENT_TIMESTAMP),
    ((SELECT film_id FROM film WHERE title = 'Interstellar' LIMIT 1), (SELECT store_id FROM store WHERE store_id IN (1, 2) LIMIT 1), CURRENT_TIMESTAMP),
    ((SELECT film_id FROM film WHERE title = 'Star Wars 5' LIMIT 1), (SELECT store_id FROM store WHERE store_id IN (1, 2) LIMIT 1), CURRENT_TIMESTAMP);
