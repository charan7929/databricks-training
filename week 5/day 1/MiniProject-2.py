-- =====================================================
-- ADVANCED MINI PROJECTS
-- =====================================================


-- =====================================================
-- PROJECT 2: HR DASHBOARD
-- =====================================================

-- 1. Count male and female employees.
            emp_df.groupBy('gender').agg(count('emp_id').alias('no_of_emp')).display()

-- 2. Find average age department-wise.
            emp_df.groupBy('department').agg(avg('age').alias('avg_age')).display()

-- 3. Generate hiring trends by year.
            emp_df.groupBy(year('joining_date').alias('joining_year')).agg(count('emp_id').alias('no_of_emp')).display()

-- 4. Create city-wise employee distribution.
            emp_df.groupBy('city').agg(count('emp_id').alias('no_of_emp')).display()

-- 5. Identify highest paid employees.
            max_salary=emp_df.select(max('salary')).collect()[0][0]
            print(max_salary)

            emp_df.filter(col('salary')==max_salary).display()
