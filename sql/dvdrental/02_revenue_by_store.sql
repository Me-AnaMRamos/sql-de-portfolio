select s.store_id, 
SUM(p.amount) as total_revenue
from store s
join staff sta on s.store_id =sta.store_id 
join payment p on sta.staff_id = p.staff_id 
group by s.store_id 
;

 