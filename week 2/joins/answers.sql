-- 1
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- 2
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- 3
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id;

-- 4
SELECT e.emp_name, d.dept_name, s.salary
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
LEFT JOIN salaries s ON e.emp_id = s.emp_id;

-- 5
SELECT e.emp_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- 6
SELECT e.emp_name, p.project_name
FROM employees e
LEFT JOIN projects p ON e.emp_id = p.emp_id;

-- 7
SELECT e.emp_name, p.project_name
FROM employees e
INNER JOIN projects p ON e.emp_id = p.emp_id;

-- 8
SELECT e.emp_name, p.project_name
FROM employees e
RIGHT JOIN projects p ON e.emp_id = p.emp_id;

-- 9
SELECT e.emp_name, s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_id = s.emp_id;

-- 10
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- 11
SELECT d.dept_name, e.emp_name
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id;

-- 12
SELECT e.emp_name, c.phone, c.email
FROM employees e
LEFT JOIN contacts c ON e.emp_id = c.emp_id;

-- 13
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id

UNION

SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- 14
SELECT e.emp_name, p.project_name
FROM employees e
LEFT JOIN projects p ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;

-- 15
SELECT e.emp_name, p.project_name
FROM employees e
LEFT JOIN projects p ON e.emp_id = p.emp_id;

-- 16
SELECT p.project_name, e.emp_name
FROM projects p
LEFT JOIN employees e ON p.emp_id = e.emp_id;

-- 17
SELECT e.emp_name AS employee, m.emp_name AS manager, p.project_name
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id
INNER JOIN projects p ON e.emp_id = p.emp_id;

-- 18
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

-- 19
SELECT e.emp_name, d.dept_name
FROM employees e
JOIN employee_department ed ON e.emp_id = ed.emp_id
JOIN departments d ON ed.dept_id = d.dept_id;

-- 20
SELECT d.dept_name, e.emp_name
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id;

-- 21
SELECT e.emp_name, p.project_name
FROM employees e
JOIN projects p ON e.emp_id = p.emp_id
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- 22
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 23
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM employees e
INNER JOIN employees m ON e.manager_id = m.emp_id;

-- 24
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- 25
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 26
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id

UNION

SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- 27
SELECT e.emp_name
FROM employees e
LEFT JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.emp_id IS NULL;

-- 28
SELECT e.emp_name, p.project_name
FROM employees e
LEFT JOIN projects p ON e.emp_id = p.emp_id;

-- 29
SELECT e.emp_name, d.dept_name, p.project_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
LEFT JOIN projects p ON e.emp_id = p.emp_id;

-- 30
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;
