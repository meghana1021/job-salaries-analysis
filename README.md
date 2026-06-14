# Data Science Job Salaries Analysis Project

## Overview
This project analyzes global data science job salary data, exploring how compensation varies by experience level, job title, company size, location, remote work arrangement, and employment type.

## Dataset
- **File:** `Data_Science_Job_Salaries.csv`
- **Records:** 607 rows
- **Key Columns:** work_year, experience_level (EN/MI/SE/EX), employment_type (FT/CT/PT/FL), job_title, salary, salary_currency, salary_in_usd, employee_residence, remote_ratio, company_location, company_size (S/M/L)

## Objectives
- Clean and explore global salary data across multiple years
- Identify highest-paying job titles and experience levels
- Analyze salary trends over time and by company size/location
- Explore the impact of remote work on compensation

## Tools & Technologies
- Python (Pandas, Matplotlib, Seaborn)
- Jupyter Notebook
- SQL (MySQL)

## Project Structure
```
├── data_science_job_salaries_notebook.ipynb   # EDA & visualizations
├── Data_Science_Job_Salaries.csv              # Raw dataset
├── job_salaries_sql_queries.sql               # 10 analytical SQL queries
└── README.md
```

## SQL Queries Included
1. Average salary (USD) by experience level
2. Top 10 highest paying job titles
3. Number of jobs per work year
4. Average salary trend by work year
5. Salary comparison by company size
6. Remote work distribution and average salary
7. Top 10 countries by number of data science jobs
8. Average salary by employment type
9. Highest paid jobs overall (top 10)
10. Average salary for Senior vs Entry level by job title

## How to Run
1. Open `data_science_job_salaries_notebook.ipynb` in Jupyter Notebook
2. Run all cells to reproduce the EDA and charts
3. Import `Data_Science_Job_Salaries.csv` into MySQL as table `data_science_job_salaries`
4. Run queries from `job_salaries_sql_queries.sql`

## Author
Meghana Cheedella 
