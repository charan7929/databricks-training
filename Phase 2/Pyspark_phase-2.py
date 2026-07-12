from pyspark.sql import SparkSession
from pyspark.sql.functions import *

# Create Spark Session
spark = SparkSession.builder.appName("SQL_to_PySpark_Bridge").getOrCreate()

# ==========================================================
# Read CSV Files
# ==========================================================

customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")

# Display Data
customers.show()
sales.show()

# Display Schema
customers.printSchema()
sales.printSchema()

# ==========================================================
# Mini Cleaning Task
# ==========================================================

# Remove rows with missing customer_id
customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])

# Convert total_amount from string to double
sales = sales.withColumn(
    "total_amount",
    col("total_amount").cast("double")
)

# ==========================================================
# 1. Total order amount for each customer
# ==========================================================

sales.groupBy("customer_id") \
    .agg(
        sum("total_amount").alias("total_order_amount")
    ) \
    .show()

# ==========================================================
# 2. Top 3 customers by total spend
# ==========================================================

sales.groupBy("customer_id") \
    .agg(
        sum("total_amount").alias("total_spend")
    ) \
    .orderBy(
        col("total_spend").desc()
    ) \
    .limit(3) \
    .show()

# ==========================================================
# 3. Customers with no orders
# ==========================================================

customers.join(
    sales,
    on="customer_id",
    how="left"
).filter(
    sales.customer_id.isNull()
).select(
    customers.customer_id,
    concat_ws(
        " ",
        customers.first_name,
        customers.last_name
    ).alias("customer_name")
).show()

# ==========================================================
# 4. City-wise total revenue
# ==========================================================

customers.join(
    sales,
    on="customer_id",
    how="inner"
).groupBy(
    "city"
).agg(
    sum("total_amount").alias("total_revenue")
).show()

# ==========================================================
# 5. Average order amount per customer
# ==========================================================

sales.groupBy("customer_id") \
    .agg(
        avg("total_amount").alias("average_order_amount")
    ) \
    .show()

# ==========================================================
# 6. Customers with more than one order
# ==========================================================

sales.groupBy("customer_id") \
    .agg(
        count("*").alias("total_orders")
    ) \
    .filter(
        col("total_orders") > 1
    ) \
    .show()

# ==========================================================
# 7. Sort customers by total spend descending
# ==========================================================

customers.withColumn(
    "customer_name",
    concat_ws(
        " ",
        col("first_name"),
        col("last_name")
    )
).join(
    sales,
    on="customer_id",
    how="inner"
).groupBy(
    "customer_id",
    "customer_name"
).agg(
    sum("total_amount").alias("total_spend")
).orderBy(
    col("total_spend").desc()
).show()
