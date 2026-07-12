-- =====================================================
-- ADVANCED MINI PROJECTS
-- =====================================================


-- =====================================================
-- PROJECT 3: DATA ENGINEERING SCENARIOS
-- =====================================================

-- 1. Remove duplicate records.
            emp_df.dropDuplicates().display()

-- 2. Handle missing data.
            emp_df.fillna({'salary':0}).display()

-- 3. Join multiple datasets.
            emp_df.join(dept_df,"department","left")\
            .join(city_df,"city","left").display()

-- 4. Optimize partitions.
            emp_df.repartition(5).display()

-- 5. Create aggregated summary tables.
            emp_df.groupBy('department').agg(sum('salary').alias('total_salary'),max('age').alias('max_age')).display()
            
