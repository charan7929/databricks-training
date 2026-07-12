# =====================================================
# 46. CUBE() QUESTIONS
# =====================================================

# 1. Perform cube on department and city.
emp_df.cube("department", "city").count().display()

# 2. Find multi-dimensional aggregates.
emp_df.cube("department", "city").agg(
    avg("salary").alias("avg_salary")
).display()

# 3. Analyze salary combinations.
emp_df.cube("department", "city").agg(
    sum("salary").alias("total_salary")
).display()

# 4. Find total salary cube.
emp_df.cube("department", "city").sum("salary").display()

# 5. Compare rollup and cube.
emp_df.cube("department", "city").count().display()


# =====================================================
# 47. ROLLUP() QUESTIONS
# =====================================================

# 1. Rollup department and city.
emp_df.rollup("department", "city").count().display()

# 2. Create hierarchical summaries.
emp_df.rollup("department", "city").agg(
    avg("salary").alias("avg_salary")
).display()

# 3. Find total salaries.
emp_df.rollup("department", "city").sum("salary").display()

# 4. Analyze rollup output.
emp_df.rollup("department", "city").agg(
    count("*").alias("employee_count")
).display()

# 5. Compare cube and rollup.
emp_df.rollup("department", "city").agg(
    max("salary").alias("max_salary")
).display()


# =====================================================
# 48. BROADCAST() QUESTIONS
# =====================================================

from pyspark.sql.functions import broadcast

# Example department dataframe
dept_data = [
    ("IT", "John"),
    ("HR", "Smith"),
    ("QA", "David"),
    ("Analytics", "Kevin"),
    ("Support", "Robert")
]

dept_columns = ["department", "manager"]

dept_df = spark.createDataFrame(dept_data, dept_columns)

# 1. Broadcast join small department table.
emp_df.join(
    broadcast(dept_df),
    "department"
).display()

# 2. Compare join performance.

# Normal Join
emp_df.join(dept_df, "department").display()

# Broadcast Join
emp_df.join(broadcast(dept_df), "department").display()

# 3. Optimize joins.
emp_df.join(
    broadcast(dept_df),
    "department",
    "inner"
).display()

# 4. Use broadcast with lookup table.
emp_df.join(
    broadcast(dept_df),
    "department"
).display()

# 5. Analyze execution plan.
emp_df.join(
    broadcast(dept_df),
    "department"
).explain()


# =====================================================
# 49. EXPLODE_OUTER() QUESTIONS
# =====================================================

from pyspark.sql.functions import explode_outer

# Example dataframe
data = [
    (1, ["Python", "SQL"]),
    (2, None),
    (3, []),
    (4, ["Spark", "Azure"])
]

skill_df = spark.createDataFrame(data, ["emp_id", "skills"])

# 1. Explode arrays with null values.
skill_df.select(
    "emp_id",
    explode_outer("skills").alias("skill")
).display()

# 2. Compare explode and explode_outer.

# explode()
skill_df.select(
    "emp_id",
    explode("skills").alias("skill")
).display()

# explode_outer()
skill_df.select(
    "emp_id",
    explode_outer("skills").alias("skill")
).display()

# 3. Handle empty arrays.
skill_df.select(
    "emp_id",
    explode_outer("skills").alias("skill")
).display()

# 4. Preserve null rows.
skill_df.select(
    "emp_id",
    explode_outer("skills").alias("skill")
).display()

# 5. Analyze output differences.
skill_df.select(
    "emp_id",
    explode_outer("skills").alias("skill")
).display()


# =====================================================
# 50. ARRAY_CONTAINS() QUESTIONS
# =====================================================

from pyspark.sql.functions import array_contains

# Using skill_df created above

# 1. Find employees with Spark skill.
skill_df.filter(
    array_contains("skills", "Spark")
).display()

# 2. Filter Python developers.
skill_df.filter(
    array_contains("skills", "Python")
).display()

# 3. Search arrays.
skill_df.filter(
    array_contains("skills", "SQL")
).display()

# 4. Find employees with SQL skill.
skill_df.filter(
    array_contains("skills", "SQL")
).display()

# 5. Check Azure skill availability.
skill_df.filter(
    array_contains("skills", "Azure")
).display()
