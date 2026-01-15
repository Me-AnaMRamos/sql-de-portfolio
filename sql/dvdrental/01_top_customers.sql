select c.customer_id, first_name, last_name, count(r.rental_id) as number_of_rentals
from 
customer c join rental r on c.customer_id=r.customer_id
group by c.customer_id, first_name, last_name
order by number_of_rentals desc
limit 10;