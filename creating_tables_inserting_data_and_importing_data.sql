# Creating a database and a table in SQL practice

# creates a database
CREATE DATABASE IF NOT EXISTS book_store;

-- USE book_store;
-- CREATE TABLE IF NOT EXISTS employees (
--     employee_id INT NOT NULL PRIMARY KEY,
--     employee_name VARCHAR(25) NOT NULL,
--     employee_type CHAR NOT NULL,
--     was_paid BOOL DEFAULT FALSE,
--     money_due DOUBLE(10 , 2 ) DEFAULT 0.00
-- );
CREATE TABLE IF NOT EXISTS book_store.employees (
    employee_id INT NOT NULL PRIMARY KEY,
    employee_name VARCHAR(25) NOT NULL,
    employee_type CHAR NOT NULL,
    was_paid BOOL DEFAULT FALSE,
    money_due DOUBLE(10 , 2 ) DEFAULT 0.00
);

# alters the employees table by changing a column
ALTER TABLE book_store.employees 
CHANGE COLUMN employee_id 
employee_id INT NOT NULL AUTO_INCREMENT;

# used to drop a table and the next line is to drop a database
-- DROP TABLE book_store.employees;
-- DROP DATABASE book_store;

# Inserting Data
# Adds a single record
INSERT INTO book_store.employees 
VALUES(1,"Charlie",'P',TRUE,20.00);
# Adds multiple records
INSERT INTO book_store.employees
VALUES(2,"Vera",'N',FALSE,0.00),
	  (3,"Lisa",'P',TRUE,20.50);
# Adding with listing the columns
INSERT INTO book_store.employees (employee_name, employee_type)
VALUES("John",'P');
INSERT INTO book_store.employees (employee_name, employee_type, was_paid, money_due)
VALUES("Bob",'N',false,50.00);

# Describe Statement
DESCRIBE book_store.employees;
# Show Statement
SHOW DATABASES;
USE book_store;
SHOW TABLES;

# Creating the customer table
CREATE TABLE book_store.loyalty_customers (
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    family_name VARCHAR(25) NOT NULL,
    given_name VARCHAR(20) NOT NULL,
    loyalty_number VARCHAR(25) NOT NULL,
    contact_number VARCHAR(14) NOT NULL,
    email_address VARCHAR(50) NOT NULL,
    points_balance INT DEFAULT 0
);

# Importing a CSV file
SELECT @@GLOBAL.secure_file_priv;
load data infile 'c:/ProgramData/MySQL/MySQl Server 8.0/Uploads/loyalty.csv' into table book_store.loyalty_customers
fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;