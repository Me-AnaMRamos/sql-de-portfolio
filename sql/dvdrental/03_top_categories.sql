SELECT c.name AS Categorie, 
	count(c."name") AS Total_rentals
FROM category c 
JOIN film_category fc ON c.category_id = fc.category_id 
JOIN inventory i ON fc.film_id=fc.film_id 
RIGHT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c."name"
ORDER BY total_rentals DESC
;
