-- 			1. SELECT & WHERE Clause
-- 1.01 Select all records from the Customers table.
SELECT * FROM Customers;

-- 1.02 Select the first_name, last_name, and email of all customers.
SELECT first_name, last_name, email FROM Customers;

-- 1.03 Select all products with price > 500.
SELECT * FROM Products WHERE price > 500;

-- 1.04 Select all products in 'Electronics' category.
SELECT * FROM Products WHERE category = 'Electronics';

-- 1.05 Select product_name and price for products priced between 100 and 500.
SELECT product_name, price FROM Products WHERE price BETWEEN 100 AND 500;

-- 1.06 Select all products with stock_quantity < 50.
SELECT * FROM Products WHERE stock_quantity < 50;

-- 1.07 Select all customers who live in 'USA'.
SELECT * FROM Customers WHERE country = 'USA';

-- 1.08 Select first_name, last_name, and email of customers with first_name starting with 'J'.
SELECT first_name, last_name, email FROM Customers WHERE first_name LIKE 'J%';

-- 1.09 Select product_name, category, and price in the 'Furniture' category.
SELECT product_name, category, price FROM Products WHERE category = 'Furniture';

-- 1.10 Select product_name, category, and price with price > 300 and < 1000.
SELECT product_name, category, price FROM Products WHERE price > 300 AND price < 1000;

-- 1.11 Select order_id, order_date, and total_amount where order_date = '2025-01-10'.
SELECT order_id, order_date, total_amount FROM Orders WHERE order_date = '2025-01-10';

-- 1.12 Select order_id, order_date, and total_amount where total_amount > 500.
SELECT order_id, order_date, total_amount FROM Orders WHERE total_amount > 500;

-- 1.13 Select order_id, total_amount where total_amount BETWEEN 400 and 800.
SELECT order_id, total_amount FROM Orders WHERE total_amount BETWEEN 400 AND 800;

-- 1.14 Select first_name, last_name, and city of customers in 'London' or 'Paris'.
SELECT first_name, last_name, city FROM Customers WHERE city IN ('London', 'Paris');

-- 1.15 Select all products where price IS NOT NULL.
SELECT * FROM Products WHERE price IS NOT NULL;

-- 1.16 Select all order details where quantity > 1.
SELECT * FROM Order_Items WHERE quantity > 1;

-- 1.17 Select order_id and order_date of orders placed in January 2025.
SELECT order_id, order_date FROM Orders WHERE order_date BETWEEN '2025-01-01' AND '2025-01-31';

-- 1.18 Select product_name and price with 'Electronics' in category.
SELECT product_name, price FROM Products WHERE category LIKE '%Electronics%';

-- 1.19 Select all orders with order_date > '2025-01-15'.
SELECT * FROM Orders WHERE order_date > '2025-01-15';


-- 1.20 Select all products priced greater than the average price of all products.
SELECT * FROM Products WHERE price > (SELECT AVG(price) FROM Products);



-- 					2. ORDER BY Clause
-- 2.1 Select all products ordered by price (ascending).
SELECT * FROM Products ORDER BY price ASC;

-- 2.2 Select all products ordered by stock_quantity (descending).
SELECT * FROM Products ORDER BY stock_quantity DESC;

-- 2.3 Select first_name, last_name, email ordered by last_name (descending).
SELECT first_name, last_name, email FROM Customers ORDER BY last_name DESC;

-- 2.4 Select order_id, order_date, total_amount ordered by order_date.
SELECT order_id, order_date, total_amount FROM Orders ORDER BY order_date;

-- 2.5 Select product_name and price ordered by price (descending).
SELECT product_name, price FROM Products ORDER BY price DESC;

-- 2.6 Select all customers ordered by first_name.
SELECT * FROM Customers ORDER BY first_name;

-- 2.7 Select all orders ordered by total_amount (descending).
SELECT * FROM Orders ORDER BY total_amount DESC;

-- 2.8 Select products with price > 300 AND < 1000 ordered by price (ascending).
SELECT * FROM Products WHERE price > 300 AND price < 1000 ORDER BY price ASC;

