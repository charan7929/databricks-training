# =====================================================
# 41. MAPPARTITIONS() QUESTIONS
# =====================================================

# NOTE:
# These work only on Dedicated clusters.
# They DO NOT work on Databricks Serverless.

rdd = emp_df.rdd

# 1. Process data partition-wise.
rdd.mapPartitions(lambda partition: partition).collect()

# 2. Count rows per partition.
rdd.mapPartitions(lambda partition: [sum(1 for _ in partition)]).collect()

# 3. Convert names to uppercase partition-wise.
rdd.mapPartitions(
    lambda partition: ((row.name.upper()) for row in partition)
).collect()

# 4. Optimize heavy computations.
rdd.mapPartitions(
    lambda partition: [(row.emp_id, row.salary * 1.10) for row in partition]
).collect()

# 5. Compare map vs mapPartitions.

# map()
rdd.map(lambda row: row.name.upper()).collect()

# mapPartitions()
rdd.mapPartitions(
    lambda partition: (row.name.upper() for row in partition)
).collect()


# =====================================================
# 42. ZIPWITHINDEX() QUESTIONS
# =====================================================

# NOTE:
# These work only on Dedicated clusters.
# They DO NOT work on Databricks Serverless.

rdd = emp_df.rdd

# 1. Add index to each employee.
rdd.zipWithIndex().collect()

# 2. Generate sequence numbers.
rdd.zipWithIndex().collect()

# 3. Create row IDs.
rdd.zipWithIndex().collect()

# 4. Compare monotonically_increasing_id().

# RDD
rdd.zipWithIndex().collect()

# DataFrame
from pyspark.sql.functions import monotonically_increasing_id

emp_df.withColumn(
    "row_id",
    monotonically_increasing_id()
).display()

# 5. Generate indexed employee list.
rdd.zipWithIndex().map(
    lambda x: (x[1], x[0])
).collect()


# =====================================================
# 43. CROSSJOIN() QUESTIONS
# =====================================================

# Example department dataframe

dept_data = [
    ("IT",),
    ("HR",),
    ("QA",)
]

dept_df = spark.createDataFrame(dept_data, ["department"])

# 1. Cross join employees with departments.
emp_df.crossJoin(dept_df).display()

# 2. Generate all combinations.
emp_df.select("emp_id").crossJoin(
    dept_df.select("department")
).display()

# 3. Find total combinations count.
emp_df.crossJoin(dept_df).count()

# 4. Cross join city and department.
emp_df.select("city").distinct().crossJoin(
    dept_df
).display()

# 5. Understand Cartesian product.
emp_df.select("emp_id").crossJoin(
    dept_df
).display()


# =====================================================
# 44. EXCEPT() QUESTIONS
# =====================================================

# Example new employee dataframe
new_emp_df = emp_df.limit(5)

# 1. Find employees not in new_emp_df.
emp_df.exceptAll(new_emp_df).display()

# 2. Compare two dataframes.
emp_df.exceptAll(new_emp_df).display()

# 3. Remove matching rows.
emp_df.exceptAll(new_emp_df).display()

# 4. Find difference between datasets.
new_emp_df.exceptAll(emp_df).display()

# 5. Validate missing employees.
emp_df.exceptAll(new_emp_df).display()


# =====================================================
# 45. INTERSECT() QUESTIONS
# =====================================================

# 1. Find common employees.
emp_df.intersect(new_emp_df).display()

# 2. Compare datasets.
emp_df.intersect(new_emp_df).display()

# 3. Find common departments.
emp_df.select("department").intersect(
    new_emp_df.select("department")
).display()

# 4. Find common cities.
emp_df.select("city").intersect(
    new_emp_df.select("city")
).display()

# 5. Validate matching records.
emp_df.intersect(new_emp_df).display()
