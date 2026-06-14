
-- Data Science Job Salaries Project - 10 SQL Queries
-- Table: job_salaries (work_year, experience_level, employment_type,
--   job_title, salary, salary_currency, salary_in_usd,
--   employee_residence, remote_ratio, company_location, company_size)
-- experience_level: EN=Entry, MI=Mid, SE=Senior, EX=Executive
-- employment_type: FT=Full-time, CT=Contract, PT=Part-time, FL=Freelance
-- company_size: S=Small, M=Medium, L=Large

CREATE DATABASE job_salaries_db;

CREATE TABLE data_science_job_salaries (
    id INT,
    work_year INT,
    experience_level VARCHAR(5),
    employment_type VARCHAR(5),
    job_title VARCHAR(100),
    salary BIGINT,
    salary_currency VARCHAR(10),
    salary_in_usd BIGINT,
    employee_residence VARCHAR(5),
    remote_ratio INT,
    company_location VARCHAR(5),
    company_size VARCHAR(5)
);
SELECT count(*) FROM data_science_job_salaries;

-- 1. Average salary (USD) by experience level

SELECT experience_level, ROUND(AVG(salary_in_usd),2) AS avg_salary_usd
FROM data_science_job_salaries
GROUP BY experience_level
ORDER BY avg_salary_usd DESC;

-- 2. Top 10 highest paying job titles (average salary)
SELECT job_title, ROUND(AVG(salary_in_usd),2) AS avg_salary_usd, COUNT(*) AS num_roles
FROM data_science_job_salaries
GROUP BY job_title
HAVING COUNT(*) >= 3
ORDER BY avg_salary_usd DESC
LIMIT 10;

-- 3. Number of jobs per work year
SELECT work_year, COUNT(*) AS total_jobs
FROM data_science_job_salaries
GROUP BY work_year
ORDER BY work_year;

-- 4. Average salary trend by work year
SELECT work_year, ROUND(AVG(salary_in_usd),2) AS avg_salary_usd
FROM data_science_job_salaries
GROUP BY work_year
ORDER BY work_year;

-- 5. Salary comparison by company size
SELECT company_size, ROUND(AVG(salary_in_usd),2) AS avg_salary_usd, COUNT(*) AS num_jobs
FROM data_science_job_salaries
GROUP BY company_size
ORDER BY avg_salary_usd DESC;

-- 6. Remote work distribution and average salary
SELECT remote_ratio, COUNT(*) AS num_jobs, ROUND(AVG(salary_in_usd),2) AS avg_salary_usd
FROM data_science_job_salaries
GROUP BY remote_ratio
ORDER BY remote_ratio;

-- 7. Top 10 countries by number of data science jobs (employee residence)
SELECT employee_residence, COUNT(*) AS num_jobs
FROM data_science_job_salaries
GROUP BY employee_residence
ORDER BY num_jobs DESC
LIMIT 10;

-- 8. Average salary by employment type
SELECT employment_type, ROUND(AVG(salary_in_usd),2) AS avg_salary_usd, COUNT(*) AS num_jobs
FROM data_science_job_salaries
GROUP BY employment_type
ORDER BY avg_salary_usd DESC;

-- 9. Highest paid jobs overall (top 10 individual records)
SELECT job_title, experience_level, company_location, salary_in_usd
FROM data_science_job_salaries
ORDER BY salary_in_usd DESC
LIMIT 10;

-- 10. Average salary for Senior vs Entry level by job title (top 10 titles)
SELECT job_title,
       ROUND(AVG(CASE WHEN experience_level='SE' THEN salary_in_usd END),2) AS avg_senior_salary,
       ROUND(AVG(CASE WHEN experience_level='EN' THEN salary_in_usd END),2) AS avg_entry_salary
FROM data_science_job_salaries
GROUP BY job_title
HAVING avg_senior_salary IS NOT NULL AND avg_entry_salary IS NOT NULL
ORDER BY avg_senior_salary DESC
LIMIT 10;
