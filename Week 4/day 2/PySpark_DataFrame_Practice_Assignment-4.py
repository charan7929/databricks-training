-- =====================================================
-- 16. EXPLODE() QUESTIONS
-- =====================================================

skills_data = [
    (101, ["Python", "Spark", "Azure"]),
    (102, ["Java", "SQL"]),
    (103, ["Power BI", "SQL"])
]

skills_columns = ["emp_id", "skills"]

skills_df = spark.createDataFrame(skills_data, skills_columns)

-- 1. Explode skills array into multiple rows.
        skills_df.withColumn('skills',explode('skills')).display()

-- 2. Count total skills.
        skills_df.withColumn('skills',explode('skills')).agg(count('skills').alias('skills_count')).display()

-- 3. Find employees with Python skill.
        skills_df.withColumn('skills',explode('skills')).filter(col('skills')=='Python').display()

-- 4. Find distinct skills.
        skills_df.withColumn('skills',explode('skills')).select("skills").distinct().display()

-- 5. Group employees by skill.
        skills_df.withColumn('skills',explode('skills')).groupBy('skills').agg(collect_list('emp_id')).display()



-- =====================================================
-- 17. SPLIT() QUESTIONS
-- =====================================================

-- 1. Split joining_date into year, month and day.
        emp_df.select('*',split('joining_date','-')[0].alias('year'),split('joining_date','-')[1].alias('month'),split('joining_date','-')[2].alias('day')).display()

-- 2. Split designation into words.
        emp_df.select('*',split('designation',' ').alias('designation-words')).display()

-- 3. Split city names.
        emp_df.select('*',split('city',' ').alias('city-words')).display()

-- 4. Extract year from joining_date.
        emp_df.select('*',year('joining_date').alias('year')).display()

-- 5. Create separate columns using split.
        emp_df.select('*',split('joining_date','-')[0].alias('year'),split('joining_date','-')[1].alias('month'),split('joining_date','-')[2].alias('day')).display()


-- =====================================================
-- 18. CONCAT() / CONCAT_WS() QUESTIONS
-- =====================================================

-- 1. Concatenate name and department.
        emp_df.withColumn('concat',concat("name","department")).display()

-- 2. Create full employee details column.
        emp_df.withColumn('full_employee_details',concat("name","department")).display()

-- 3. Concatenate city and department with hyphen.
        emp_df.withColumn('full_employee_details',concat_ws("-","city","department")).display()

-- 4. Create employee label using concat_ws.
        emp_df.withColumn('employee_label',concat_ws("-","name","city","department")).display()

-- 5. Combine name and designation.
        emp_df.withColumn('employee_label',concat_ws("-","name","designation")).display()


-- =====================================================
-- 19. CAST() QUESTIONS
-- =====================================================

-- 1. Cast salary to double.
        emp_df.withColumn('salary',col('salary').cast(DoubleType())).display()

-- 2. Cast age to string.
        emp_df.withColumn('age',col('age').cast(StringType())).display()

-- 3. Convert joining_date to date type.
        emp_df.withColumn('joining_date',col('joining_date').cast(DateType())).display()

-- 4. Cast emp_id to string.
        emp_df.withColumn('emp_id',col('emp_id').cast(StringType())).display()

-- 5. Create numeric bonus column.
        emp_df.withColumn('bonus',(col('salary')*0.5).cast(IntegerType())).display()


-- =====================================================
-- 20. ALIAS() QUESTIONS
-- =====================================================

-- 1. Display salary as monthly_salary.
        emp_df.select(col('salary').alias('monthly_salary')).display()

-- 2. Display department as dept_name.
        emp_df.select(col('department').alias('dept_name')).display()
        
-- 3. Use alias in aggregation.
        emp_df.groupBy("department") \
      .agg(avg("salary").alias("avg_salary")) \
      .display()
      
-- 4. Rename average salary column using alias.
        emp_df.groupBy("department").agg(avg("salary").alias("avg_salary")).display()

-- 5. Use alias in joins.
        emp_df.alias("e") \
      .join(dept_df.alias("d"),
            col("e.department") == col("d.department"),
            "inner") \
      .select(
          col("e.emp_name"),
          col("e.department"),
          col("d.manager")
      ) \
      .display()
