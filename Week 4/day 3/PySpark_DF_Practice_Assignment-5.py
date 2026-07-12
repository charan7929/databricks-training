-- =====================================================
-- 21. LIT() QUESTIONS
-- =====================================================

-- 1. Add company_name column.
        emp_df.withColumn('company_name',lit("VIT")).display()

-- 2. Add country column with value India.
        emp_df.withColumn('country',lit("INDIA")).display()

-- 3. Add constant bonus column.
        emp_df.withColumn('bonus',lit(5000)).display()

-- 4. Add status column as Active.
        emp_df.withColumn('status',lit("Active")).display()

-- 5. Add training column with Yes.
        emp_df.withColumn('Training',lit("Yes")).display()


-- =====================================================
-- 22. WHEN() / OTHERWISE() QUESTIONS
-- =====================================================

-- 1. Categorize salary as High and Low.
        emp_df.withColumn('salary_category',when(col("salary")>65000,"High").otherwise("Low")).display()

-- 2. Categorize employees based on age.
        emp_df.withColumn('employee_category',when(col("age")>30,"Old").otherwise("Young")).display()
        
-- 3. Create experience level column.
        emp_df.withColumn('experience',timestamp_diff('Year','joining_date',current_date())).withColumn('experience_status',when(col('experience')>5,"Senior").otherwise("Junior")).display()

-- 4. Mark employees eligible for bonus.
        emp_df.withColumn('experience',timestamp_diff('Year','joining_date',current_date())).withColumn('bonus_eligibility',when(col('experience')>5,"Eligible").otherwise("Not_Eligible")).display()

-- 5. Create department category column.
        emp_df.withColumn('dept_category',when(col('department')=='IT',"Tech").when(col('department')=='Analytics',"Data").when(col('department')=='HR','HR').when(col('department')=='Support','Support').otherwise("QA")).display()


-- =====================================================
-- 23. SUBSTRING() QUESTIONS
-- =====================================================

-- 1. Extract first 3 characters from name.
        emp_df.withColumn('char',substring('name',1,3)).display()

-- 2. Extract year from joining_date.
        emp_df.withColumn('year',substring('joining_date',1,4)).display()

-- 3. Extract first 2 letters of department.
        emp_df.withColumn('dept',substring('department',1,2)).display()

-- 4. Extract last 3 characters from designation.
        emp_df.withColumn('desig',substring('designation',length('designation')-2,3)).display()

-- 5. Create short employee code.
        emp_df.withColumn('shortcut',concat(substring('name',1,4),col('emp_id'))).display()


-- =====================================================
-- 24. REGEXP_REPLACE() QUESTIONS
-- =====================================================

-- 1. Replace spaces in designation with underscore.
        emp_df.withColumn('designation',regexp_replace('designation',' ','_')).display()

-- 2. Remove vowels from names.
        emp_df.withColumn('name',regexp_replace('name','[AEIOUaeiou]','')).display()

-- 3. Replace Hyderabad with HYD.
        emp_df.withColumn('city',regexp_replace('city','Hyderabad','HYD')).display()

-- 4. Remove special characters.
        emp_df.withColumn('name',regexp_replace('name','[^A-Za-z0-9]','')).display()

-- 5. Standardize department names.
        emp_df.withColumn('department',regexp_replace('department','IT','Information Technology')).display()


-- =====================================================
-- 25. LIKE() QUESTIONS
-- =====================================================

-- 1. Find names starting with S.
        emp_df.filter(col('name').like('S%')).display()

-- 2. Find designations ending with Engineer.
        emp_df.filter(col('designation').like('%Engineer')).display()

-- 3. Find cities containing 'a'.
        emp_df.filter(col('city').like('%a%')).display()

-- 4. Find departments starting with A.
        emp_df.filter(col('department').like('A%')).display()

-- 5. Find employees whose name contains 'ra'.
        emp_df.filter(col('name').like('%ra%')).display()
