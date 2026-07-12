## SORT / ORDERBY

-- 76. Sort employees by salary ascending.
    df.orderBy(col("salary")).display()

-- 77. Sort employees by salary descending.
    df.orderBy(col("salary").desc()).display()

-- 78. Sort employees by age descending.
    df.orderBy(col("age").desc()).display()

-- 79. Sort employees by emp_name ascending.
    df.orderBy(col("emp_name")).display()

-- 80. Sort employees by city and salary descending.
    df.orderBy(col("city").desc(),col("salary").desc()).display()

-- 81. Sort employees by joining_date.
    df.orderBy(col("joining_date")).display()

-- 82. Sort employees by department.
    df.orderBy(col("department")).display()

-- 83. Sort employees by designation descending.
    df.orderBy(col("designation").desc()).display()

-- 84. Sort employees first by city then age.
    df.orderBy(col("city"),col("age")).display()

-- 85. Sort employees by salary and limit top 10.
    df.orderBy(col("salary").desc()).limit(10).display()

-- 86. Sort employees by emp_id descending.
    df.orderBy(col("emp_id").desc()).display()

-- 87. Sort employees from IT department by salary descending.
    df.filter(col("department")=='IT').orderBy(col("salary").desc()).display()
    
-- 88. Sort employees by joining_date descending.
    df.orderBy(col("joining_date").desc()).display()

-- 89. Sort employees alphabetically by emp_name.
    df.orderBy(col("emp_name")).display()

-- 90. Sort employees by multiple columns.
    df.orderBy(col("salary").desc(),col("age").desc(),col("emp_name")).display()

## LIMIT

-- 91. Display first 5 records.
    df.limit(5).display()

-- 92. Display top 10 employees.
    df.limit(10).display()

-- 93. Display first 3 employees from IT department.
    df.filter(col("department")=='IT').limit(3).display()

-- 94. Display top 5 highest salary employees.
    df.orderBy(col("salary").desc()).limit(5).display()

-- 95. Display lowest 5 salary employees.
    df.orderBy(col("salary").asc()).limit(5).display()

-- 96. Display first 7 rows after sorting by age.
    df.orderBy(col("age").asc()).limit(7).display()

-- 97. Display first 2 employees from Hyderabad.
    df.filter(col("city")=='Hyderabad').limit(2).display()

-- 98. Display first 15 records from dataframe.
    df.limit(15).display()

-- 99. Display top 5 youngest employees.
    df.orderBy(col("age").asc()).limit(5).display()

-- 100. Display first 8 employees after filtering salary > 60000.
    df.filter(col("salary")>60000).limit(8).display()
    
