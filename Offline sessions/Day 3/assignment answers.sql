-- ==========================================================
-- BASIC ASSIGNMENTS - INNER JOIN
-- ==========================================================

-- ==========================================================
-- 1. Display employee names with department names
-- ==========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 2. Display project names with department names
-- ==========================================================

SELECT
    p.ProjectName,
    d.DepartmentName
FROM Projects p
INNER JOIN Departments d
ON p.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 3. Show employees along with project names
-- ==========================================================

SELECT
    e.EmployeeName,
    p.ProjectName
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

-- ==========================================================
-- 4. Show employee salary and department location
-- ==========================================================

SELECT
    e.EmployeeName,
    e.Salary,
    d.Location
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 5. Display all employees working on projects
-- ==========================================================

SELECT
    e.EmployeeID,
    e.EmployeeName,
    p.ProjectName
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- ==========================================================
-- BASIC ASSIGNMENTS - LEFT JOIN
-- ==========================================================

-- ==========================================================
-- 6. Show all employees even if they don't belong to any department
-- ==========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 7. Show all departments even if no employee works there
-- ==========================================================

SELECT
    d.DepartmentName,
    e.EmployeeName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

-- ==========================================================
-- 8. Show all projects and their department names
-- ==========================================================

SELECT
    p.ProjectName,
    d.DepartmentName
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 9. Show every employee and their assigned projects
-- ==========================================================

SELECT
    e.EmployeeName,
    p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
ON ep.ProjectID = p.ProjectID;

-- ==========================================================
-- 10. Display all employees even if they are not assigned to any project
-- ==========================================================

SELECT
    e.EmployeeName,
    p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- ==========================================================
-- BASIC ASSIGNMENTS - RIGHT JOIN
-- ==========================================================

-- ==========================================================
-- 11. Show all departments even if there are no employees
-- ==========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 12. Show all projects even if no employee is assigned
-- ==========================================================

SELECT
    p.ProjectName,
    e.EmployeeName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees e
ON ep.EmployeeID = e.EmployeeID;

-- ==========================================================
-- 13. Display every department and employees
-- ==========================================================

SELECT
    d.DepartmentName,
    e.EmployeeName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 14. Show all projects with departments
-- ==========================================================

SELECT
    p.ProjectName,
    d.DepartmentName
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

-- ==========================================================
-- 15. Show every project assignment including projects without employees
-- ==========================================================

SELECT
    p.ProjectName,
    e.EmployeeName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees e
ON ep.EmployeeID = e.EmployeeID;


-- ==========================================================
-- BASIC ASSIGNMENTS - FULL JOIN
-- ==========================================================

-- ==========================================================
-- 16. Show all employees and all departments
-- ==========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 17. Show all departments and projects
-- ==========================================================

SELECT
    d.DepartmentName,
    p.ProjectName
FROM Departments d
FULL OUTER JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

-- ==========================================================
-- 18. Display all employees and projects
-- ==========================================================

SELECT
    e.EmployeeName,
    p.ProjectName
FROM Employees e
FULL OUTER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
FULL OUTER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

-- ==========================================================
-- 19. Show every department whether employees exist or not
-- ==========================================================

SELECT
    d.DepartmentName,
    e.EmployeeName
FROM Departments d
FULL OUTER JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

-- ==========================================================
-- 20. Show all departments and projects including unmatched records
-- ==========================================================

SELECT
    d.DepartmentName,
    p.ProjectName
FROM Departments d
FULL OUTER JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

-- ==========================================================
-- INTERMEDIATE ASSIGNMENTS - INNER JOIN
-- ==========================================================

-- ==========================================================
-- 21. Show employees whose department is IT
-- ==========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';

-- ==========================================================
-- 22. Display employees working on projects with budget above 200000
-- ==========================================================

SELECT
    e.EmployeeName,
    p.ProjectName,
    p.Budget
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE p.Budget > 200000;

-- ==========================================================
-- 23. Show employee names, department names and project names
-- ==========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName,
    p.ProjectName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

-- ==========================================================
-- 24. Display total employees in each department
-- ==========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS TotalEmployees
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

-- ==========================================================
-- 25. Show average salary department-wise
-- ==========================================================

