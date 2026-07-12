# Databricks notebook source


# COMMAND ----------

# Read empData.csv
emp_df = spark.read.format("csv") .option("header", True) .option("inferSchema", True) .load("/Volumes/workspace/default/databricks2027/empData.csv")

emp_df.display()

# Read Big Sales.csv
sales_df = spark.read.format("csv") .option("header", True) .option("inferSchema", True) .load("/Volumes/workspace/default/databricks2027/Big Sales.csv")

sales_df.display()
