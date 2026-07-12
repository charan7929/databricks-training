1.
CREATE TABLE Employees (
emp_id INT,
name VARCHAR(50),
salary INT,
bonus INT,
manager_id INT
);

-- Data

INSERT INTO Employees VALUES
(1, 'Amit', 50000, NULL, 101),
(2, 'John', NULL, 5000, 102),
(3, 'Sara', 60000, NULL, NULL),
(4, 'David', NULL, NULL, 103),
(5, 'Priya', 45000, 3000, 101),
(6, 'Kiran', NULL, NULL, NULL),
(7, 'Ravi', 70000, 7000, 102),
(8, 'Neha', NULL, 2000, NULL);

---

2.
CREATE TABLE Orders (
order_id INT,
customer_name VARCHAR(50),
amount INT,
discount INT,
coupon_code VARCHAR(20)
);

-- Data

INSERT INTO Orders VALUES
(101, 'Amit', 1000, NULL, 'DISC10'),
(102, 'John', NULL, 50, NULL),
(103, 'Sara', 2000, NULL, 'DISC20'),
(104, 'David', NULL, NULL, NULL),
(105, 'Priya', 1500, 100, NULL),
(106, 'Kiran', NULL, NULL, 'DISC5'),
(107, 'Ravi', 3000, NULL, NULL),
(108, 'Neha', NULL, 200, 'DISC15');

---

3.
CREATE TABLE Products (
product_id INT,
product_name VARCHAR(50),
price INT,
category VARCHAR(50),
stock INT
);

-- Data

INSERT INTO Products VALUES
(1, 'Laptop', 50000, 'Electronics', 10),
(2, 'Phone', NULL, 'Electronics', NULL),
(3, 'Tablet', 30000, NULL, 5),
(4, 'Headphones', NULL, NULL, NULL),
(5, 'Monitor', 20000, 'Electronics', 0),
(6, 'Keyboard', NULL, 'Accessories', 15),
(7, 'Mouse', 500, NULL, NULL),
(8, 'Printer', NULL, 'Electronics', 3);

---

## =========================================================

-- LEVEL 1 (BASIC)
-- =========================================================

-- Show all employees whose salary is NULL
        SELECT *
        FROM Employees
        WHERE salary IS NULL;

-- Show all orders where discount is NOT NULL
        SELECT *
        FROM Orders
        WHERE discount IS NOT NULL;

-- Get products where category is NULL
        SELECT *
        FROM Products
        WHERE category IS NULL;

-- Count number of employees with NULL manager_id
        SELECT COUNT(*) AS null_manager_count
        FROM Employees
        WHERE manager_id IS NULL;

---

## =========================================================

-- LEVEL 2 (ISNULL)
-- =========================================================

-- Replace NULL salary with 0
        SELECT emp_id, name, ISNULL(salary, 0) AS salary
        FROM Employees;

-- Replace NULL bonus with 1000
        SELECT emp_id, name, ISNULL(bonus, 1000) AS bonus
        FROM Employees;

-- Show order amount, if NULL replace with 500
        SELECT order_id, customer_name, ISNULL(amount, 500) AS amount
        FROM Orders;

-- Replace NULL stock with 0
        SELECT product_id, product_name, ISNULL(stock, 0) AS stock
        FROM Products;
