# Selecting data from database
SELECT 
    family_name, given_name, loyalty_number
FROM
    book_store.loyalty_customers;

# where clause
SELECT 
    *
FROM
    book_store.loyalty_customers
WHERE
    loyalty_number = '01840892337029922967';

SELECT 
    family_name, given_name, loyalty_number
FROM
    book_store.loyalty_customers
WHERE
    points_balance > 200;

SELECT 
    *
FROM
    book_store.loyalty_customers
WHERE
    loyalty_number = '01840892337029922967'
        OR points_balance > 200;
        
# group by clause and having
SELECT 
    was_paid, SUM(money_due) AS total
FROM
    book_store.employees
GROUP BY was_paid;

SELECT 
    SUM(money_due) AS total_paid
FROM
    book_store.employees
GROUP BY was_paid
HAVING was_paid = TRUE;

# Using both the where clause and the group by clause
SELECT 
    was_paid, SUM(money_due) AS total
FROM
    book_store.employees
WHERE
    employee_type = 'P'
GROUP BY was_paid;

SELECT 
    family_name, given_name, loyalty_number, points_balance
FROM
    book_store.loyalty_customers
ORDER BY family_name ASC;
SELECT 
    family_name, given_name, loyalty_number, points_balance
FROM
    book_store.loyalty_customers
ORDER BY given_name DESC;
SELECT 
    family_name, given_name, loyalty_number, points_balance
FROM
    book_store.loyalty_customers
ORDER BY points_balance ASC;

# ordering by multiple columns
INSERT INTO book_store.loyalty_customers(customer_id, family_name, given_name, loyalty_number, contact_number, email_address, points_balance) 
VALUES (4, 'Monkey', 'Dragon', '23523543625568886868', '(888)-346-9999', 'dmonkey@gmail.com', 150);

SELECT 
    family_name, given_name, loyalty_number, points_balance
FROM
    book_store.loyalty_customers
ORDER BY family_name ASC , given_name DESC;

/* 
	Selecting all rows and columns from a table 
    This example is selecting all rows and columns from the loyalty_customers table that is in the book_store database.
*/
SELECT * FROM book_store.loyalty_customers;