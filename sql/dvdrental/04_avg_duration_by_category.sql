SELECT c.name, avg(r.return_date -r.rental_date ) AS average_rental_duration
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE r.rental_date IS NOT NULL
GROUP BY c.name
ORDER BY average_rental_duration DESC
;