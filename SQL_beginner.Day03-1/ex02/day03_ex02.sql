WITH byid AS (SELECT * 
	FROM menu
	WHERE NOT EXISTS (SELECT menu_id 
	FROM person_order WHERE menu_id = menu.id)
)
SELECT byid.pizza_name AS pizza_name, byid.price AS price, pizzeria.name AS pizzeria_name
FROM byid
JOIN pizzeria ON pizzeria.id = byid.pizzeria_id
ORDER BY pizza_name, price;
	