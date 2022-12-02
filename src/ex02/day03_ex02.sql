WITH unselected_pizza AS
        (SELECT menu.id AS menu_id
        FROM menu
        WHERE menu.id NOT IN
            (SELECT person_order.menu_id FROM person_order))

SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE menu.id IN (SELECT menu_id FROM unselected_pizza)
ORDER BY pizza_name, price;
