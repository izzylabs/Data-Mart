--task 1
--solution 1
SELECT 
    s.store_id,
    s.staff_id,
    SUM(p.amount) AS total_payments
FROM 
    staff s
JOIN 
    payment p ON s.staff_id = p.staff_id
WHERE 
    EXTRACT(YEAR FROM p.payment_date) = 2017
GROUP BY 
    s.store_id, s.staff_id
HAVING 
    SUM(p.amount) = (
        SELECT MAX(sum_amount)
        FROM (
            SELECT 
                s_inner.store_id,
                s_inner.staff_id,
                SUM(p_inner.amount) AS sum_amount
            FROM 
                staff s_inner
            JOIN 
                payment p_inner ON s_inner.staff_id = p_inner.staff_id
            WHERE 
                EXTRACT(YEAR FROM p_inner.payment_date) = 2017
            GROUP BY 
                s_inner.store_id, s_inner.staff_id
        ) results
        WHERE 
            s.store_id = results.store_id
        GROUP BY 
            results.store_id
    )
ORDER BY 
    s.store_id;

--solution 2
SELECT
    store_id,
    staff_id,
    sum_amount1
FROM (
    SELECT
        store_id,
        s1.staff_id,
        SUM(amount) AS sum_amount1,
        RANK() OVER (PARTITION BY store_id ORDER BY SUM(amount) DESC) AS rnk
    FROM
        staff s1
    JOIN
        payment p1 ON s1.staff_id = p1.staff_id
    WHERE
        EXTRACT(YEAR FROM payment_date) = 2017
    GROUP BY
        store_id, s1.staff_id
) AS ranked_data
WHERE rnk = 1
ORDER BY store_id;

	
--task 2
--solution 1
SELECT 
    f.film_id,
    r.film_count,
    f.rating
FROM 
    film f
INNER JOIN (
    SELECT 
        i.film_id,
        SUM(rn.count) AS film_count
    FROM 
        inventory i
    INNER JOIN (
        SELECT 
            inventory_id,
            COUNT(inventory_id) AS count
        FROM 
            rental
        GROUP BY 
            inventory_id
    ) AS rn ON i.inventory_id = rn.inventory_id
    GROUP BY 
        i.film_id
) AS r ON f.film_id = r.film_id
ORDER BY 
    r.film_count DESC, f.film_id
LIMIT 5;

--solution 2
SELECT
    film.film_id,
    COALESCE(COUNT(rental.inventory_id), 0) AS film_count,
    film.rating
FROM
    film
LEFT JOIN
    inventory i ON film.film_id = i.film_id
LEFT JOIN
    rental ON i.inventory_id = rental.inventory_id
GROUP BY
    film.film_id, film.rating
ORDER BY
    film_count DESC, film.film_id
LIMIT 5;


--task 3
SELECT
    MAX(f.release_year) AS max_release_year,
    fa.actor_id
FROM
    film_actor fa
INNER JOIN
    film f ON fa.film_id = f.film_id
GROUP BY
    fa.actor_id
ORDER BY
    max_release_year DESC;