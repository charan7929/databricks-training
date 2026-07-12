# =====================================================
# 26. ISIN() QUESTIONS
# =====================================================

# 1. Find employees from Hyderabad and Bangalore.
emp_df.filter(col("city").isin("Hyderabad", "Bangalore")).display()

# 2. Find employees in IT and QA departments.
emp_df.filter(col("department").isin("IT", "QA")).display()

# 3. Find employees with age 28, 30 and 35.
emp_df.filter(col("age").isin(28, 30, 35)).display()

# 4. Filter female employees from Pune and Chennai.
emp_df.filter(
    (col("gender") == "Female") &
    (col("city").isin("Pune", "Chennai"))
).display()

# 5. Find employees with specific emp_ids.
emp_df.filter(col("emp_id").isin(101, 105)).display()


# =====================================================
# 27. BETWEEN() QUESTIONS
# =====================================================

# 1. Find employees with salary between 50000 and 80000.
emp_df.filter(col("salary").between(50000, 80000)).display()

# 2. Find employees aged between 25 and 30.
emp_df.filter(col("age").between(25, 30)).display()

# 3. Find salaries between 60000 and 90000.
emp_df.filter(col("salary").between(60000, 90000)).display()

# 4. Find employees joined between years.
emp_df.filter(year(col("joining_date")).between(2015, 2020)).display()

# 5. Find employees with emp_id between 102 and 108.
emp_df.filter(col("emp_id").between(102, 108)).display()


# =====================================================
# 28. PIVOT() QUESTIONS
# =====================================================

# 1. Pivot department with average salary.
emp_df.groupBy().pivot("department").avg("salary").display()

# 2. Pivot city with employee count.
emp_df.groupBy().pivot("city").count().display()

# 3. Pivot gender with total salary.
emp_df.groupBy().pivot("gender").sum("salary").display()

# 4. Pivot department with maximum age.
emp_df.groupBy().pivot("department").max("age").display()

# 5. Create department-wise summary table.
emp_df.groupBy().pivot("department").agg(
    avg("salary").alias("avg_salary"),
    max("age").alias("max_age")
).display()


# =====================================================
# 29. UNPIVOT / STACK QUESTIONS
# =====================================================

# Create a pivoted dataframe for practice
pivot_df = emp_df.groupBy().pivot("department").avg("salary")

# 1. Convert pivoted salary table back to rows.
pivot_df.unpivot(
    ids=[],
    values=["IT", "HR", "QA", "Analytics", "Support"],
    variableColumnName="department",
    valueColumnName="avg_salary"
).display()

# 2. Unpivot city data.
city_df = emp_df.groupBy().pivot("city").count()

city_df.unpivot(
    ids=[],
    values=["Hyderabad", "Bangalore", "Chennai", "Pune", "Mumbai"],
    variableColumnName="city",
    valueColumnName="employee_count"
).display()

# 3. Convert department columns into rows.
pivot_df.unpivot(
    ids=[],
    values=["IT", "HR", "QA", "Analytics", "Support"],
    variableColumnName="department",
    valueColumnName="salary"
).display()

# 4. Practice stack function.
pivot_df.selectExpr(
    "stack(5, \
    'IT', IT, \
    'HR', HR, \
    'QA', QA, \
    'Analytics', Analytics, \
    'Support', Support) as (department, avg_salary)"
).display()

# 5. Create normalized dataframe.
pivot_df.selectExpr(
    "stack(5, \
    'IT', IT, \
    'HR', HR, \
    'QA', QA, \
    'Analytics', Analytics, \
    'Support', Support) as (department, salary)"
).display()


# =====================================================
# 30. WINDOW FUNCTIONS QUESTIONS
# =====================================================

from pyspark.sql.functions import *
from pyspark.sql.window import Window

# 1. Find rank of employees based on salary.
emp_df.withColumn(
    "rank",
    rank().over(Window.orderBy(col("salary").desc()))
).display()

# 2. Find dense_rank department-wise.
emp_df.withColumn(
    "dense_rank",
    dense_rank().over(
        Window.partitionBy("department").orderBy(col("salary").desc())
    )
).display()

# 3. Find row_number for employees.
emp_df.withColumn(
    "row_number",
    row_number().over(Window.orderBy(col("salary").desc()))
).display()

# 4. Find lead salary.
emp_df.withColumn(
    "lead_salary",
    lead("salary", 1).over(Window.orderBy("joining_date"))
).display()

# 5. Find lag salary.
emp_df.withColumn(
    "lag_salary",
    lag("salary", 1).over(Window.orderBy("joining_date"))
).display()
