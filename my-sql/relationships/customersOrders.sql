-- SHOW DATABASES;
-- CREATE DATABASE customers_and_orders;
-- USE customers_and_orders;
-- SHOW DATABASES;
-- SELECT DATABASE();

-- CREATE TABLE customers(
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(100),
--     last_name VARCHAR(100),
--     email VARCHAR(100)
-- );

-- CREATE TABLE orders (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     order_date DATE,
--     amount DECIMAL(8, 2),
--     customer_id INT,
--     FOREIGN KEY (customer_id) REFERENCES customers(id)
-- );

-- INSERT INTO customers (first_name, last_name, email)
--     VALUES 
--         ('Boy', 'George', 'george@gmail.com'),
--         ('George', 'Michael', 'gm@gmail.com'),
--         ('David', 'Bowie', 'david@gmail.com'),
--         ('Blue', 'Steele', 'blue@gmail.com'),
--         ('Bette', 'Davis', 'bette@aol.com');

-- INSERT INTO orders (order_date, amount, customer_id)
--     VALUES
--         ('2016/02/10', 99.99, 1),
--         ('2017/11/11', 35.50, 1),
--         ('2014/12/12', 800.67, 2),
--         ('2015/01/03', 12.50, 2),
--         ('1999/04/11', 450.25, 5);

-- // FOREIGN KEY (customer_id) --> establishes the relationship with customers
-- // REFERENCES customers(id)  --> enforces that if each order is being reffered to an existing customer
-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016/06/06', 33.67, 98);

-- SELECT * FROM orders WHERE customer_id=(SELECT id FROM customers WHERE last_name='george');

-- // IMPLICIT JOIN
-- SELECT * FROM customers, orders 
--     WHERE customers.id = orders.customer_id;
-- SELECT first_name, last_name, amount FROM customers, orders 
--     WHERE customers.id = orders.customer_id;

-- // EXPLICIT JOIN --> best practices
-- SELECT * FROM customers
-- JOIN orders
--     ON customers.id = orders.customer_id;
-- SELECT first_name, last_name, amount FROM customers
-- JOIN orders
--     ON customers.id = orders.customer_id;

-- SELECT 
--     first_name, 
--     last_name,
--     IFNULL(SUM(amount), 0) AS total_spent
-- FROM customers
-- JOIN orders
--     ON customers.id = orders.customer_id
-- GROUP BY customers.id
-- ORDER BY total_spent DESC;

-- SELECT 
--     first_name, 
--     last_name,
--     IFNULL(SUM(amount), 0) AS total_spent
-- FROM customers
-- LEFT JOIN orders
--     ON customers.id = orders.customer_id
-- GROUP BY customers.id
-- ORDER BY total_spent DESC;