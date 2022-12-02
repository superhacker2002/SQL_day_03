WITH all_visits AS
         (SELECT pizzeria.name AS pizzeria_name, p.gender AS gender
          FROM pizzeria
                   JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
                   JOIN person p ON p.id = pv.person_id),
     female_visits AS
         (SELECT *
          FROM (SELECT * FROM all_visits) AS female_visit
          WHERE gender = 'female'),
     male_visits AS
         (SELECT *
          FROM (SELECT * FROM all_visits) AS male_visit
          WHERE gender = 'male')

(SELECT pizzeria_name FROM female_visits
EXCEPT ALL
SELECT pizzeria_name FROM male_visits)

UNION ALL

(SELECT pizzeria_name FROM male_visits
EXCEPT ALL
SELECT pizzeria_name FROM female_visits)

ORDER BY pizzeria_name;



