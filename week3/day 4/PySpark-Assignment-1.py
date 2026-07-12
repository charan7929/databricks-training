## SELECT

-- 1. Select only emp_name and salary.
        from pyspark.sql.functions import *
        df.select(col("emp_name"),col("salary")).display()

-- 2. Select emp_id, emp_name, and department.
        from pyspark.sql.functions import *
        df.select(col("emp_id"),col("emp_name"),col("department")).display()

-- 3. Select city, designation, and salary.
        from pyspark.sql.functions import *
        df.select(col("city"),col("designation"),col("salary")).display()

-- 4. Select all employees from only IT department with selected columns.
        df.filter(col("department")=='IT').select(col("emp_id"),col("emp_name"),col("department")).display()

-- 5. Select emp_name, joining_date, and salary.
        from pyspark.sql.functions import *
        df.select(col("emp_name"),col("joining_date"),col("salary")).display()

-- 6. Select first 5 columns from dataframe.
        from pyspark.sql.functions import *
        df.select(df.columns[:5]).display()

-- 7. Select employees whose salary column only.
        from pyspark.sql.functions import *
        df.select(col("salary")).display()

-- 8. Select emp_name and city for employees from Hyderabad.
        from pyspark.sql.functions import *
        df.filter(col("city")=='Hyderabad').select(col("emp_name"),col("city")).display()

-- 9. Select designation and department.
        from pyspark.sql.functions import *
        df.select(col("designation"),col("department")).display()

-- 10. Select all columns except joining_date.
        from pyspark.sql.functions import *
        df.select([col for col in df.columns if col!='joining_date']).display()


## ALIAS

-- 11. Display emp_name as employee_name.
        from pyspark.sql.functions import *
        df.select(col("emp_name").alias("employee_name")).display()

-- 12. Display salary as monthly_salary.
        from pyspark.sql.functions import *
        df.select(col("salary").alias("monthly_salary")).display()

-- 13. Display department as dept.
        from pyspark.sql.functions import *
        df.select(col("department").alias("dept")).display()

-- 14. Display joining_date as doj.
        from pyspark.sql.functions import *
        df.select(col("joining_date").alias("doj")).display()

-- 15. Select emp_name as name and city as location.
        from pyspark.sql.functions import *
        df.select(col("emp_name").alias("name"),col("city").alias("location")).display()

-- 16. Display designation as job_role.
        from pyspark.sql.functions import *
        df.select(col("designation").alias("job_role")).display()

-- 17. Display age as employee_age.
        from pyspark.sql.functions import *
        df.select(col("age").alias("employee_age")).display()

-- 18. Select multiple columns using aliases.
        from pyspark.sql.functions import *
        df.select(col("emp_name").alias("employee_name"),col("salary").alias("monthly_salary"),col("age").alias("employee_age")).display()

-- 19. Display salary as emp_salary and department as emp_dept.
        from pyspark.sql.functions import *
        df.select(col("salary").alias("emp_salary"),col("department").alias("emp_dept")).display()

-- 20. Display city as work_location.
        from pyspark.sql.functions import *
        df.select(col("city").alias("work_location")).display()


## FILTER / WHERE

-- 21. Filter employees whose salary is greater than 70000.
        from pyspark.sql.functions import *
        df.filter(col("salary")>70000).display()

-- 22. Filter employees from Hyderabad.
        from pyspark.sql.functions import *
        df.filter(col("city")=='Hyderabad').display()

-- 23. Filter employees whose age is less than 25.
        from pyspark.sql.functions import *
        df.filter(col("age")<25).display()

-- 24. Filter employees from IT department.
        from pyspark.sql.functions import *
        df.filter(col("department")=='IT').display()

-- 25. Filter employees whose designation is Developer.
        from pyspark.sql.functions import *
        df.filter(col("designation")=='Developer').display()

-- 26. Filter employees whose salary is between 50000 and 80000.
        from pyspark.sql.functions import *
        df.filter(col("salary").between(50000,80000)).display()

-- 27. Filter employees whose city is Bangalore.
        from pyspark.sql.functions import *
        df.filter(col("city")=='Bangalore').display()

-- 28. Filter employees who joined after 2022-01-01.
        from pyspark.sql.functions import *
        df.filter(col("joining_date")>'2022-01-01').display()

-- 29. Filter employees whose age is greater than 30.
        from pyspark.sql.functions import *
        df.filter(col("age")>30).display()

-- 30. Filter employees whose salary is less than 50000.
        from pyspark.sql.functions import *
        df.filter(col("salary")<50000).display()

-- 31. Filter employees from Chennai and salary greater than 60000.
        from pyspark.sql.functions import *
        df.filter((col("city")=='Chennai') & (col("salary")>60000)).display()

-- 32. Filter employees from Mumbai or Pune.
        from pyspark.sql.functions import *
        df.filter((col("city")=='Mumbai') | (col("city")=='Pune')).display()

-- 33. Filter employees whose name starts with 'S'.
        from pyspark.sql.functions import *
        df.filter(col("emp_name").like('S%')).display()

        from pyspark.sql.functions import *
        df.filter(col("emp_name").startswith('S')).display()

-- 34. Filter employees whose name ends with 'a'.
        from pyspark.sql.functions import *
        df.filter(col("emp_name").like('%a')).display()

        from pyspark.sql.functions import *
        df.filter(col("emp_name").endswith('a')).display()

-- 35. Filter employees whose department is HR.
        from pyspark.sql.functions import *
        df.filter(col("department")=='HR').display()

-- 36. Filter employees whose designation contains 'Engineer'.
        from pyspark.sql.functions import *
        df.filter(col("designation").contains("Engineer")).display()

-- 37. Filter employees whose city is not Hyderabad.
        from pyspark.sql.functions import *
        df.filter(col("city")!='Hyderabad').display()

-- 38. Filter employees aged between 25 and 30.
        from pyspark.sql.functions import *
        df.filter(col("age").between(25,30)).display()

-- 39. Filter employees with salary greater than 90000.
        from pyspark.sql.functions import *
        df.filter(col("salary")>90000).display()

-- 40. Filter employees from Support department.
        from pyspark.sql.functions import *
        df.filter(col("department")=='Support').display()
