-- solutions for the remaining queries
31.select * from Employee order by salary ASC;
32.select * from Employee order by salary DESC;
33.select * from Employee order by hire_date ASC;
34.select * from Employee order by department_id,salary;
35.select department_id,sum(salary) AS total_salary from Employee group by department_id order by total_salary;
36.select e.name,d.name from Employee e JOIN Department d on e.department_id = d.department_id;
37.select p.name,d.name from Project p JOIN Department d on p.department_id = d.department_id;
38.select e.name,p.name from Employee e JOIN Project p on e.project_id = p.project_id;
39.select e.name,d.name from Employee e LEFT JOIN Department d on e.department_id = d.department_id;
40.select d.name,e.name from Department d LEFT JOIN Employee e on d.department_id = e.department_id;
41.select * from Employee where project_id IS NULL;
42.select e.name,count(project_id) from Employee e JOIN Department d on e.department_id = d.department_id LEFT JOIN Project p on d.department_id = p.department_id GROUP BY e.name;
43.select d.* from Department d LEFT JOIN Employee e on d.department_id = e.department_id where e.emp_id IS NULL;
44.select e2.name from Employee e1 JOIN Employee e2 on e1.department_id = e2.department_id where e1.name = 'John Doe';
45.select d.name from Department d JOIN Employee e on d.department_id = e.department_id GROUP BY d.name ORDER BY d.name ORDER BY avg(e.salary) DESC limit 1;
46.select * from Employee where salary = (select max(salary) from Employee);
47.select * from Employee where salary > (select avg(salary) from Employee);
48.select max(salary) as second_highest_salary from Employee where salary < (select max(salary) from Employee);
49.select d.name,count(e.emp_id) AS total_employees from Department d JOIN Employee e on d.depatment_id = e.department_id GROUP BY d.name ORDER BY total_employees DESC limit 1;
50.select e.name,e.salary from Employee e where e.salary >(select avg(salary) from Employee where department_id = e.department_id);
51.select DISTINCT salary from Employee e1 where 2 = (select count(DISTINCT salary) from Employee e2 where e2.salary > e1..salary);
52.select * from Employee where age>ALL(select age from Employee where department_id = (select department_id from Department where name = 'HR'));
53.select d.name,avg(e.salary) AS avg_salary from Department d JOIN Employee e on d.department_id = e.department_id GROUP BY d.name having avg_salary  >55000;
54.select * from Employee where department_id from Project GROUP BY department_id having COUNT(project_id)>=2;
55.select * from Employee where hire_date =(select hire_date from Employee where name = 'Jane Smith');
56.select sum(salary) AS total_salary from Employee where YEAR(hire_date) =2020;
57.select d.name,avg(e.salary) AS avg_salary from Department d JOIN Employee e on d.department_id = e.department_id GROUP BY d.name ORDER BY avg_salary DESC;
58.select d.name from Department d JOIN Employee e on d.department_id = e.department_id GROUP BY d.name having COUNT(e.emp_id)>1 AND avg(e.salary) >55000;
59.select * from Employee where hire_date > CURRENT_DATE - INTERVAL 2 YEAR ORDER BY hire_date;
60.select department_id,count(*) AS total_employees,avg(salary) AS avg_salary from Employee GROUP BY department_id having count(*) > 2;
61.select e.name,e.salary from Employee e where e.salary > (select avg(salary) from Employee where department_id = e.department_id);
62.select name from Employee where hire_date = (select min(hire_date) from Employee);
63.select d.name,count(p.project_id) AS total_projects from Department d LEFT JOIN project p on d.department_id = p.department_id GROUP BY d.name ORDER BY total_projects DESC;
64.select e.name,e.department_id,e.salary from Employee where e.salary = (select MAX(salary) from Employee where department_id = e.department_id);
65.select e.name,e.salary from Employee e where e.age >(select avg(age) from Employee where department_id = e.department_id);



-- there are some more queries that help building skill

