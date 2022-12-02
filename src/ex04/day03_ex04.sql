WITH all_visits AS
         (SELECT DISTINCT pizzeria.name AS pizzeria_name, p.gender AS gender
          FROM pizzeria
                   JOIN menu ON pizzeria.id = menu.pizzeria_id
                   JOIN person_order po on menu.id = po.menu_id
                   JOIN person p ON po.person_id = p.id),
     female_orders AS
         (SELECT *
          FROM (SELECT * FROM all_visits) AS female_visit
          WHERE gender = 'female'),
     male_orders AS
         (SELECT *
          FROM (SELECT * FROM all_visits) AS male_visit
          WHERE gender = 'male')

(SELECT pizzeria_name
 FROM female_orders
 EXCEPT ALL
 SELECT pizzeria_name
 FROM male_orders)

UNION ALL

(SELECT pizzeria_name
 FROM male_orders
 EXCEPT ALL
 SELECT pizzeria_name
 FROM female_orders)

ORDER BY pizzeria_name;



