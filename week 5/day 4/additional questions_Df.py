# =====================================================
# BONUS CHALLENGE QUESTIONS - SOLUTIONS
# =====================================================

from pyspark.sql.functions import *
from pyspark.sql.window import Window

# -----------------------------------------------------
# 1. Find second highest salary using window functions
# -----------------------------------------------------
ranked_df = emp_df.withColumn(
    "dense_rank",
    dense_rank().over(Window.orderBy(col("salary").desc()))
)

ranked_df.display()
ranked_df.filter(col("dense_rank") == 2).display()


# -----------------------------------------------------
# 2. Find duplicate employee records
# -----------------------------------------------------
emp_df.groupBy(emp_df.columns) \
      .count() \
      .filter("count > 1") \
      .display()


# -----------------------------------------------------
# 3. Find employees joined in the same year
# -----------------------------------------------------
emp_df.groupBy(year("joining_date").alias("joining_year")) \
      .count() \
      .display()


# -----------------------------------------------------
# 4. Department-wise top earners
# -----------------------------------------------------
window_spec = Window.partitionBy("department").orderBy(col("salary").desc())

emp_df.withColumn("rn", row_number().over(window_spec)) \
      .filter(col("rn") == 1) \
      .display()


# -----------------------------------------------------
# 5. Running total salary
# -----------------------------------------------------
window_spec = Window.orderBy("emp_id")

emp_df.withColumn("running_total", sum("salary").over(window_spec)) \
      .display()


# -----------------------------------------------------
# 6. Cumulative average salary
# -----------------------------------------------------
window_spec = Window.orderBy("emp_id")

emp_df.withColumn("cum_avg_salary", avg("salary").over(window_spec)) \
      .display()


# -----------------------------------------------------
# 7. Employees with same salary
# -----------------------------------------------------
emp_df.groupBy("salary") \
      .count() \
      .filter("count > 1") \
      .display()


# -----------------------------------------------------
# 8. Longest employee name
# -----------------------------------------------------
emp_df.orderBy(length("name").desc()) \
      .limit(1) \
      .display()


# -----------------------------------------------------
# 9. Dynamic salary bands
# -----------------------------------------------------
emp_df.withColumn(
    "salary_band",
    when(col("salary") < 50000, "Low")
    .when(col("salary") < 80000, "Medium")
    .otherwise("High")
).display()


# -----------------------------------------------------
# 10. Complete employee reporting pipeline
# -----------------------------------------------------
final_df = emp_df \
    .dropDuplicates() \
    .fillna({"salary": 0, "city": "Unknown"}) \
    .withColumn("joining_year", year("joining_date")) \
    .withColumn(
        "salary_band",
        when(col("salary") < 50000, "Low")
        .when(col("salary") < 80000, "Medium")
        .otherwise("High")
    )

final_df.display()
