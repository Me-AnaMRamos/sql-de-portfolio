-- Goal: Top 10 films by number of rentals
-- Output: film.title
SELECT title 
FROM (
SELECT f.title, count(r.rental_id) AS "Number of rentals"
FROM rental r 
JOIN inventory i ON r.inventory_id = i.inventory_id 
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id, f.title
ORDER BY "Number of rentals" DESC
LIMIT 10
) t;