-- 				3. AGGREGATE FUNCTIONS (COUNT, SUM, AVG, MAX, MIN)

-- 3.1 Number of orders placed by each customer.
SELECT customer_id, COUNT(order_id) AS order_count FROM Orders GROUP BY customer_id;

-- 3.2 Average price of products in each category.
SELECT category, AVG(price) AS avg_price FROM Products GROUP BY category;

-- 3.3 Count of customers from each country.
SELECT country, COUNT(customer_id) AS customer_count FROM Customers GROUP BY country;


-- 3.4 Highest priced product in each category.
SELECT category, MAX(price) AS max_price FROM Products GROUP BY category;

-- 3.5 Average price of products in 'Furniture' category.
SELECT AVG(price) AS avg_furniture_price FROM Products WHERE category = 'Furniture';



-- 3.6 Total sales amount for each year.
SELECT YEAR(order_date) AS year, SUM(total_amount) AS total_sales FROM Orders GROUP BY YEAR(order_date);

-- 3.7 Total stock available in each category.
SELECT category, SUM(stock_quantity) AS total_stock FROM Products GROUP BY category;

-- 3.8 Total quantity of products ordered in each order.
SELECT order_id, SUM(quantity) AS total_quantity FROM Order_Items GROUP BY order_id;

-- 3.9 Average quantity of products ordered in each order.
SELECT order_id, AVG(quantity) AS avg_quantity FROM Order_Items GROUP BY order_id;


-- 3.10 Count of orders placed by each customer.
SELECT customer_id, COUNT(order_id) AS order_count FROM Orders GROUP BY customer_id;

-- 3.11 Order details with total number of items in each order.
SELECT order_id, COUNT(order_item_id) AS total_items FROM Order_Items GROUP BY order_id;



-- 					4. GROUP BY Clause

-- 4.1 Select the number of orders placed by each customer.

SELECT customer_id, COUNT(order_id) AS number_of_orders
FROM Orders
GROUP BY customer_id;
-- 4.2 Select the total sales amount (total_amount) for each year.


SELECT YEAR(order_date) AS year, SUM(total_amount) AS total_sales
FROM Orders
GROUP BY YEAR(order_date);

-- 4.3 Select the product category and the total stock available in each category.

SELECT category, SUM(stock_quantity) AS total_stock
FROM Products
GROUP BY category;
-- 4.4 Select the total quantity of products ordered in each order.

SELECT order_id, SUM(quantity) AS total_quantity
FROM Order_Items
GROUP BY order_id;

-- 4.5 Select the count of customers from each country in the Customers table.

SELECT country, COUNT(customer_id) AS customer_count
FROM Customers
GROUP BY country;

-- 4.6 Select the product_name, category, and the average price of products in each category.

SELECT product_name, category, AVG(price) AS average_price
FROM Products
GROUP BY category;

-- 4.7 Select the total amount spent by each customer.

SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id;


-- 4.8 Select the count of orders placed by each customer from the Orders table.


SELECT customer_id, COUNT(order_id) AS order_count
FROM Orders
GROUP BY customer_id;



-- 					 5. Date and Time
-- 5.1 Retrieve the current date and time using a single SQL function.


SELECT NOW() AS current_datetime;
-- 5.2 Select all orders where the order_date is in the current month.


SELECT * 
FROM Orders
WHERE MONTH(order_date) = MONTH(CURDATE()) AND YEAR(order_date) = YEAR(CURDATE());
-- 5.3 Retrieve the year, month, and day from the order_date column in the Orders table.


SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, DAY(order_date) AS day
FROM Orders;

-- 5.4 Select all orders placed in the last 15 days using a date function.


SELECT *
FROM Orders
WHERE order_date >= CURDATE() - INTERVAL 15 DAY;

-- 5.5 Add 10 days to the order_date for all orders and display the new date.

SELECT order_id, DATE_ADD(order_date, INTERVAL 10 DAY) AS new_order_date
FROM Orders;

-- 5.6 Subtract 2 months from the order_date column and display the result.


SELECT order_id, DATE_SUB(order_date, INTERVAL 2 MONTH) AS updated_order_date
FROM Orders;

