## WITHCOLUMNRENAMED

-- 41. Rename emp_name to employee_name.
        df.withColumnRenamed("emp_name","employee_name").display()

-- 42. Rename department to dept.
        df.withColumnRenamed("department","dept").display()

-- 43. Rename joining_date to doj.
        df.withColumnRenamed("joining_date","doj").display()

-- 44. Rename salary to monthly_salary.
        df.withColumnRenamed("salary","monthly_salary").display()

-- 45. Rename designation to job_role.
        df.withColumnRenamed("designation","job_role").display()

-- 46. Rename city to work_location.
        df.withColumnRenamed("city","work_location").display()

-- 47. Rename age to employee_age.
        df.withColumnRenamed("age","employee_age").display()
        
-- 48. Rename multiple columns one by one.
        df.withColumnRenamed("emp_name","employee_name")\
        .withColumnRenamed("department","dept")\
        .withColumnRenamed("joining_date","doj")\
        .withColumnRenamed("salary","monthly_salary")\
        .withColumnRenamed("designation","job_role")\
        .withColumnRenamed("age","employee_age")\
        .display()

-- 49. Rename emp_id to employee_id.
        df.withColumnRenamed("emp_id","employee_id").display()

-- 50. Rename department to business_unit.
        df.withColumnRenamed("department","business_unit").display()


## WITHCOLUMN

-- 51. Create bonus column as 10% of salary.
        df.withColumn("bonus",col("salary")*0.1).display()

-- 52. Create annual_salary column.
        df.withColumn("annual_salary",col("salary")*12).display()

-- 53. Create tax column as 5% of salary.
        df.withColumn("tax",col("salary")*0.05).display()

-- 54. Create updated_salary by adding 5000.
        df.withColumn("updated_salary",col("salary")+5000).display()

-- 55. Create salary_category column:
        High
        Medium
        Low

        df.withColumn("salary_category",when(col("salary")>80000,"High").when(col("salary")>50000,"Medium").otherwise("Low")).display()

-- 56. Create age_group column:
        Young
        Adult

        df.withColumn("age_group",when(col("age")<30,"Young").otherwise("Adult")).display()

-- 57. Create location column by combining city and department.
        df.withColumn("location",concat_ws("-",col("city"),col("department"))).display()

-- 58. Create increment_salary column with 15% hike.
        df.withColumn("increment_salary",col("salary")*1.15).display()

-- 59. Create experience_status column based on joining year.
        df.withColumn("experience_status",when(col("joining_date")<"2022-01-01","Experienced").otherwise("New")).display()

-- 60. Create name_length column using employee name.
        df.withColumn("name_length",length(col("emp_name"))).display()

-- 61. Create is_high_salary column using condition.
        df.withColumn("is_high_salary",when(col("salary")>80000,True).otherwise(False)).display()

-- 62. Create joining_year column from joining_date.
        df.withColumn("Joining_year",year(col("joining_date"))).display()

-- 63. Create salary_after_tax column.
        df.withColumn("salary_after_tax",col("salary")-(col("salary")*0.05)).display()

-- 64. Create department_code column.
        df.withColumn("department_code",substring(col("department"),1,3)).display()

-- 65. Create double_salary column.
        df.withColumn("double_salary",col("salary")*2).display()


## TYPECASTING

-- 66. Convert salary to string datatype.
        df.withColumn("salary",col("salary").cast("string")).display()

-- 67. Convert age to double datatype.
        df.withColumn("age",col("age").cast("double")).display()

-- 68. Convert joining_date to date datatype.
        df.withColumn("joining_date",col("joining_date").cast("date")).display()

-- 69. Convert emp_id to string datatype.
        df.withColumn("emp_id",col("emp_id").cast("string")).display()

-- 70. Convert salary to integer datatype.
        df.withColumn("salary",col("salary").cast("int")).display()

-- 71. Convert age to string datatype.
        df.withColumn("age",col("age").cast("string")).display()

-- 72. Convert joining_date to timestamp datatype.
        df.withColumn("joining_date",col("joining_date").cast("timestamp")).display()

-- 73. Convert salary to float datatype.
        df.withColumn("salary",col("salary").cast("float")).display()

-- 74. Convert emp_id to long datatype.
        df.withColumn("emp_id",col("emp_id").cast("long")).display()

-- 75. Convert multiple columns into different datatypes.
        df.withColumn("salary",col("salary").cast("string")).\
        withColumn("age",col("age").cast("double")).\
        withColumn("joining_date",col("joining_date").cast("date")).\
        withColumn("emp_id",col("emp_id").cast("string")).display()
