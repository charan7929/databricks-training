-- =====================================================
-- ADVANCED MINI PROJECTS
-- =====================================================


-- =====================================================
-- PROJECT 1: EMPLOYEE SALARY ANALYTICS
-- =====================================================

-- 1. Find top 3 highest salaries department-wise.
            from pyspark.sql.window import Window

            ranked_df=emp_df.withColumn('dense_rank',dense_rank().over(Window.partitionBy('department').orderBy(col('salary').desc())))
            ranked_df.display()

            ranked_df.filter(col('dense_rank')<=3).display()


-- 2. Find average salary city-wise.
            emp_df.groupBy('city').agg(avg('salary').alias('avg_salary')).display()


-- 3. Categorize employees into salary bands.
            emp_df.withColumn('salary_category',when(col('salary')<50000,'Low').when(col('salary')<80000,'Medium').otherwise('High')).display()

-- 4. Generate yearly salary report.
            emp_df.groupBy(year('joining_date').alias('joining_year')).agg(sum('salary').alias('total_salary')).display()

-- 5. Find employees earning above department average.
            dept_df=emp_df.withColumn('dept_avg',avg('salary').over(Window.partitionBy('department')))
            dept_df.display()

            dept_df.filter(col('salary')>col('dept_avg')).display()
