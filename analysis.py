import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

# Connect to database
conn = sqlite3.connect("salaries.db")

# 1. Average salary by job title
query1 = """
SELECT job_title, AVG(salary_in_usd) AS avg_salary
FROM jobs
GROUP BY job_title
"""
df1 = pd.read_sql(query1, conn)
print(df1)

# 2. Salary by experience level
query2 = """
SELECT experience_level, AVG(salary_in_usd) AS avg_salary
FROM jobs
GROUP BY experience_level
"""
df2 = pd.read_sql(query2, conn)
print(df2)

# 3. Remote vs Non-Remote salary
query3 = """
SELECT remote_ratio, AVG(salary_in_usd) AS avg_salary
FROM jobs
GROUP BY remote_ratio
"""
df3 = pd.read_sql(query3, conn)
print(df3)

conn.close()

# 📊 Plot average salary by job title
plt.figure()
plt.bar(df1["job_title"], df1["avg_salary"])
plt.xticks(rotation=30)
plt.title("Average Salary by Job Title")
plt.xlabel("Job Title")
plt.ylabel("Salary (USD)")
plt.show()
