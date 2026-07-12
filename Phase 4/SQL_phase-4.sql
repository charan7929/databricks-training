-- ==========================================================
-- Task 1 : Daily Sales
-- ==========================================================

SELECT
    order_date,
    SUM(total_amount) AS total_sales
FROM sales
WHERE customer_id IS NOT NULL
AND total_amount > 0
GROUP BY order_date;

-- ==========================================================
-- Task 2 : City-wise Revenue
-- ==========================================================

SELECT
    c.city,
    SUM(s.total_amount) AS total_revenue
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.city;

-- ==========================================================
-- Task 3 : Top 5 Customers
-- ==========================================================

SELECT
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(s.total_amount) AS total_spend
FROM customers c
JOIN sales s
ON c.customer_id=s.customer_id
GROUP BY
    c.first_name,
    c.last_name
ORDER BY total_spend DESC
LIMIT 5;

-- ==========================================================
-- Task 4 : Repeat Customers
-- ==========================================================

SELECT
    customer_id,
    COUNT(*) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(*)>1;

-- ==========================================================
-- Task 5 : Customer Segmentation
-- ==========================================================

SELECT
    customer_name,
    total_spend,
    CASE
        WHEN total_spend>10000 THEN 'Gold'
        WHEN total_spend BETWEEN 5000 AND 10000 THEN 'Silver'
        ELSE 'Bronze'
    END AS segment
FROM
(
SELECT
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(s.total_amount) AS total_spend
FROM customers c
JOIN sales s
ON c.customer_id=s.customer_id
GROUP BY
    c.first_name,
    c.last_name
)t;

-- ==========================================================
-- Task 6 : Final Reporting Table
-- ==========================================================

SELECT
    customer_name,
    city,
    total_spend,
    order_count,
    CASE
        WHEN total_spend>10000 THEN 'Gold'
        WHEN total_spend BETWEEN 5000 AND 10000 THEN 'Silver'
        ELSE 'Bronze'
    END AS segment
FROM
(
SELECT
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    c.city,
    SUM(s.total_amount) AS total_spend,
    COUNT(*) AS order_count
FROM customers c
JOIN sales s
ON c.customer_id=s.customer_id
GROUP BY
    c.first_name,
    c.last_name,
    c.city
)t;
