-- ==========================================================
-- 1. Daily Sales
-- ==========================================================

SELECT
    order_date,
    SUM(total_amount) AS daily_sales
FROM sales
WHERE customer_id IS NOT NULL
AND total_amount > 0
GROUP BY order_date;

-- ==========================================================
-- 2. City-wise Revenue
-- ==========================================================

SELECT
    c.city,
    SUM(s.total_amount) AS total_revenue
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.city;

-- ==========================================================
-- 3. Repeat Customers (>2 Orders)
-- ==========================================================

SELECT
    customer_id,
    COUNT(*) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(*) > 2;

-- ==========================================================
-- 4. Highest Spending Customer in Each City
-- ==========================================================

SELECT *
FROM (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        c.city,
        SUM(s.total_amount) AS total_spend,
        ROW_NUMBER() OVER(
            PARTITION BY c.city
            ORDER BY SUM(s.total_amount) DESC
        ) AS rn
    FROM customers c
    JOIN sales s
    ON c.customer_id = s.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city
) t
WHERE rn = 1;

-- ==========================================================
-- 5. Final Reporting Table
-- ==========================================================

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    SUM(s.total_amount) AS total_spend,
    COUNT(*) AS order_count
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
ORDER BY total_spend DESC;
