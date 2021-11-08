# Using distinct
INSERT INTO `book_store`.`employees` (`employee_name`, `employee_type`, `was_paid`, `money_due`) VALUES ('Vera', 'P', '1', '10.00');
SELECT DISTINCT
    employee_name, employee_type
FROM
    book_store.employees;
    
SELECT 
    COUNT(DISTINCT employee_name) AS number_of_distinct_names
FROM
    book_store.employees;

# count function
SELECT 
    COUNT(*) AS number_of_loyalty_customers
FROM
    book_store.loyalty_customers;

# avg function
SELECT 
    COUNT(*) AS number_of_loyalty_customers,
    sum(points_balance) as sum_loyalty_points,
    avg(points_balance) as average_loyalty_points
FROM
    book_store.loyalty_customers;

# min function
SELECT
	min(points_balance) as lowest_loyalty_points
FROM
	book_store.loyalty_customers;

# max function
SELECT
	max(points_balance) as highest_loyalty_points
FROM
	book_store.loyalty_customers;

# using a database
use book_store;-- can swtich to a specified database
SELECT 
    *
FROM
    employees;

# length function
SELECT DISTINCT
    LENGTH(loyalty_number) AS length_of_loyalty_number
FROM
    book_store.loyalty_customers;

# upper and lower function
SELECT 
    UPPER(family_name) AS family_name,
    LOWER(given_name) AS given_name
FROM
    book_store.loyalty_customers;

# trim function
INSERT INTO `book_store`.`employees` (`employee_name`, `employee_type`, `was_paid`, `money_due`) 
VALUES ('    Bob   ', 'P', '0', '0.00');

INSERT INTO `book_store`.`employees` (`employee_name`, `employee_type`, `was_paid`, `money_due`) 
VALUES (trim('    Bob   '), 'P', '0', '0.00');

SELECT 
    *
FROM
    book_store.employees;
    
DELETE FROM `book_store`.`employees` WHERE (`employee_id` = '7');

DELETE FROM `book_store`.`employees` WHERE (`employee_id` = '8');

# substring function
SELECT 
    SUBSTRING(email_address,
        1,
        1 + LENGTH(family_name)) AS user_name
FROM
    book_store.loyalty_customers;
    
SELECT 
    customer_id, SUBSTRING(contact_number, 1, 5) AS area_code
FROM
    book_store.loyalty_customers;

# concat function
SELECT 
    customer_id,
    CONCAT(family_name, ', ', given_name) AS full_name,
    loyalty_number,
    points_balance
FROM
    book_store.loyalty_customers;
