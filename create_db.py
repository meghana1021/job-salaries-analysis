import pandas as pd
import sqlite3

df = pd.read_csv("salaries.csv")


conn = sqlite3.connect("salaries.db")


df.to_sql("jobs", conn, if_exists="replace", index=False)

conn.close()

print("Database created successfully!")
