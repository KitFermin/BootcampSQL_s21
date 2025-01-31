WITH FemaleVisits AS (
    SELECT
        pizzeria.name AS pizzeria_name,
        person_visits.id AS visit_id
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
    WHERE person.gender = 'female'
),
MaleVisits AS (
    SELECT
        pizzeria.name AS pizzeria_name,
        person_visits.id AS visit_id
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
    WHERE person.gender = 'male'
),
FemaleDominated AS (
    SELECT pizzeria_name
    FROM FemaleVisits
    EXCEPT ALL
    SELECT pizzeria_name
    FROM MaleVisits
),
MaleDominated AS (
    SELECT pizzeria_name
    FROM MaleVisits
    EXCEPT ALL
    SELECT pizzeria_name
    FROM FemaleVisits
)
SELECT * FROM FemaleDominated
UNION ALL
SELECT * FROM MaleDominated
ORDER BY pizzeria_name;
