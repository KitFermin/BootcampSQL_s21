SELECT tpizza.pizza_name, pizzeria.name AS pizzeria_name, tpizza.price 
FROM (SELECT * FROM menu WHERE menu.pizza_name = 'mushroom pizza' 
	OR menu.pizza_name = 'pepperoni pizza') AS tpizza
LEFT JOIN pizzeria ON tpizza.pizzeria_id = pizzeria.id  
ORDER BY pizza_name, pizzeria_name