-- 					6.Joins
-- 6.01 Retrieve a list of all customers who placed orders, along with their order details.
SELECT c.* , o.order_id,o.order_date,o.total_amount
 from customers c inner join orders o 
 on c.customer_id = o.customer_id;

-- 6.02 Find the products purchased in each order, along with the product category using an inner join.
SELECT  p.product_name,oi.order_id, oi.product_id, p.category, oi.quantity, oi.price 
FROM Order_Items oi INNER JOIN Products p 
ON oi.product_id = p.product_id;

-- 6.03 Get the total amount spent by each customer by combining customer and order information.
SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spent 
FROM Customers c 
INNER JOIN Orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 6.04 Fetch the names of all customers who have not placed any orders.
SELECT c.first_name, c.last_name 
FROM Customers c 
LEFT JOIN Orders o ON c.customer_id = o.customer_id 
WHERE o.order_id IS NULL;

-- 6.05 Retrieve all order details, including products, even if no products are linked to the order.
SELECT o.order_id, o.customer_id, o.order_date, o.total_amount, oi.product_id, oi.quantity, oi.price 
FROM Orders o 
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id;

-- 6.06 Find the total quantity of each product sold, along with product details.
SELECT p.product_id, p.product_name, p.category, SUM(oi.quantity) AS total_quantity
FROM Products p 
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id 
GROUP BY p.product_id, p.product_name, p.category;

-- 6.07 List all customers and their order information, including those who have not made any purchases.
SELECT c.*, o.order_id, o.order_date, o.total_amount 
FROM Customers c 
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- 6.08 Display all orders and their associated customers, even if customer information is unavailable.
SELECT o.*, c.first_name, c.last_name 
FROM Orders o 
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

-- 6.09 Get the total revenue generated by each product.
SELECT p.product_id, p.product_name, p.category, SUM(oi.quantity * oi.price) AS total_revenue 
FROM Products p 
INNER JOIN Order_Items oi ON p.product_id = oi.product_id 
GROUP BY p.product_id, p.product_name, p.category;

-- 6.10 Fetch the details of all orders, including the products purchased, with the respective quantities and prices.
SELECT o.order_id, o.customer_id, o.order_date, o.total_amount, oi.product_id, oi.quantity, oi.price 
FROM Orders o 
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id;

-- 6.11 List all customers who reside in a specific country and have placed orders.
SELECT DISTINCT c.first_name, c.last_name, c.country
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.country = 'USA';

-- 6.12 Retrieve the details of all orders and their corresponding order items, even if an order has no items.
SELECT o.order_id, o.order_date, o.total_amount, oi.product_id, oi.quantity, oi.price 
FROM Orders o 
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id;

-- 6.13 Fetch the total revenue generated by each customer using customer, order, and order item details.
SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.quantity * oi.price) AS total_revenue 
FROM Customers c 
INNER JOIN Orders o ON c.customer_id = o.customer_id 
INNER JOIN Order_Items oi ON o.order_id = oi.order_id 
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 6.14 Find the names of all products that have never been sold.
SELECT p.product_name 
FROM Products p 
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id 
WHERE oi.product_id IS NULL;

-- 6.15 Get a list of all orders, including customer details, regardless of whether the customer is in the customer table.
SELECT o.*, c.first_name, c.last_name 
FROM Orders o 
LEFT JOIN Customers c ON o.customer_id = c.customer_id;

-- 6.16 Retrieve the names of customers and the names of the products they have purchased.
SELECT DISTINCT c.first_name, c.last_name, p.product_name 
FROM Customers c 
INNER JOIN Orders o ON c.customer_id = o.customer_id 
INNER JOIN Order_Items oi ON o.order_id = oi.order_id 
INNER JOIN Products p ON oi.product_id = p.product_id;

-- 6.17 Find the total number of products sold per category.
SELECT p.category, SUM(oi.quantity) AS total_products_sold 
FROM Products p 
INNER JOIN Order_Items oi ON p.product_id = oi.product_id 
GROUP BY p.category;