SELECT
    d.DepartmentName,
    AVG(e.Salary) AS AverageSalary
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- ==========================================================
-- INTERMEDIATE ASSIGNMENTS - LEFT JOIN
-- ==========================================================

-- ==========================================================
-- 26. Find employees without departments
-- ==========================================================

SELECT
    e.EmployeeName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- ==========================================================
-- 27. Find employees without projects
-- ==========================================================

SELECT
    e.EmployeeName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;

-- ==========================================================
-- 28. Find departments without employees
-- ==========================================================

SELECT
    d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;

-- ==========================================================
-- 29. Find projects without departments
-- ==========================================================

SELECT
    p.ProjectName
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- ==========================================================
-- 30. Show departments with total employees including zero employees
-- ==========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS TotalEmployees
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- ==========================================================
-- INTERMEDIATE ASSIGNMENTS - RIGHT JOIN
-- ==========================================================

-- ==========================================================
-- 31. Find departments having no employees
-- ==========================================================

SELECT
    d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;

-- ==========================================================
-- 32. Find projects without employees
-- ==========================================================

SELECT
    p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

-- ==========================================================
-- 33. Show departments even if no projects exist
-- ==========================================================

SELECT
    d.DepartmentName,
    p.ProjectName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 34. Count employees in every department
-- ==========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS TotalEmployees
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- ==========================================================
-- 35. List every project whether employees are assigned or not
-- ==========================================================

SELECT
    p.ProjectName,
    e.EmployeeName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees e
ON ep.EmployeeID = e.EmployeeID;


-- ==========================================================
-- INTERMEDIATE ASSIGNMENTS - FULL JOIN
-- ==========================================================

-- ==========================================================
-- 36. Display all departments and employees
-- ==========================================================

SELECT
    d.DepartmentName,
    e.EmployeeName
FROM Departments d
FULL OUTER JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

-- ==========================================================
-- 37. Show unmatched employees
-- ==========================================================

SELECT
    e.EmployeeName
FROM Employees e
FULL OUTER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- ==========================================================
-- 38. Show unmatched departments
-- ==========================================================

SELECT
    d.DepartmentName
FROM Departments d
FULL OUTER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;

-- ==========================================================
-- 39. Show all employees and departments with NULL handling
-- ==========================================================

SELECT
    COALESCE(e.EmployeeName,'No Employee') AS EmployeeName,
    COALESCE(d.DepartmentName,'No Department') AS DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 40. Display departments and projects including unmatched rows
-- ==========================================================

SELECT
    COALESCE(d.DepartmentName,'No Department') AS DepartmentName,
    COALESCE(p.ProjectName,'No Project') AS ProjectName
FROM Departments d
FULL OUTER JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

-- ==========================================================
-- ADVANCED ASSIGNMENTS - INNER JOIN
-- ==========================================================

-- ==========================================================
-- 41. Find highest-paid employee in every department
-- ==========================================================

SELECT
    d.DepartmentName,
    e.EmployeeName,
    e.Salary
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
    SELECT MAX(e2.Salary)
    FROM Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
);

-- ==========================================================
-- 42. Find department having highest average salary
-- ==========================================================

SELECT
    d.DepartmentName,
    AVG(e.Salary) AS AverageSalary
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY AverageSalary DESC
LIMIT 1;

-- ==========================================================
-- 43. Find employee working on highest-budget project
-- ==========================================================

SELECT
    e.EmployeeName,
    p.ProjectName,
    p.Budget
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE p.Budget = (
    SELECT MAX(Budget)
    FROM Projects
);

-- ==========================================================
-- 44. Show managers and their employees
-- ==========================================================

SELECT
    m.EmployeeName AS ManagerName,
    e.EmployeeName AS EmployeeName
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID;

-- ==========================================================
-- 45. Find employees working on more than one project
-- ==========================================================

SELECT
    e.EmployeeName,
    COUNT(ep.ProjectID) AS TotalProjects
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName
HAVING COUNT(ep.ProjectID) > 1;


-- ==========================================================
-- ADVANCED ASSIGNMENTS - LEFT JOIN
-- ==========================================================

-- ==========================================================
-- 46. Find employees not assigned to any project
-- ==========================================================

SELECT
    e.EmployeeName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;

