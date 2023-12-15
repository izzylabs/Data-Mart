--task 1 
--Remove a previously inserted film from the inventory and all corresponding rental records
-- Delete from rental table

DELETE FROM rental
USING inventory
WHERE rental.inventory_id = inventory.inventory_id
      AND inventory.film_id = (SELECT film_id FROM film WHERE title = 'Star Wars 5' LIMIT 1);

-- Delete from inventory table

DELETE FROM inventory
WHERE film_id = (SELECT film_id FROM film WHERE title = 'Star Wars 5' LIMIT 1);

--task 2 
--Remove any records related to you (as a customer) from all tables except "Customer" and "Inventory"

DELETE FROM payment
WHERE customer_id = (SELECT customer_id
    FROM customer
    WHERE first_name = 'Dasha'  AND last_name = 'Delbano'
    );
	
DELETE FROM rental
WHERE customer_id = (SELECT customer_id
    FROM customer
    WHERE first_name = 'Dasha'  AND  last_name = 'Delbano'
    );
