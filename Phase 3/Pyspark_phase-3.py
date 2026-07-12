from pyspark.sql import SparkSession
from pyspark.sql.functions import *

# ==========================================================
# Create Spark Session
# ==========================================================

spark = SparkSession.builder.appName("Phase3_ETL_Pipeline").getOrCreate()

# ==========================================================
# Extract
# ==========================================================

customers = spark.read.option("header", "true").csv("/samples/customers.csv")

sales = spark.read.option("header", "true").csv("/samples/sales.csv")

# Read JSON Sample
json_df = spark.read.option("multiline", "true").json("/samples/sample.json")

# Read Parquet Sample
parquet_df = spark.read.parquet("/samples/sample.parquet")

# ==========================================================
# Inspect Data
# ==========================================================

customers.show()
sales.show()

customers.printSchema()
sales.printSchema()

# ==========================================================
# Identify Missing Values
# ==========================================================

customers.select([count(when(col(c).isNull(), c)).alias(c) for c in customers.columns]).show()

sales.select([count(when(col(c).isNull(), c)).alias(c) for c in sales.columns]).show()

# ==========================================================
# Clean Data
# ==========================================================

customers = customers.dropna(subset=["customer_id"])

sales = sales.dropna(subset=["customer_id"])

sales = sales.withColumn(
    "total_amount",
    col("total_amount").cast("double")
)

# ==========================================================
# Filter Invalid Records
# ==========================================================

sales = sales.filter(col("total_amount") > 0)

# ==========================================================
# 1. Daily Sales
# ==========================================================

sales.groupBy("order_date") \
    .agg(
        sum("total_amount").alias("daily_sales")
    ) \
    .show()

# ==========================================================
# 2. City-wise Revenue
# ==========================================================

customers.join(
    sales,
    "customer_id"
).groupBy(
    "city"
).agg(
    sum("total_amount").alias("total_revenue")
).show()

# ==========================================================
# 3. Repeat Customers (>2 Orders)
# ==========================================================

sales.groupBy("customer_id") \
    .agg(
        count("*").alias("order_count")
    ) \
    .filter(
        col("order_count") > 2
    ) \
    .show()

# ==========================================================
# 4. Highest Spending Customer in Each City
# ==========================================================

customer_spend = customers.withColumn(
    "customer_name",
    concat_ws(" ", col("first_name"), col("last_name"))
).join(
    sales,
    "customer_id"
).groupBy(
    "customer_id",
    "customer_name",
    "city"
).agg(
    sum("total_amount").alias("total_spend")
)

windowSpec = Window.partitionBy("city").orderBy(col("total_spend").desc())

customer_spend.withColumn(
    "rank",
    row_number().over(windowSpec)
).filter(
    col("rank") == 1
).drop("rank").show()

# ==========================================================
# 5. Final Reporting Table
# ==========================================================

customers.withColumn(
    "customer_name",
    concat_ws(" ", col("first_name"), col("last_name"))
).join(
    sales,
    "customer_id"
).groupBy(
    "customer_id",
    "customer_name",
    "city"
).agg(
    sum("total_amount").alias("total_spend"),
    count("*").alias("order_count")
).orderBy(
    col("total_spend").desc()
).show()