-- this file helps to build tables
-- SQL Joins Assignment Starter File
-- Compatible with PostgreSQL

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS instructors;

CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor_id INT NULL,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert instructors
INSERT INTO instructors VALUES
(1, 'Sarah Connor', 'Databases'),
(2, 'Michael Scott', 'Programming'),
(3, 'Tony Stark', 'Cloud Computing'),
(4, 'Bruce Wayne', 'Cyber Security');

-- Insert students
INSERT INTO students VALUES
(1, 'Alice Johnson', 'alice@email.com'),
(2, 'Bob Smith', 'bob@email.com'),
(3, 'Charlie Brown', 'charlie@email.com'),
(4, 'Diana Prince', 'diana@email.com'),
(5, 'Ethan Hunt', 'ethan@email.com'),
(6, 'Fiona Green', 'fiona@email.com');

-- Insert courses
INSERT INTO courses VALUES
(101, 'SQL Basics', 1),
(102, 'Python Fundamentals', 2),
(103, 'Data Analytics', NULL),
(104, 'Cloud Computing', 3),
(105, 'Machine Learning', NULL),
(106, 'Cyber Security', 4);

-- Insert enrollments
INSERT INTO enrollments VALUES
(1, 1, 101, '2024-01-10'),
(2, 1, 102, '2024-01-12'),
(3, 2, 101, '2024-01-15'),
(4, 3, 104, '2024-01-20'),
(5, 4, 106, '2024-01-25');

-- Notes:
-- Student 5 and 6 are not enrolled in any course.
-- Courses 103 and 105 have no instructor assigned.
-- Courses 103 and 105 also have no enrollments.
-- Instructor 4 teaches one course.
-- these are the queries to practice
Display all students and the courses they are enrolled in. Include students who are not enrolled in any course.
2. Find all courses that currently have no students enrolled.
3. Display all instructors and the courses they teach, including instructors who are not assigned to any course.
4. Find all courses that do not have an instructor assigned.
5. Display all students and enrollment information using a RIGHT JOIN.
6. Find students who are not enrolled in any course.
7. Use a FULL OUTER JOIN to display all students and enrollments, including unmatched rows from both tables.
8. Find all courses that have never appeared in the enrollments table.
9. Display all instructors and courses using a FULL OUTER JOIN and identify unmatched rows.
10. Create a report showing: student name, course name, and instructor name. Include rows even if course or instructor information is missing.

  --below these are the solution for the queries.
1.select s.student_name,c.course_name from students s LEFT JOIN enrollments e on s.student_id = e.student_id LEFT JOIN courses c on e.course_id = c.course_id;
2.select c.course_id,c.course_name from courses c LEFT JOIN enrollments e on c.course_id = e.course_id where e.enrollment_id IS NULL;
3.select i.instructor_name,c.course_name from instructors i LEFT JOIN courses c on i.instructor_id = c.instructor_id;
4.selwct course_id,course_name from courses where instuctor_id IS NULL;
5.select s.student_name,e.enrollment_id,e.course_id,e.enrollment_date from students s RIGHT JOIN enrollments e on s.student_id = e.student_id;
6.select s.student_id,s.student_name from students s LEFT JOIN enrollments e on s.student_id = e.student_id where e.enrollment_id IS NULL;
7.select s.student_name, e.enrollment_id,e.course_id,e.enrollment_date from students s FULL OUTER JOIN enrollments e on s.student_id = e.studnet_id;
8.select c.course_id,c.course_name from courses c LEFT JOIN enrollments e on c.course_id = e.course_id where e.course_id IS NULL;
9.select i.instructor_name,c.course_name from instructors i FULL OUTER JOIN courses c on i.instructor_id = c.instructor_id;
10.select s.student_name,c.course_name,i.instructor_name from students s LEFT OUTER JOIN enrollments e on s.student_id = e.student_id LEFT JOIN courses c on e.course_id = c.course_id LEFT JOIN instructors i on c.instructor_id = i.instructor_id;
