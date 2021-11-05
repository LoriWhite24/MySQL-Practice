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