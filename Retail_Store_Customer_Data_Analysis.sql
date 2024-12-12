-- Querying the top 10 customers by total spend

SELECT 
    c.customer_name, 
    SUM(t.quantity * p.price) AS TotalSpend
FROM transactions t
JOIN customers c ON t.customerid = c.customer_id
JOIN products p ON t.productid = p.product_id
GROUP BY c.customer_name
ORDER BY TotalSpend DESC
LIMIT 10;


-- Querying total customer sign-ups by location

SELECT c.location, COUNT(*) AS total_customers
FROM customers as c
GROUP BY c.location
ORDER BY total_customers DESC;


-- Querying top 5 best-selling products by quantity sold

SELECT p.product_name, SUM(t.quantity) AS total_sold
FROM transactions t
JOIN products p ON p.product_id = t.productid
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;


-- Querying revenue contribution by product category

SELECT p.category_id, SUM(t.quantity*p.price) AS total_revenue
FROM transactions t
JOIN products p ON t.productid = p.product_id
GROUP BY p.category_id
ORDER BY total_revenue DESC;


-- Querying customers who purchased the most expensive product

SELECT
     c.customer_name,
     p.product_name,
     p.price,
     t.quantity
FROM transactions t
JOIN customers c ON t.customerid = c.customer_id
JOIN products p ON t.productid = p.product_id
WHERE p.price = (SELECT MAX(price) FROM products);


-- Querying the most frequent buyers

SELECT c.customer_name, COUNT(t.transactionid) AS PurchaseCount
FROM transactions t
JOIN customers c ON c.customer_id = t.customerid
GROUP BY c.customer_name
ORDER BY PurchaseCount DESC
LIMIT 5;

    
    