-- 6.18 Display the details of all orders and customers where the total order amount exceeds a specific value.
SELECT o.*, c.first_name, c.last_name 
FROM Orders o 
INNER JOIN Customers c ON o.customer_id = c.customer_id 
WHERE o.total_amount > 1000;

-- 6.19 Retrieve all products and their order quantities, even if a product has no associated orders.
SELECT p.product_id, p.product_name, p.category, SUM(oi.quantity) AS total_quantity 
FROM Products p 
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id 
GROUP BY p.product_id, p.product_name, p.category;

-- 6.20 Find the order date and product details for all orders, including orders without associated products.
SELECT o.order_date, oi.product_id, p.product_name 
FROM Orders o 
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id 
LEFT JOIN Products p ON oi.product_id = p.product_id;

-- 6.21 Fetch the customer name and the total amount spent by each customer.
SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_spent 
FROM Customers c 
INNER JOIN Orders o ON c.customer_id = o.customer_id 
GROUP BY c.first_name, c.last_name;

-- 6.22 List the products and their total sales amount.
SELECT p.product_id, p.product_name, SUM(oi.quantity * oi.price) AS total_sales 
FROM Products p 
INNER JOIN Order_Items oi ON p.product_id = oi.product_id 
GROUP BY p.product_id, p.product_name;

-- 6.23 Find the customers who purchased a specific product.
SELECT DISTINCT c.first_name, c.last_name 
FROM Customers c 
INNER JOIN Orders o ON c.customer_id = o.customer_id 
INNER JOIN Order_Items oi ON o.order_id = oi.order_id 
WHERE oi.product_id = '1';

-- 6.24 Retrieve all customers and their associated orders, even if they have not placed any orders.
SELECT c.*, o.order_id, o.order_date, o.total_amount 
FROM Customers c 
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- 6.25 Display all products and their stock quantities, even if they have never been sold.
SELECT p.product_id, p.product_name, p.category, p.stock_quantity, SUM(oi.quantity) AS total_quantity_sold
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category, p.stock_quantity;

-- 							7.Windowing Function

-- 7.1 Rank customers based on their total spending.
SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spending, 
       RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS ranks
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name ;

-- 7.2 Calculate the cumulative sum of total order amounts across all orders.
SELECT order_id, customer_id, order_date, total_amount, 
       SUM(total_amount) OVER (ORDER BY order_date) AS cumulative_total
FROM Orders;

-- 7.3 Find the average price of products sold, partitioned by category.
SELECT p.product_id, p.product_name, p.category, p.price,
       AVG(p.price) OVER (PARTITION BY p.category) AS avg_price
FROM Products p
INNER JOIN Order_Items oi ON p.product_id = oi.product_id;

-- 7.4 Retrieve the top 3 customers with the highest total order amounts (use RANK).

SELECT * 
FROM (
    SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spending,
           RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS ranks
    FROM Customers c
    INNER JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
) AS ranked_customers
WHERE ranks <= 3;

-- 7.5 Assign a dense rank to customers based on their total orders.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders,
       DENSE_RANK() OVER (ORDER BY COUNT(o.order_id) DESC) AS dense_ranks
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 7.6 Calculate the running total of quantities ordered for each product.
SELECT oi.product_id, oi.order_id, oi.quantity,
       SUM(oi.quantity) OVER (PARTITION BY oi.product_id ORDER BY oi.order_id) AS running_total
FROM Order_Items oi;

-- 7.7 Find the percentage contribution of each product to its category's revenue.
SELECT p.product_id, p.product_name, p.category, 
       (SUM(oi.quantity * p.price) * 100.0) / SUM(SUM(oi.quantity * p.price)) OVER (PARTITION BY p.category) AS percentage_contribution
FROM Products p
INNER JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category;

-- 7.8 Compute the difference in price between the current and previous product in the same category.
SELECT p.product_id, p.product_name, p.category, p.price,
       p.price - LAG(p.price) OVER (PARTITION BY p.category ORDER BY p.product_id) AS price_difference
FROM Products p;

-- 7.9 Retrieve the first order date for each customer.
SELECT customer_id, MIN(order_date) AS first_order_date
FROM Orders
GROUP BY customer_id;

