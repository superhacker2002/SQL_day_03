WITH Andrey_visited AS
         (SELECT pizzeria.name AS pizzeria_name
          FROM pizzeria
                   JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
                   JOIN person p on pv.person_id = p.id
          WHERE p.name = 'Andrey'),
     Andrey_ordered AS
         (SELECT pizzeria.name AS pizzeria_name
          FROM pizzeria
                   JOIN menu m on pizzeria.id = m.pizzeria_id
                   JOIN person_order po on m.id = po.menu_id
                   JOIN person p on po.person_id = p.id
          WHERE p.name = 'Andrey')

(SELECT pizzeria_name FROM Andrey_visited)
EXCEPT ALL
(SELECT pizzeria_name FROM Andrey_ordered)
ORDER BY pizzeria_name;