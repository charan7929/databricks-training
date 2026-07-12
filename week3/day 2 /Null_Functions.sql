
## =========================================================

-- LEVEL 3 (COALESCE)
-- =========================================================

-- Show employee earnings using salary, if NULL use bonus
        SELECT emp_id, name,
        COALESCE(salary, bonus) AS earnings
        FROM Employees;

-- Show first available value: salary → bonus → 0
        SELECT emp_id, name,
        COALESCE(salary, bonus, 0) AS value
        FROM Employees;

-- Show product price: price → 1000 (default)
        SELECT product_id, product_name,
        COALESCE(price, 1000) AS price
        FROM Products;

-- Get customer payment: amount → discount → 0
        SELECT order_id, customer_name,
        COALESCE(amount, discount, 0) AS payment
        FROM Orders;


---

## =========================================================

-- LEVEL 4 (NULLIF)
-- =========================================================

-- Convert salary to NULL if salary = 0
        SELECT emp_id, name,
        NULLIF(salary, 0) AS salary
        FROM Employees;

-- Convert discount to NULL if discount = 0
        SELECT order_id, customer_name,
        NULLIF(discount, 0) AS discount
        FROM Orders;

-- Use NULLIF to avoid divide by zero:
-- SELECT amount / NULLIF(discount, 0)
-- FROM Orders;
        SELECT order_id,
        amount / NULLIF(discount, 0) AS result
        FROM Orders;

-- Replace coupon_code with NULL if it is 'DISC10'
        SELECT order_id, customer_name,
        NULLIF(coupon_code, 'DISC10') AS coupon_code
        FROM Orders;


---

## =========================================================

-- LEVEL 5 (REAL-TIME SCENARIOS)
-- =========================================================

-- Calculate total earnings: salary + bonus (handle NULL properly)
        SELECT emp_id, name,
        COALESCE(salary, 0) + COALESCE(bonus, 0) AS total_earnings
        FROM Employees;

-- Show employees where both salary AND bonus are NULL
        SELECT *
        FROM Employees
        WHERE salary IS NULL AND bonus IS NULL;

-- Show products where price is NULL but category is NOT NULL
        SELECT *
        FROM Products
        WHERE price IS NULL AND category IS NOT NULL;

-- Show orders where both amount and discount are NULL
        SELECT *
        FROM Orders
        WHERE amount IS NULL AND discount IS NULL;

---

## =========================================================

-- LEVEL 6 (ADVANCED)
-- =========================================================

-- Show employee income: COALESCE(salary, bonus, 1000)
        SELECT emp_id, name,
        COALESCE(salary, bonus, 1000) AS income
        FROM Employees;

-- Replace empty discount with NULL using NULLIF(discount, 0)
        SELECT order_id, customer_name,
        NULLIF(discount, 0) AS discount
        FROM Orders;

-- Show final payable amount: amount - discount (handle NULL)
        SELECT order_id, customer_name,
        COALESCE(amount, 0) - COALESCE(discount, 0) AS payable_amount
        FROM Orders;

-- Find employees where salary is NULL but manager exists
        SELECT *
        FROM Employees
        WHERE salary IS NULL AND manager_id IS NOT NULL;