-- ==========================================================
-- 47. Find departments having no projects
-- ==========================================================

SELECT
    d.DepartmentName
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

-- ==========================================================
-- 48. Find departments having employees but no projects
-- ==========================================================

SELECT DISTINCT
    d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE e.EmployeeID IS NOT NULL
AND p.ProjectID IS NULL;

-- ==========================================================
-- 49. Show employees with project count
-- ==========================================================

SELECT
    e.EmployeeName,
    COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName;

-- ==========================================================
-- 50. Show project count department-wise including zero
-- ==========================================================

SELECT
    d.DepartmentName,
    COUNT(p.ProjectID) AS ProjectCount
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;


-- ==========================================================
-- ADVANCED ASSIGNMENTS - RIGHT JOIN
-- ==========================================================

-- ==========================================================
-- 51. Find projects without employees
-- ==========================================================

SELECT
    p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

-- ==========================================================
-- 52. Find departments without projects
-- ==========================================================

SELECT
    d.DepartmentName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;

-- ==========================================================
-- 53. Find projects whose department doesn't exist
-- ==========================================================

SELECT
    p.ProjectName
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL;

-- ==========================================================
-- 54. Find orphan employee records
-- ==========================================================

SELECT
    e.EmployeeName
FROM Departments d
RIGHT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL;

-- ==========================================================
-- 55. Display every department and employee count
-- ==========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;


-- ==========================================================
-- ADVANCED ASSIGNMENTS - FULL JOIN
-- ==========================================================

-- ==========================================================
-- 56. Display all employees and departments
-- ==========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- ==========================================================
-- 57. Display all departments and projects
-- ==========================================================

SELECT
    d.DepartmentName,
    p.ProjectName
FROM Departments d
FULL OUTER JOIN Projects p
ON d.DepartmentID = p.DepartmentID;

-- ==========================================================
-- 58. Display all employees and projects
-- ==========================================================

SELECT
    e.EmployeeName,
    p.ProjectName
FROM Employees e
FULL OUTER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
FULL OUTER JOIN Projects p
ON ep.ProjectID = p.ProjectID;

-- ==========================================================
-- 59. Display all managers and employees including unmatched
-- ==========================================================

SELECT
    COALESCE(m.EmployeeName,'No Manager') AS ManagerName,
    COALESCE(e.EmployeeName,'No Employee') AS EmployeeName
FROM Employees e
FULL OUTER JOIN Employees m
ON e.ManagerID = m.EmployeeID;

-- ==========================================================
-- 60. Display all departments and employees with NULL handling
-- ==========================================================

SELECT
    COALESCE(d.DepartmentName,'No Department') AS DepartmentName,
    COALESCE(e.EmployeeName,'No Employee') AS EmployeeName
FROM Departments d
FULL OUTER JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

-- ==========================================================
-- LEFT ANTI JOIN
-- (Records present in LEFT table but not in RIGHT table)
-- ==========================================================

-- ==========================================================
-- 61. Find employees without departments
-- ==========================================================

SELECT
    e.EmployeeID,
    e.EmployeeName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- ==========================================================
-- 62. Find departments without employees
-- ==========================================================

SELECT
    d.DepartmentID,
    d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;

-- ==========================================================
-- 63. Find employees without projects
-- ==========================================================

SELECT
    e.EmployeeID,
    e.EmployeeName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;

-- ==========================================================
-- 64. Find departments without projects
-- ==========================================================

SELECT
    d.DepartmentID,
    d.DepartmentName
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

-- ==========================================================
-- 65. Find projects without departments
-- ==========================================================

SELECT
    p.ProjectID,
    p.ProjectName
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- ==========================================================
-- RIGHT ANTI JOIN
-- (Records present in RIGHT table but not in LEFT table)
-- ==========================================================

-- ==========================================================
-- 66. Find departments without employees
-- ==========================================================

SELECT
    d.DepartmentID,
    d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;

-- ==========================================================
-- 67. Find projects without employees
-- ==========================================================

SELECT
    p.ProjectID,
    p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

-- ==========================================================
-- 68. Find departments without projects
-- ==========================================================

SELECT
    d.DepartmentID,
    d.DepartmentName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;

-- ==========================================================
-- 69. Find employees whose departments don't exist
-- ==========================================================

