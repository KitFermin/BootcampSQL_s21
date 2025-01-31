WITh pep_pizza AS(
    SELECT person.name AS pepperoni
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
    WHERE person.gender = 'female' AND menu.pizza_name = 'pepperoni pizza'
),ch_pizza AS (
    SELECT person.name AS cheese
    FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
    WHERE person.gender = 'female' AND menu.pizza_name = 'cheese pizza'
)
SELECT person.name 
FROM person 
JOIN pep_pizza ON pep_pizza.pepperoni = person.name
JOIN ch_pizza ON ch_pizza.cheese = person.name
ORDER BY person.name

