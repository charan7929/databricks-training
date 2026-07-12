from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql.window import Window

# ==========================================================
# Create Spark Session
# ==========================================================

spark = SparkSession.builder.appName("Business_Pipeline_Analytics").getOrCreate()

# ==========================================================
# Extract
# ==========================================================

customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")

# ==========================================================
# Inspect Data
# ==========================================================

customers.show()
sales.show()

customers.printSchema()
sales.printSchema()

# ==========================================================
# Data Cleaning
# ==========================================================

customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])

customers = customers.dropDuplicates()
sales = sales.dropDuplicates()

sales = sales.withColumn(
    "total_amount",
    col("total_amount").cast("double")
)

sales = sales.filter(col("total_amount") > 0)

# Create Customer Name

customers = customers.withColumn(
    "customer_name",
    concat_ws(" ", col("first_name"), col("last_name"))
)

# ==========================================================
# Task 1 : Daily Sales
# ==========================================================

daily_sales = sales.groupBy("sale_date") \
    .agg(
        sum("total_amount").alias("total_sales")
    )

daily_sales.show()

# ==========================================================
# Task 2 : City-wise Revenue
# ==========================================================

city_revenue = customers.join(
    sales,
    "customer_id"
).groupBy(
    "city"
).agg(
    sum("total_amount").alias("total_revenue")
)

city_revenue.show()

# ==========================================================
# Task 3 : Top 5 Customers
# ==========================================================

top_customers = customers.join(
    sales,
    "customer_id"
).groupBy(
    "customer_name"
).agg(
    sum("total_amount").alias("total_spend")
).orderBy(
    col("total_spend").desc()
).limit(5)

top_customers.show()

# ==========================================================
# Task 4 : Repeat Customers (>1 Order)
# ==========================================================

repeat_customers = sales.groupBy(
    "customer_id"
).agg(
    count("*").alias("order_count")
).filter(
    col("order_count") > 1
)

repeat_customers.show()

# ==========================================================
# Task 5 : Customer Segmentation
# ==========================================================

customer_spend = customers.join(
    sales,
    "customer_id"
).groupBy(
    "customer_id",
    "customer_name"
).agg(
    sum("total_amount").alias("total_spend")
)

customer_segment = customer_spend.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when(
        (col("total_spend") >= 5000) &
        (col("total_spend") <= 10000),
        "Silver"
    )
    .otherwise("Bronze")
)

customer_segment.show()

# ==========================================================
# Task 6 : Final Reporting Table
# ==========================================================

final_df = customers.join(
    sales,
    "customer_id"
).groupBy(
    "customer_id",
    "customer_name",
    "city"
).agg(
    sum("total_amount").alias("total_spend"),
    count("*").alias("order_count")
)

final_df = final_df.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when(
        (col("total_spend") >= 5000) &
        (col("total_spend") <= 10000),
        "Silver"
    )
    .otherwise("Bronze")
)

final_df.orderBy(
    col("total_spend").desc()
).show()

print("Pipeline executed successfully!")
