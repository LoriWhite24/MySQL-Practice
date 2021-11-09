# transactions
USE book_store;

-- using rollback 
START TRANSACTION; 
SET sql_safe_updates = off;
SELECT 
    *
FROM
    loyalty_customers;
DELETE FROM loyalty_customers 
WHERE
    points_balance < 250;
set sql_safe_updates = on;
SELECT 
    *
FROM
    loyalty_customers;
ROLLBACK;
SELECT 
    *
FROM
    loyalty_customers;

-- using commit
INSERT INTO `book_store`.`employees` (`employee_name`, `employee_type`, `was_paid`, `money_due`) 
VALUES ('Bob', 'N', '1', '10.00');

SET autocommit = off;
START TRANSACTION;
SET sql_safe_updates = off;
UPDATE employees
        INNER JOIN
    (SELECT 
        employee_id,
            IF(SUM(IF(was_paid = 0 AND money_due > 0.00, money_due, - 1 * money_due)) >= 0, 0, 1) AS paid,
            SUM(IF(was_paid = 0 AND money_due > 0.00, money_due, - 1 * money_due)) AS money
    FROM
        employees
    GROUP BY TRIM(employee_name)) AS new_values ON employees.employee_id = new_values.employee_id 
SET 
    was_paid = paid,
    money_due = ABS(money);
DELETE e1 FROM employees AS e1
        INNER JOIN
    employees AS e2 
WHERE
    e1.employee_id > e2.employee_id
    AND TRIM(e1.employee_name) = TRIM(e2.employee_name);
SET sql_safe_updates = ON;
COMMIT;
SET autocommit = ON;
SELECT 
    *
FROM
    employees;

# drop table
/* 
 The tables city and country cannot be dropped because of the foreign key constraint.
 */
USE sakila;
DROP TABLE IF EXISTS city; 
DROP TABLE IF EXISTS country;