-- ==========================================================
-- Customer Total Spend
-- ==========================================================

SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(s.total_amount) AS total_spend
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;

-- ==========================================================
-- Task 1 : Customer Segmentation
-- ==========================================================

SELECT
    customer_name,
    total_spend,
    CASE
        WHEN total_spend > 10000 THEN 'Gold'
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
-- Task 2 : Count Customers by Segment
-- ==========================================================

SELECT
    segment,
    COUNT(*) AS customer_count
FROM
(
SELECT
    CASE
        WHEN SUM(s.total_amount) > 10000 THEN 'Gold'
        WHEN SUM(s.total_amount) BETWEEN 5000 AND 10000 THEN 'Silver'
        ELSE 'Bronze'
    END AS segment
FROM customers c
JOIN sales s
ON c.customer_id=s.customer_id
GROUP BY
    c.customer_id
)t
GROUP BY segment;
