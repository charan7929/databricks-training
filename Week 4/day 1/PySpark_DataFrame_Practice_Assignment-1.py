-- =====================================================
-- 1. SELECT() TRANSFORMATION QUESTIONS
-- =====================================================

-- 1. Select only employee name and salary columns.
        emp_df.select(col("name"),col("salary")).display()

-- 2. Select emp_id, department and city columns.
        emp_df.select(col("emp_id"),col("department"),col("city")).display()

-- 3. Select all employees with only name and age.
        emp_df.select(col("name"),col("age")).display()

-- 4. Select designation and salary columns.
        emp_df.select(col("designation"),col("salary")).display()

-- 5. Select emp_id, name and joining_date columns.
        emp_df.select(col("emp_id"),col("name"),col("joining_date")).display()


-- =====================================================
-- 2. FILTER() / WHERE() TRANSFORMATION QUESTIONS
-- =====================================================

-- 1. Find employees whose salary is greater than 70000.
        emp_df.filter(col("salary")>70000).display()

-- 2. Find employees working in IT department.
        emp_df.filter(col("department")=='IT').display()

-- 3. Find employees whose age is less than 30.
        emp_df.filter(col("age")<30).display()

-- 4. Find female employees.
        emp_df.filter(col("gender")=='Female').display()

-- 5. Find employees from Hyderabad city.
        emp_df.filter(col("city")=='Hyderabad').display()


-- =====================================================
-- 3. WITHCOLUMN() TRANSFORMATION QUESTIONS
-- =====================================================

-- 1. Add a new column bonus with 10% of salary.
        emp_df.withColumn('bonus',col("salary")*0.1).display()

-- 2. Add a new column tax with 5% deduction.
        emp_df.withColumn('tax',col("salary")*0.05).display()

-- 3. Add a new column salary_increment with salary + 5000.
        emp_df.withColumn('salary_increment',col("salary")+5000).display()

-- 4. Create a new column age_group based on age.
        emp_df.withColumn('age_group',
                when(col('age')<18,"Child")
                .when(col("age")<30,"Adult") 
                .otherwise("Senior")
        ).display()

-- 5. Add a column yearly_salary = salary * 12.
        emp_df.withColumn('yearly_salary',col("salary")*12).display()


-- =====================================================
-- 4. WITHCOLUMNRENAMED() QUESTIONS
-- =====================================================

-- 1. Rename emp_id to employee_id.
        emp_df.withColumnRenamed("emp_id","employee_id").display()

-- 2. Rename designation to role.
        emp_df.withColumnRenamed("designation","role").display()

-- 3. Rename salary to monthly_salary.
        emp_df.withColumnRenamed("salary","monthly_salary").display()

-- 4. Rename city to work_location.
        emp_df.withColumnRenamed("city","work_location").display()

-- 5. Rename joining_date to doj.
        emp_df.withColumnRenamed("joining_date","doj").display()


-- =====================================================
-- 5. DROP() TRANSFORMATION QUESTIONS
-- =====================================================

-- 1. Drop age column.
        emp_df.drop("age").display()

-- 2. Drop gender column.
        emp_df.drop("gender").display()

-- 3. Drop joining_date column.
        emp_df.drop("joining_date").display()

-- 4. Drop city and age columns.
        emp_df.drop("city",'age').display()

-- 5. Drop designation column.
        emp_df.drop("designation").display()
