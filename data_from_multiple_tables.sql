USE sakila;
# using union
SELECT 
    first_name, last_name
FROM
    staff 
UNION ALL SELECT 
    first_name, last_name
FROM
    customer;

# using inner join
SELECT 
    payment_id,
    amount,
    payment_date,
    CONCAT(customer.last_name,
            ', ',
            customer.first_name) AS full_name,
    payment.last_update
FROM
    payment
        INNER JOIN
    customer ON payment.customer_id = customer.customer_id
WHERE
    customer.customer_id = 1
ORDER BY payment_date DESC;

-- with mulitple tables
SELECT 
    title,
    CONCAT(last_name, ', ', first_name) AS actor_full_name
FROM
    film
        INNER JOIN
    film_actor ON film.film_id = film_actor.film_id
        INNER JOIN
    actor ON film_actor.actor_id = actor.actor_id
ORDER BY title , actor_full_name;

SELECT 
    title, COUNT(actor.actor_id) AS number_of_actors
FROM
    film
        INNER JOIN
    film_actor ON film.film_id = film_actor.film_id
        INNER JOIN
    actor ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id
ORDER BY title;

SELECT 
    CONCAT(last_name, ', ', first_name) AS actor_full_name,
    COUNT(film.film_id) AS number_of_films
FROM
    film
        INNER JOIN
    film_actor ON film.film_id = film_actor.film_id
        INNER JOIN
    actor ON film_actor.actor_id = actor.actor_id
GROUP BY actor.actor_id
ORDER BY actor_full_name;

# using left outer join
SELECT 
    CONCAT(last_name, ', ', first_name) AS full_name,
    SUM(amount) AS total_amount
FROM
    customer
        LEFT OUTER JOIN
    payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id;

# using right outer join
SELECT 
    payment_id,
    CONCAT(last_name, ', ', first_name) AS full_name,
    customer_id
FROM
    staff
        RIGHT OUTER JOIN
    payment ON payment.staff_id = staff.staff_id
ORDER BY payment.staff_id , payment_id , customer_id;

# using self join
ALTER TABLE `book_store`.`employees` 
ADD COLUMN `manager_id` INT NULL AFTER `money_due`;

UPDATE `book_store`.`employees` 
SET 
    `manager_id` = '5'
WHERE
    (`employee_id` = '1');
    
UPDATE `book_store`.`employees` 
SET 
    `manager_id` = '5'
WHERE
    (`employee_id` = '2');
    
UPDATE `book_store`.`employees` 
SET 
    `manager_id` = '5'
WHERE
    (`employee_id` = '3');
    
UPDATE `book_store`.`employees` 
SET 
    `manager_id` = '2'
WHERE
    (`employee_id` = '4');
    
SELECT DISTINCT
    e1.employee_name AS managed_by, e2.employee_name AS employee
FROM
    book_store.employees AS e1
        INNER JOIN
    book_store.employees AS e2 ON e1.employee_id = e2.manager_id
WHERE
    e2.manager_id IS NOT NULL
ORDER BY e2.employee_name , e1.employee_name;