SELECT
    e.EmployeeID,
    e.EmployeeName
FROM Departments d
RIGHT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL;

-- ==========================================================
-- 70. Find projects whose departments don't exist
-- ==========================================================

SELECT
    p.ProjectID,
    p.ProjectName
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL;

-- ==========================================================
-- FULL ANTI JOIN
-- (Records that have no matching record on either side)
-- ==========================================================

-- ==========================================================
-- 71. Find all unmatched employees and departments
-- ==========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL
   OR d.DepartmentID IS NULL;

-- ==========================================================
-- 72. Find all unmatched departments and employees
-- ==========================================================

SELECT
    d.DepartmentName,
    e.EmployeeName
FROM Departments d
FULL OUTER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL
   OR e.DepartmentID IS NULL;

-- ==========================================================
-- 73. Find projects without departments and departments without projects
-- ==========================================================

SELECT
    d.DepartmentName,
    p.ProjectName
FROM Departments d
FULL OUTER JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL
   OR p.DepartmentID IS NULL;

-- ==========================================================
-- 74. Find employees without projects and projects without employees
-- ==========================================================

SELECT
    e.EmployeeName,
    p.ProjectName
FROM Employees e
FULL OUTER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
FULL OUTER JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE e.EmployeeID IS NULL
   OR p.ProjectID IS NULL;

-- ==========================================================
-- 75. Show all orphan records across Employees and Departments
-- ==========================================================

SELECT
    e.EmployeeID,
    e.EmployeeName,
    d.DepartmentID,
    d.DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL
   OR d.DepartmentID IS NULL;

-- ==========================================================
-- SET OPERATORS - BASIC ASSIGNMENTS
-- ==========================================================

-- ==========================================================
-- UNION
-- ==========================================================

-- ==========================================================
-- 86. Display all employee names from current and former
-- employees without duplicates
-- ==========================================================

SELECT EmployeeName
FROM CurrentEmployees
UNION
SELECT EmployeeName
FROM FormerEmployees;

-- ==========================================================
-- 87. Display all departments from both employee tables
-- ==========================================================

SELECT Department
FROM CurrentEmployees
UNION
SELECT Department
FROM FormerEmployees;

-- ==========================================================
-- 88. Display all customer names from domestic and
-- international customers
-- ==========================================================

SELECT CustomerName
FROM DomesticCustomers
UNION
SELECT CustomerName
FROM InternationalCustomers;

-- ==========================================================
-- 89. Display all customer cities without duplicates
-- ==========================================================

SELECT City
FROM DomesticCustomers
UNION
SELECT City
FROM InternationalCustomers;

-- ==========================================================
-- 90. Display all order amounts from both order tables
-- without duplicates
-- ==========================================================

SELECT Amount
FROM OnlineOrders
UNION
SELECT Amount
FROM StoreOrders;

-- ==========================================================
-- UNION ALL
-- ==========================================================

-- ==========================================================
-- 91. Display all employee names including duplicates
-- ==========================================================

SELECT EmployeeName
FROM CurrentEmployees
UNION ALL
SELECT EmployeeName
FROM FormerEmployees;

-- ==========================================================
-- 92. Display all departments including duplicate values
-- ==========================================================

SELECT Department
FROM CurrentEmployees
UNION ALL
SELECT Department
FROM FormerEmployees;

-- ==========================================================
-- 93. Display all customer names including duplicates
-- ==========================================================

SELECT CustomerName
FROM DomesticCustomers
UNION ALL
SELECT CustomerName
FROM InternationalCustomers;

-- ==========================================================
-- 94. Display all customer cities including duplicates
-- ==========================================================

SELECT City
FROM DomesticCustomers
UNION ALL
SELECT City
FROM InternationalCustomers;

-- ==========================================================
-- 95. Display all order amounts including duplicate values
-- ==========================================================

SELECT Amount
FROM OnlineOrders
UNION ALL
SELECT Amount
FROM StoreOrders;

-- ==========================================================
-- EXCEPT
-- ==========================================================

-- ==========================================================
-- 96. Find current employees who are not former employees
-- ==========================================================

SELECT EmployeeID, EmployeeName
FROM CurrentEmployees
EXCEPT
SELECT EmployeeID, EmployeeName
FROM FormerEmployees;

