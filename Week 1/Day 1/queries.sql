-- Tables creation for queires execution
-- Create Department table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create Employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    salary DECIMAL(10, 2),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Create Project table
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Insert data into Department table
INSERT INTO Department (department_id, name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

-- Insert data into Employee table
INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
(1, 'John Doe', 28, 50000.00, 1, '2020-01-15'),
(2, 'Jane Smith', 34, 60000.00, 2, '2019-07-23'),
(3, 'Bob Brown', 45, 80000.00, 1, '2018-02-12'),
(4, 'Alice Blue', 25, 45000.00, 3, '2021-03-22'),
(5, 'Charlie P.', 29, 50000.00, 2, '2019-12-01'),
(6, 'David Green', 38, 70000.00, 4, '2022-05-18'),
(7, 'Eve Black', 40, 55000.00, 3, '2021-08-30');

-- Insert data into Project table
INSERT INTO Project (project_id, name, department_id) VALUES
(1, 'Project Alpha', 1),
(2, 'Project Beta', 2),
(3, 'Project Gamma', 1),
(4, 'Project Delta', 3),
(5, 'Project Epsilon', 4),
(6, 'Project Zeta', 4),
(7, 'Project Eta', 3);


-- Insert additional data into Department table (if needed)
-- No additional departments needed for this data set

-- Insert additional data into Employee table to test edge cases for joins and nested queries
INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
(8, 'Frank White', 32, 48000.00, NULL, '2021-07-10'),  -- Employee without a department
(9, 'Grace Kelly', 27, 65000.00, 1, '2018-11-13'),
(10, 'Hannah Lee', 30, 53000.00, 4, '2020-02-25');

-- Insert additional data into Project table to test edge cases for joins


INSERT INTO Project (project_id, name, department_id) VALUES
(8, 'Project Theta', 1),
(9, 'Project Iota', NULL);  -- Project without a department



--Solutions for the sql queries
01.select * from employee;
02.select name,salary from Employee;
03.select * from Employee where age>30;
04.select name from Department
05.select * from Employee where department_id =(select department_id from Department where name = 'IT');
06.select * from Employee where name like 'j%';
07.select * from Employee where name like '%e';
08.select * from Employee where name like '%a%';
09.select * from Employee where length(name)=9;
10.select * from Employee where name like '_o%';
11.select * from Employee where YEAR(hire_date) = 2020;
12.select * from Employee where month(hire_date) = 1;
13.select * from Employee where hire_date < '2019-01-01;
14.select * from Employee where hire_date >='2021-03-01';
15.select * from Employee where hire_date >= CURRENT_DATE - INTERVAL 2 YEAR;
16.select sum(salary) from Employee;
17.select avg(salary) from Employee;
18.select min(salary) from Employee;
19.select department_id,count(*) from Employee GROUP BY department_id;
20.select department_id,avg(salary) from Employee GROUP BY department_id;
21.select department_id,sum(salary) from Employee GROUP BY department_id;
22.select deparment_id,avg(age) from Employee GROUP BY department_id;
23.select YEAR(hire_date),count(*) from Employee GROUP BY YEAR(hire_date);
24.select department_id,max(salary) from Employee GROUP BY YEAR(hire_date);
25.select department_id from Employee GROUP BY department_id ORDER BY avg(salary) DESC limit 1;
26.select department_id from Employee GROUP BY department_id having count(*)>2;
27.select department_id from Employee GROUP BY department_id having avg(salary)>55000;
28.select YEAR(hire_date) from Employee GROUP BY YEAR(hire_date) having count(*)>1;
29.select department_id from Employee GROUP BY department_id having sum(salary)<100000;
30.select department_id from Employee GROUP BY department_id having max(salary)>75000;
