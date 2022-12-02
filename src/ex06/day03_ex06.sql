WITH pizza_set(id, pizzeria_name, pizza_name, price) AS
            (SELECT menu.id, pizzeria.name AS pizzeria_name,
                    menu.pizza_name, menu.price
                FROM menu
                JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)

SELECT t1.pizza_name AS pizza_name,
       t1.pizzeria_name AS pizzeria_name_1,
       t2.pizzeria_name AS pizzeria_name_2,
       t1.price AS price
FROM pizza_set AS t1
CROSS JOIN pizza_set AS t2
WHERE t1.pizza_name = t2.pizza_name AND
        t1.price = t2.price AND
        t1.pizzeria_name != t2.pizzeria_name AND
        t1.id > t2.id
ORDER BY pizza_name;