-- ==========================================================
-- 97. Find former employees who are not current employees
-- ==========================================================

SELECT EmployeeID, EmployeeName
FROM FormerEmployees
EXCEPT
SELECT EmployeeID, EmployeeName
FROM CurrentEmployees;

-- ==========================================================
-- 98. Find domestic customers not present internationally
-- ==========================================================

SELECT CustomerID, CustomerName
FROM DomesticCustomers
EXCEPT
SELECT CustomerID, CustomerName
FROM InternationalCustomers;

-- ==========================================================
-- 99. Find online orders not present in store orders
-- ==========================================================

SELECT OrderID
FROM OnlineOrders
EXCEPT
SELECT OrderID
FROM StoreOrders;

-- ==========================================================
-- 100. Find departments that exist only in current employees
-- ==========================================================

SELECT Department
FROM CurrentEmployees
EXCEPT
SELECT Department
FROM FormerEmployees;

-- ==========================================================
-- INTERSECT
-- ==========================================================

-- ==========================================================
-- 101. Find employees present in both tables
-- ==========================================================

SELECT EmployeeID, EmployeeName
FROM CurrentEmployees
INTERSECT
SELECT EmployeeID, EmployeeName
FROM FormerEmployees;

-- ==========================================================
-- 102. Find common departments
-- ==========================================================

SELECT Department
FROM CurrentEmployees
INTERSECT
SELECT Department
FROM FormerEmployees;

-- ==========================================================
-- 103. Find customers present in both customer tables
-- ==========================================================

SELECT CustomerID, CustomerName
FROM DomesticCustomers
INTERSECT
SELECT CustomerID, CustomerName
FROM InternationalCustomers;

-- ==========================================================
-- 104. Find common cities
-- ==========================================================

SELECT City
FROM DomesticCustomers
INTERSECT
SELECT City
FROM InternationalCustomers;

-- ==========================================================
-- 105. Find common orders
-- ==========================================================

SELECT OrderID
FROM OnlineOrders
INTERSECT
SELECT OrderID
FROM StoreOrders;

-- ==========================================================
-- SET OPERATORS - INTERMEDIATE ASSIGNMENTS
-- ==========================================================

-- ==========================================================
-- UNION
-- ==========================================================

-- ==========================================================
-- 106. Display all employee IDs and names
-- ==========================================================

SELECT
    EmployeeID,
    EmployeeName
FROM CurrentEmployees
UNION
SELECT
    EmployeeID,
    EmployeeName
FROM FormerEmployees;

-- ==========================================================
-- 107. Display all customer IDs and names
-- ==========================================================

SELECT
    CustomerID,
    CustomerName
FROM DomesticCustomers
UNION
SELECT
    CustomerID,
    CustomerName
FROM InternationalCustomers;

-- ==========================================================
-- 108. Display all salaries without duplicates
-- ==========================================================

SELECT
    Salary
FROM CurrentEmployees
UNION
SELECT
    Salary
FROM FormerEmployees;

-- ==========================================================
-- 109. Display all order IDs
-- ==========================================================

SELECT
    OrderID
FROM OnlineOrders
UNION
SELECT
    OrderID
FROM StoreOrders;

-- ==========================================================
-- 110. Combine employee and former employee department lists
-- ==========================================================

SELECT
    Department
FROM CurrentEmployees
UNION
SELECT
    Department
FROM FormerEmployees;

-- ==========================================================
-- UNION ALL
-- ==========================================================

-- ==========================================================
-- 111. Count total rows returned using UNION ALL
-- ==========================================================

SELECT
    COUNT(*) AS TotalRows
FROM
(
    SELECT EmployeeID
    FROM CurrentEmployees
    UNION ALL
    SELECT EmployeeID
    FROM FormerEmployees
) AS Employees;

-- ==========================================================
-- 112. Display all customer records including duplicates
-- ==========================================================

SELECT *
FROM DomesticCustomers
UNION ALL
SELECT *
FROM InternationalCustomers;

-- ==========================================================
-- 113. Display all salaries including duplicates
-- ==========================================================

SELECT
    Salary
FROM CurrentEmployees
UNION ALL
SELECT
    Salary
