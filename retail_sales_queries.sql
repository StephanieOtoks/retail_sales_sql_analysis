---Question 1: How many customers and orders does the company have?
SELECT 
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM orders) AS total_orders;
	
---Question 2: What is the company's total revenue and average order value?
SELECT 
 EXTRACT(YEAR FROM order_date) AS year,
SUM(total_amount) AS total_revenue,
ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY year;

---Question 3: Which products generate the highest revenue?
SELECT P.product_id,P.product_name,SUM(OI.line_total) AS total_revenue
FROM products P
JOIN order_items OI
    ON P.product_id = OI.product_id
GROUP BY P.product_id,P.product_name
ORDER BY SUM(OI.line_total) DESC
LIMIT 10;

---Question 4: Which product categories generate the highest revenue?
SELECT P.category,SUM(OI.line_total) AS total_revenue
FROM products P
JOIN order_items OI
    ON P.product_id = OI.product_id
GROUP BY P.category
ORDER BY SUM(OI.line_total) DESC;

---Question 5: Which customers spend the most money?
SELECT C.customer_id,C.customer_name,SUM(O.total_amount) AS total_spent
FROM customers C
JOIN orders O
     ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.customer_name
ORDER BY SUM(O.total_amount) DESC;

---Question 6: Which cities generates the most revenue?
SELECT C.city, SUM(O.total_amount) AS total_revenue
FROM customers C
JOIN orders O
  ON C.customer_id = O.customer_id
GROUP BY C.city
ORDER BY SUM(O.total_amount)DESC;

---Question 7: How does revenue changes overtime by month?
SELECT 
 EXTRACT(YEAR FROM payment_date) AS year,
 EXTRACT(MONTH FROM payment_date) AS month,
SUM(amount) AS total_revenue
FROM payments
GROUP BY EXTRACT(YEAR FROM payment_date),
          EXTRACT(MONTH FROM payment_date)
ORDER BY  EXTRACT(YEAR FROM payment_date),
          EXTRACT(MONTH FROM payment_date);
		  
---Question 8: Which customers have placed more than one order?
SELECT C.customer_id,C.customer_name,COUNT(O.order_id) AS num_of_orders
FROM customers C
JOIN orders O
     ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.customer_name
HAVING COUNT(O.order_id)>1
ORDER BY COUNT(O.order_id) DESC;

---Question 9: Which products have the highest quantities sold?
SELECT p.product_id,p.product_name,SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id,p.product_name
ORDER BY total_quantity_sold DESC;

---Question 10: What is the breakdown of payments by payment method and payment status?
SELECT payment_method, payment_status, COUNT(*) AS num_payments, SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method, payment_status
ORDER BY payment_method, total_amount DESC;

---Question 11: How much money is currently associated with pending and refunded payments?
SELECT payment_status,SUM(amount) AS total_amount
FROM payments
WHERE payment_status IN ('Pending', 'Refunded')
GROUP BY payment_status;

---Question 12: Are there customers who have never placed an order?
SELECT c.customer_id,c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

---Question 13: Which customers have spent more than the average customer spending?
SELECT c.customer_id,c.customer_name,SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.customer_name
HAVING SUM(o.total_amount) > (
    SELECT AVG(customer_spending)
    FROM (
        SELECT
            customer_id,SUM(total_amount) AS customer_spending
        FROM orders
        GROUP BY customer_id
    ) AS customer_totals
)
ORDER BY total_spent DESC;


---Question 14: Based on the analysis, What are the main sales and 
-----payment insights management should know?


