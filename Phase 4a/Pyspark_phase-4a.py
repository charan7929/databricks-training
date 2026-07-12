from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql.window import Window
from pyspark.ml.feature import Bucketizer

# ==========================================================
# Create Spark Session
# ==========================================================

spark = SparkSession.builder.appName("Bucketing_Segmentation").getOrCreate()

# ==========================================================
# Read Data
# ==========================================================

customers = spark.read.option("header", "true").csv("/samples/customers.csv")
sales = spark.read.option("header", "true").csv("/samples/sales.csv")

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

# ==========================================================
# Create Customer Spend
# ==========================================================

customer_spend = customers.withColumn(
    "customer_name",
    concat_ws(" ", col("first_name"), col("last_name"))
).join(
    sales,
    "customer_id"
).groupBy(
    "customer_id",
    "customer_name"
).agg(
    sum("total_amount").alias("total_spend")
)

customer_spend.show()

# ==========================================================
# Task 1 : Gold / Silver / Bronze Segmentation
# ==========================================================

segment_df = customer_spend.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when(
        (col("total_spend") >= 5000) &
        (col("total_spend") <= 10000),
        "Silver"
    )
    .otherwise("Bronze")
)

segment_df.show()

# ==========================================================
# Task 2 : Count Customers by Segment
# ==========================================================

segment_df.groupBy(
    "segment"
).agg(
    count("*").alias("customer_count")
).show()

# ==========================================================
# Task 3 : Quantile-Based Segmentation
# ==========================================================

quantiles = customer_spend.approxQuantile(
    "total_spend",
    [0.33, 0.66],
    0
)

print("Quantiles:", quantiles)

quantile_df = customer_spend.withColumn(
    "segment",
    when(col("total_spend") <= quantiles[0], "Bronze")
    .when(col("total_spend") <= quantiles[1], "Silver")
    .otherwise("Gold")
)

quantile_df.show()

# ==========================================================
# Task 4 : Bucketizer (MLlib)
# ==========================================================

splits = [-float("inf"), 5000, 10000, float("inf")]

bucketizer = Bucketizer(
    splits=splits,
    inputCol="total_spend",
    outputCol="bucket"
)

bucket_df = bucketizer.transform(customer_spend)

bucket_df.show()

# ==========================================================
# Task 5 : Window-Based Ranking
# ==========================================================

window = Window.orderBy("total_spend")

rank_df = customer_spend.withColumn(
    "percent_rank",
    percent_rank().over(window)
)

rank_df.show()