FROM FormerEmployees;

-- ==========================================================
-- 114. Display all customer cities
-- ==========================================================

SELECT
    City
FROM DomesticCustomers
UNION ALL
SELECT
    City
FROM InternationalCustomers;

-- ==========================================================
-- 115. Display all order amounts
-- ==========================================================

SELECT
    Amount
FROM OnlineOrders
UNION ALL
SELECT
    Amount
FROM StoreOrders;

-- ==========================================================
-- EXCEPT
-- ==========================================================

-- ==========================================================
-- 116. Find employee IDs existing only in CurrentEmployees
-- ==========================================================

SELECT
    EmployeeID
FROM CurrentEmployees
EXCEPT
SELECT
    EmployeeID
FROM FormerEmployees;

-- ==========================================================
-- 117. Find employee IDs existing only in FormerEmployees
-- ==========================================================

SELECT
    EmployeeID
FROM FormerEmployees
EXCEPT
SELECT
    EmployeeID
FROM CurrentEmployees;

-- ==========================================================
-- 118. Find customer IDs existing only in DomesticCustomers
-- ==========================================================

SELECT
    CustomerID
FROM DomesticCustomers
EXCEPT
SELECT
    CustomerID
FROM InternationalCustomers;

-- ==========================================================
-- 119. Find customer IDs existing only in InternationalCustomers
-- ==========================================================

SELECT
    CustomerID
FROM InternationalCustomers
EXCEPT
SELECT
    CustomerID
FROM DomesticCustomers;

-- ==========================================================
-- 120. Find online order IDs not found in StoreOrders
-- ==========================================================

SELECT
    OrderID
FROM OnlineOrders
EXCEPT
SELECT
    OrderID
FROM StoreOrders;

-- ==========================================================
-- INTERSECT
-- ==========================================================

-- ==========================================================
-- 121. Find employee IDs common to both tables
-- ==========================================================

SELECT
    EmployeeID
FROM CurrentEmployees
INTERSECT
SELECT
    EmployeeID
FROM FormerEmployees;

-- ==========================================================
-- 122. Find common customer IDs
-- ==========================================================

SELECT
    CustomerID
FROM DomesticCustomers
INTERSECT
SELECT
    CustomerID
FROM InternationalCustomers;

-- ==========================================================
-- 123. Find common order IDs
-- ==========================================================

SELECT
    OrderID
FROM OnlineOrders
INTERSECT
SELECT
    OrderID
FROM StoreOrders;

-- ==========================================================
-- 124. Find common salaries
-- ==========================================================

SELECT
    Salary
FROM CurrentEmployees
INTERSECT
SELECT
    Salary
FROM FormerEmployees;

-- ==========================================================
-- 125. Find common departments
-- ==========================================================

SELECT
    Department
FROM CurrentEmployees
INTERSECT
SELECT
    Department
FROM FormerEmployees;

-- ==========================================================
-- SET OPERATORS - ADVANCED ASSIGNMENTS
-- ==========================================================


-- ==========================================================
-- UNION
-- ==========================================================

-- ==========================================================
-- 126. Combine employee names with customer names into one list
-- ==========================================================

SELECT
    EmployeeName AS Name
FROM CurrentEmployees
UNION
SELECT
    CustomerName
FROM DomesticCustomers;

-- ==========================================================
-- 127. Create a unique list of all people and organizations
-- ==========================================================

SELECT
    EmployeeName AS Name
FROM CurrentEmployees
UNION
SELECT
    EmployeeName
FROM FormerEmployees
UNION
SELECT
    CustomerName
FROM DomesticCustomers
UNION
SELECT
    CustomerName
FROM InternationalCustomers;

-- ==========================================================
-- 128. Display all departments from both tables
-- in alphabetical order
-- ==========================================================

SELECT
    Department
FROM CurrentEmployees
UNION
SELECT
    Department
FROM FormerEmployees
ORDER BY Department;

-- ==========================================================
-- 129. Combine customer cities and employee departments
-- into one result set
-- ==========================================================

SELECT
    City AS Location
FROM DomesticCustomers
UNION
SELECT
    City
FROM InternationalCustomers
UNION
SELECT
    Department
FROM CurrentEmployees
UNION
SELECT
    Department
