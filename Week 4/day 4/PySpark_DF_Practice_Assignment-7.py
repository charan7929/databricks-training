# =====================================================
# 31. REPARTITION() QUESTIONS
# =====================================================

# 1. Repartition dataframe into 4 partitions.
emp_df.repartition(4).display()

# 2. Repartition by department.
emp_df.repartition("department").display()

# 3. Check partition count.
# (Works only on Dedicated clusters, NOT on Databricks Serverless)
print(emp_df.rdd.getNumPartitions())

# 4. Compare repartition and coalesce.

# Repartition (shuffle)
emp_df.repartition(4).display()

# Coalesce (no full shuffle)
emp_df.coalesce(2).display()

# 5. Repartition large datasets.
emp_df.repartition(8).display()


# =====================================================
# 32. COALESCE() QUESTIONS
# =====================================================

# 1. Reduce partitions to 2.
emp_df.coalesce(2).display()

# 2. Check performance difference.
# Repartition performs shuffle
emp_df.repartition(4).display()

# Coalesce avoids full shuffle
emp_df.coalesce(2).display()

# 3. Use coalesce before writing files.
emp_df.coalesce(1).write.mode("overwrite").csv("/tmp/employee_output")

# 4. Compare shuffle behavior.

# Shuffle
emp_df.repartition(4).explain()

# No full shuffle
emp_df.coalesce(2).explain()

# 5. Optimize output files.
emp_df.coalesce(1).write.mode("overwrite").parquet("/tmp/output_parquet")


# =====================================================
# 33. CACHE() QUESTIONS
# =====================================================

# 1. Cache employee dataframe.
emp_df.cache()

# 2. Perform multiple actions after cache.
emp_df.cache()

emp_df.count()
emp_df.show()
emp_df.groupBy("department").count().display()

# 3. Compare execution time.
import time

start = time.time()
emp_df.count()
print("Without Cache:", time.time() - start)

emp_df.cache()

start = time.time()
emp_df.count()
print("With Cache:", time.time() - start)

# 4. Use cache with aggregation.
emp_df.cache()

emp_df.groupBy("department").avg("salary").display()

# 5. Unpersist cached dataframe.
emp_df.unpersist()


# =====================================================
# 34. FILLNA() QUESTIONS
# =====================================================

# 1. Fill null salaries with 0.
emp_df.fillna({"salary":0}).display()

# 2. Fill null city with Unknown.
emp_df.fillna({"city":"Unknown"}).display()

# 3. Fill multiple columns.
emp_df.fillna({
    "salary":0,
    "city":"Unknown",
    "age":25
}).display()

# 4. Fill null ages with average age.
avg_age = emp_df.select(avg("age")).collect()[0][0]

emp_df.fillna({"age":avg_age}).display()

# 5. Replace null strings.
emp_df.fillna("Unknown").display()


# =====================================================
# 35. REPLACE() QUESTIONS
# =====================================================

# 1. Replace Hyderabad with HYD.
emp_df.replace("Hyderabad","HYD","city").display()

# 2. Replace IT with Information Technology.
emp_df.replace("IT","Information Technology","department").display()

# 3. Replace Male/Female with M/F.
emp_df.replace(
    {"Male":"M","Female":"F"},
    subset=["gender"]
).display()

# 4. Replace QA with Testing.
emp_df.replace("QA","Testing","department").display()

# 5. Replace multiple values together.
emp_df.replace(
    {
        "Hyderabad":"HYD",
        "Bangalore":"BLR",
        "IT":"Information Technology",
        "QA":"Testing"
    },
    subset=["city","department"]
).display()
