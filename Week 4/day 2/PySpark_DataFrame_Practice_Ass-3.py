-- =====================================================
-- 11. JOIN() QUESTIONS
-- =====================================================

department_data = [
    ("IT", "John"),
    ("HR", "Smith"),
    ("QA", "David"),
    ("Analytics", "Kevin"),
    ("Support", "Robert")
]

dept_columns = ["department", "manager"]

dept_df = spark.createDataFrame(department_data, dept_columns)

-- 1. Perform inner join between emp_df and dept_df.
        emp_df.join(dept_df,"department","inner").display()

-- 2. Perform left join.
        emp_df.join(dept_df,"department","left").display()

-- 3. Perform right join.
        emp_df.join(dept_df,"department","right").display()

-- 4. Perform full outer join.
        emp_df.join(dept_df,"department","outer").display()

-- 5. Find employees along with manager names.
        emp_df.join(dept_df,"department","left").display()


-- =====================================================
-- 12. UNION() QUESTIONS
-- =====================================================

new_emp_data = [
    (111, "Teja", "Developer", "IT", 72000, "Hyderabad", 26, "2023-01-10", "Male"),
    (112, "Divya", "Analyst", "Analytics", 65000, "Bangalore", 25, "2022-11-05", "Female")
]

new_emp_df = spark.createDataFrame(new_emp_data, columns)

-- 1. Union emp_df with new_emp_df.
        emp_df.union(new_emp_df).display()

-- 2. Count total rows after union.
        emp_df.union(new_emp_df).agg(count("emp_id").alias("employees_count")).display()

-- 3. Remove duplicates after union.
        emp_df.union(new_emp_df).dropDuplicates().display()

-- 4. Find all IT employees after union.
        emp_df.union(new_emp_df).filter(col("department")=='IT').display()

-- 5. Sort unioned dataframe by salary.
        emp_df.union(new_emp_df).orderBy(col("salary").desc()).display()


-- =====================================================
-- 13. UNIONBYNAME() QUESTIONS
-- =====================================================

-- 1. Create another dataframe with shuffled columns and perform unionByName.
        shuffled_df=new_emp_df.select("name","emp_id","department","salary","designation","age","city","gender","joining_date")
        shuffled_df.display()

        emp_df.unionByName(shuffled_df).display()

-- 2. Use allowMissingColumns=True.
        emp_df.unionByName(shuffled_df,allowMissingColumns=True).display()

-- 3. Add extra column and perform unionByName.
        shuffled_df = new_emp_df.select(
            "name",
            "emp_id",
            "department",
            "designation",
            "salary",
            "city",
            "age",
            "joining_date",
            "gender",
            current_date().alias("CurrentDate")
        )  

        emp_df.unionByName(shuffled_df,allowMissingColumns=True).display()


-- 4. Compare union vs unionByName.
        UNION -> It gives Error because the number of columns are not same even if the number of columns are same it gives wrong data because it combines the data column wise without checking names of the columns so we get wrong data if the columns are shuffled.
        UNIONBYNAME -> It gives the correct output even when the columns are shuffled and also when the columns are not equal.

-- 5. Merge employee datasets with different schemas.
        emp_df.unionByName(shuffled_df,allowMissingColumns=True).display()


-- =====================================================
-- 14. LIMIT() QUESTIONS
-- =====================================================

-- 1. Show first 3 records.
        emp_df.limit(3).display()

-- 2. Show first 5 employees.
        emp_df.limit(5).display()

-- 3. Get top 2 highest salary employees.
        emp_df.sort(col("salary").desc()).limit(2).display()

-- 4. Get first 4 IT employees.
        emp_df.filter(col("department")=='IT').limit(4).display()

-- 5. Show first employee record.
        emp_df.limit(1).display()


-- =====================================================
-- 15. SAMPLE() QUESTIONS
-- =====================================================

-- 1. Take 50% sample of data.
        emp_df.sample(False,0.5).display()

-- 2. Take 30% sample with seed.
        emp_df.sample(False,0.3,42).display()

-- 3. Take sample from IT employees.
        emp_df.filter(col("department")=='IT').sample(False,0.3).display()

-- 4. Compare full data vs sampled data.
        The number of rows differ in both the data

-- 5. Take random sample of 5 rows.
        emp_df.sort(rand()).limit(5).display()
        