FROM FormerEmployees;

-- ==========================================================
-- 130. Display all IDs from employees and customers
-- ==========================================================

SELECT
    EmployeeID AS ID
FROM CurrentEmployees
UNION
SELECT
    EmployeeID
FROM FormerEmployees
UNION
SELECT
    CustomerID
FROM DomesticCustomers
UNION
SELECT
    CustomerID
FROM InternationalCustomers;

-- ==========================================================
-- UNION ALL
-- ==========================================================

-- ==========================================================
-- 131. Combine all employee and former employee records
-- including duplicates
-- ==========================================================

SELECT *
FROM CurrentEmployees
UNION ALL
SELECT *
FROM FormerEmployees;

-- ==========================================================
-- 132. Display all order records
-- ==========================================================

SELECT *
FROM OnlineOrders
UNION ALL
SELECT *
FROM StoreOrders;

-- ==========================================================
-- 133. Display all customer records
-- ==========================================================

SELECT *
FROM DomesticCustomers
UNION ALL
SELECT *
FROM InternationalCustomers;

-- ==========================================================
-- 134. Display employee names with a new column indicating
-- the source table
-- ==========================================================

SELECT
    EmployeeID,
    EmployeeName,
    'Current Employee' AS Source
FROM CurrentEmployees
UNION ALL
SELECT
    EmployeeID,
    EmployeeName,
    'Former Employee'
FROM FormerEmployees;

-- ==========================================================
-- 135. Combine online and store orders with a source column
-- ==========================================================

SELECT
    OrderID,
    CustomerID,
    Amount,
    'Online Order' AS Source
FROM OnlineOrders
UNION ALL
SELECT
    OrderID,
    CustomerID,
    Amount,
    'Store Order'
FROM StoreOrders;

-- ==========================================================
-- EXCEPT
-- ==========================================================

-- ==========================================================
-- 136. Find customers who ordered online but never ordered
-- in-store
-- ==========================================================

SELECT
    CustomerID
FROM OnlineOrders
EXCEPT
SELECT
    CustomerID
FROM StoreOrders;

-- ==========================================================
-- 137. Find customers who ordered in-store but never ordered
-- online
-- ==========================================================

SELECT
    CustomerID
FROM StoreOrders
EXCEPT
SELECT
    CustomerID
FROM OnlineOrders;

-- ==========================================================
-- 138. Find employee names existing only in current employees
-- ==========================================================

SELECT
    EmployeeName
FROM CurrentEmployees
EXCEPT
SELECT
    EmployeeName
FROM FormerEmployees;

-- ==========================================================
-- 139. Find departments unique to former employees
-- ==========================================================

SELECT
    Department
FROM FormerEmployees
EXCEPT
SELECT
    Department
FROM CurrentEmployees;

-- ==========================================================
-- 140. Find customer cities unique to domestic customers
-- ==========================================================

SELECT
    City
FROM DomesticCustomers
EXCEPT
SELECT
    City
FROM InternationalCustomers;

-- ==========================================================
-- INTERSECT
-- ==========================================================

-- ==========================================================
-- 141. Find customers who ordered both online and in-store
-- ==========================================================

SELECT
    CustomerID
FROM OnlineOrders
INTERSECT
SELECT
    CustomerID
FROM StoreOrders;

-- ==========================================================
-- 142. Find employees existing in both tables
-- ==========================================================

SELECT
    EmployeeID,
    EmployeeName
FROM CurrentEmployees
INTERSECT
SELECT
    EmployeeID,
    EmployeeName
FROM FormerEmployees;

-- ==========================================================
-- 143. Find departments appearing in both employee tables
-- ==========================================================

SELECT
    Department
FROM CurrentEmployees
INTERSECT
SELECT
    Department
FROM FormerEmployees;

-- ==========================================================
-- 144. Find customer names appearing in both customer tables
-- ==========================================================

SELECT
    CustomerName
FROM DomesticCustomers
INTERSECT
SELECT
    CustomerName
FROM InternationalCustomers;

-- ==========================================================
-- 145. Find common salaries between current and former employees
-- ==========================================================

SELECT
    Salary
FROM CurrentEmployees
INTERSECT
SELECT
    Salary
FROM FormerEmployees;
