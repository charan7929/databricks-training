-- =====================================================
-- 6. DISTINCT() QUESTIONS
-- =====================================================

-- 1. Find distinct departments.
        emp_df.select("department").distinct().display()

-- 2. Find distinct cities.
        emp_df.select("city").distinct().display()

-- 3. Find distinct designations.
        emp_df.select("designation").distinct().display()

-- 4. Find distinct genders.
        emp_df.select("gender").distinct().display()

-- 5. Find unique department and city combinations.
        emp_df.select("department","city").distinct().display()


-- =====================================================
-- 7. DROPDUPLICATES() QUESTIONS
-- =====================================================

-- 1. Remove duplicate rows based on emp_id.
        emp_df.dropDuplicates(["emp_id"]).display()

-- 2. Remove duplicates based on department.
        emp_df.dropDuplicates(["department"]).display()

-- 3. Remove duplicates based on city.
        emp_df.dropDuplicates(["city"]).display()

-- 4. Remove duplicates based on department and city.
        emp_df.dropDuplicates(["department","city"]).display()

-- 5. Remove duplicate employees based on name.
        emp_df.dropDuplicates(["name"]).display()


-- =====================================================
-- 8. SORT() / ORDERBY() QUESTIONS
-- =====================================================

-- 1. Sort employees by salary ascending.
        emp_df.orderBy(col("salary").asc()).display()

-- 2. Sort employees by age descending.
        emp_df.orderBy(col("age").desc()).display()

-- 3. Sort employees by department and salary.
        emp_df.orderBy(col("department"),col("salary")).display()

-- 4. Sort employees by city.
        emp_df.orderBy(col("city")).display()

-- 5. Sort employees by joining_date descending.
        emp_df.orderBy(col("joining_date").desc()).display()


-- =====================================================
-- 9. GROUPBY() QUESTIONS
-- =====================================================

-- 1. Find average salary by department.
        emp_df.groupBy("department").agg(avg("salary").alias("avg_salary")).display()

-- 2. Find maximum salary in each department.
        emp_df.groupBy("department").agg(max("salary").alias("max_salary")).display()

-- 3. Find minimum age in each department.
        emp_df.groupBy("department").agg(min("age").alias("min_age")).display()

-- 4. Count employees in each city.
        emp_df.groupBy("city").agg(count("emp_id").alias("no_of_employess")).display()

-- 5. Find total salary by gender.
        emp_df.groupBy("gender").agg(sum("salary").alias("total_salary")).display()


-- =====================================================
-- 10. AGG() QUESTIONS
-- =====================================================

-- 1. Find total salary of all employees.
        emp_df.agg(sum("salary").alias("total_salary")).display()

-- 2. Find average employee age.
        emp_df.agg(avg("age").alias("avg_age")).display()

-- 3. Find max and min salary together.
        emp_df.agg(max("salary").alias("max_salary"),min("salary").alias("min_salary")).display()

-- 4. Find count of employees.
        emp_df.agg(count("emp_id").alias("employees_count")).display()

-- 5. Find average salary and average age department-wise.
        emp_df.groupBy("department").agg(avg("salary").alias("avg_salary"),avg("age").alias("avg_age")).display()