-- 7.10 Find the lag in total spending between customers ranked by total amount spent.
SELECT customer_id, total_spending,
       total_spending - LAG(total_spending) OVER (ORDER BY total_spending DESC) AS lag_in_spending
FROM (SELECT customer_id, SUM(total_amount) AS total_spending FROM Orders GROUP BY customer_id) AS customer_spending;

-- 7.11 Display the total number of orders placed by customers in each country.
SELECT c.country, c.customer_id, c.first_name, c.last_name,
       COUNT(o.order_id) OVER (PARTITION BY c.country) AS total_orders
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- 7.12 Compute the moving average of total order amounts over a 3-order window.
SELECT customer_id, order_id, total_amount,
       AVG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM Orders;

-- 7.13 List customers with their rank in terms of total spending within each country.
SELECT c.customer_id, c.first_name, c.last_name, c.country, SUM(o.total_amount) AS total_spending,
       RANK() OVER (PARTITION BY c.country ORDER BY SUM(o.total_amount) DESC ) AS ranks
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.country;

-- 7.14 Identify customers who placed orders in consecutive months.
WITH customer_orders AS (
    SELECT customer_id, EXTRACT(YEAR FROM order_date) AS order_year, EXTRACT(MONTH FROM order_date) AS order_month
    FROM Orders
)
SELECT a.customer_id, a.order_year, a.order_month
FROM customer_orders a
INNER JOIN customer_orders b ON a.customer_id = b.customer_id
WHERE a.order_year = b.order_year AND a.order_month = b.order_month - 1;

-- 7.15 Calculate the lead in product prices within each category.
SELECT p.product_id, p.product_name, p.category, p.price,
       LEAD(p.price) OVER (PARTITION BY p.category ORDER BY p.product_id) AS lead_price
FROM Products p;

-- 7.16 Find the cumulative revenue generated by each category.
SELECT p.category, 
       SUM(oi.quantity * p.price) AS revenue,
       SUM(SUM(oi.quantity * p.price)) OVER (PARTITION BY p.category ORDER BY o.order_date) AS cumulative_revenue
FROM Products p
INNER JOIN Order_Items oi ON p.product_id = oi.product_id
INNER JOIN Orders o ON oi.order_id = o.order_id
GROUP BY p.category, o.order_date;

-- 7.17 Rank products based on their total quantity sold across all orders.
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_quantity_sold,
       RANK() OVER (ORDER BY SUM(oi.quantity) DESC) AS ranks
FROM Products p
INNER JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- 7.18 Calculate the average quantity ordered for each product, partitioned by category.
SELECT p.category, p.product_id, p.product_name, AVG(oi.quantity) AS avg_quantity_ordered
FROM Products p
INNER JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.category, p.product_id, p.product_name;


-- 7.19 Rank customers based on the number of orders they have placed.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS total_orders,
       RANK() OVER (ORDER BY COUNT(o.order_id) DESC) AS ranks
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 7.20 Calculate the cumulative revenue per customer, sorted by order date.
SELECT customer_id, order_id, total_amount,
       SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS cumulative_revenue
FROM Orders;

-- 7.21 Find the percentage difference between the current and previous product price in each category.
SELECT p.product_id, p.product_name, p.category, p.price,
       (p.price - LAG(p.price) OVER (PARTITION BY p.category ORDER BY p.product_id)) * 100.0 / LAG(p.price) OVER (PARTITION BY p.category ORDER BY p.product_id) AS price_percentage_difference
FROM Products p;

-- 7.22 Determine the order in which products were purchased by each customer.
SELECT o.customer_id, oi.product_id, oi.quantity, oi.price,
       ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS product_order
FROM Orders o
INNER JOIN Order_Items oi ON o.order_id = oi.order_id;

-- 7.23 Calculate the rolling sum of quantities sold for each product over a 5-order window.
SELECT oi.product_id, oi.order_id, oi.quantity,
       SUM(oi.quantity) OVER (PARTITION BY oi.product_id ORDER BY oi.order_id ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS rolling_sum
FROM Order_Items oi;
   