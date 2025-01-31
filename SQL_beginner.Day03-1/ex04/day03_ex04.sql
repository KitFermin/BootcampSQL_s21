WITH FemaleVisits AS (
    SELECT
        pizzeria.name AS pizzeria_name
    FROM person_order
	JOIN person ON person_order.person_id = person.id
	JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE person.gender = 'female'
),
MaleVisits AS (
    SELECT
        pizzeria.name AS pizzeria_name
    FROM person_order
	JOIN person ON person_order.person_id = person.id
	JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE person.gender = 'male'
),
FemaleDominated AS (
    SELECT pizzeria_name
    FROM FemaleVisits
    EXCEPT
    SELECT pizzeria_name
    FROM MaleVisits
),
MaleDominated AS (
    SELECT pizzeria_name
    FROM MaleVisits
    EXCEPT
    SELECT pizzeria_name
    FROM FemaleVisits
)
SELECT * FROM FemaleDominated
UNION 
SELECT * FROM MaleDominated
ORDER BY pizzeria_name;