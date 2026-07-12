# =====================================================
# 36. NA.DROP() QUESTIONS
# =====================================================

# 1. Drop rows with null salary.
emp_df.na.drop(subset=["salary"]).display()

# 2. Drop rows with any null value.
emp_df.na.drop().display()

# 3. Drop rows with all null values.
emp_df.na.drop(how="all").display()

# 4. Drop rows based on threshold.
# Keep rows having at least 3 non-null values.
emp_df.na.drop(thresh=3).display()

# 5. Drop rows with null city.
emp_df.na.drop(subset=["city"]).display()


# =====================================================
# 37. NA.FILL() QUESTIONS
# =====================================================

# 1. Fill null age with 25.
emp_df.na.fill({"age":25}).display()

# 2. Fill null department with Unknown.
emp_df.na.fill({"department":"Unknown"}).display()

# 3. Fill salary with average.
avg_salary = emp_df.select(avg("salary")).collect()[0][0]

emp_df.na.fill({"salary":avg_salary}).display()

# 4. Fill multiple columns together.
emp_df.na.fill({
    "age":25,
    "salary":0,
    "department":"Unknown",
    "city":"Unknown"
}).display()

# 5. Fill missing string values.
emp_df.na.fill("Unknown").display()


# =====================================================
# 38. MAP() TRANSFORMATION QUESTIONS (RDD)
# =====================================================

# NOTE:
# These work only on Dedicated clusters.
# They DO NOT work on Databricks Serverless.

rdd = emp_df.rdd

# 1. Convert names to uppercase.
rdd.map(lambda x: x.name.upper()).collect()

# 2. Increase salary by 10%.
rdd.map(lambda x: (x.name, x.salary * 1.10)).collect()

# 3. Extract employee names.
rdd.map(lambda x: x.name).collect()

# 4. Convert department names to lowercase.
rdd.map(lambda x: x.department.lower()).collect()

# 5. Create employee summary strings.
rdd.map(
    lambda x: f"{x.name} works in {x.department} with salary {x.salary}"
).collect()


# =====================================================
# 39. FLATMAP() QUESTIONS (RDD)
# =====================================================

# Example RDDs

name_rdd = spark.sparkContext.parallelize(["John", "Alice", "David"])

designation_rdd = spark.sparkContext.parallelize([
    "Software Engineer",
    "Data Analyst"
])

skills_rdd = spark.sparkContext.parallelize([
    ["Python","SQL"],
    ["Java","Spark"],
    ["HTML","CSS"]
])

nested_rdd = spark.sparkContext.parallelize([
    [1,2],
    [3,4],
    [5,6]
])

sentence_rdd = spark.sparkContext.parallelize([
    "PySpark is easy",
    "RDD supports transformations"
])

# 1. Split names into characters.
name_rdd.flatMap(lambda x: list(x)).collect()

# 2. Split designation words.
designation_rdd.flatMap(lambda x: x.split()).collect()

# 3. Extract all skills.
skills_rdd.flatMap(lambda x: x).collect()

# 4. Flatten nested lists.
nested_rdd.flatMap(lambda x: x).collect()

# 5. Generate words from sentences.
sentence_rdd.flatMap(lambda x: x.split()).collect()


# =====================================================
# 40. REDUCEBYKEY() QUESTIONS (RDD)
# =====================================================

# NOTE:
# These work only on Dedicated clusters.
# They DO NOT work on Databricks Serverless.

rdd = emp_df.rdd

# 1. Count employees by department.
rdd.map(
    lambda x: (x.department, 1)
).reduceByKey(
    lambda a, b: a + b
).collect()

# 2. Sum salaries department-wise.
rdd.map(
    lambda x: (x.department, x.salary)
).reduceByKey(
    lambda a, b: a + b
).collect()

# 3. Count city-wise employees.
rdd.map(
    lambda x: (x.city, 1)
).reduceByKey(
    lambda a, b: a + b
).collect()

# 4. Aggregate ages by department.
rdd.map(
    lambda x: (x.department, x.age)
).reduceByKey(
    lambda a, b: a + b
).collect()

# 5. Find maximum salary by city.
rdd.map(
    lambda x: (x.city, x.salary)
).reduceByKey(
    lambda a, b: max(a, b)
).collect()
