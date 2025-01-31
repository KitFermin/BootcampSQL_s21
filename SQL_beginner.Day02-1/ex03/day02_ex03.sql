WITH visits AS (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-10'
    AND (person_id = '1' OR person_id = '2')
),
dates AS (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-10'
)
SELECT dates.visit_date
FROM dates
LEFT JOIN visits ON visits.visit_date = dates.visit_date
WHERE visits.visit_date IS NULL
ORDER BY dates.visit_date;