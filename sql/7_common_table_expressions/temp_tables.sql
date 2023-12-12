# 1: Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.

CREATE TEMPORARY TABLE male_max_salaries
SELECT
    s.emp_no, MAX(s.salary)
FROM
    salaries s
        JOIN
    employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no;

# 2: Write a query that, upon execution, allows you to check the result set contained in the male_max_salaries temporary table you created in the previous exercise.

SELECT
    *
FROM
    male_max_salaries;
    
    
# 3: Create a temporary table called dates containing the following three columns:
# - one displaying the current date and time,
# - another one displaying two months earlier than the current date and time, and a
# - third column displaying two years later than the current date and time.

CREATE TEMPORARY TABLE dates
SELECT
    NOW(),
    DATE_SUB(NOW(), INTERVAL 2 MONTH) AS two_months_earlier,
    DATE_SUB(NOW(), INTERVAL -2 YEAR) AS two_years_later;

# 4: Write a query that, upon execution, allows you to check the result set contained in the dates temporary table you created in the previous exercise.

SELECT
    *
FROM
    dates dates;

# 5: Create a query joining the result sets from the dates temporary table you created during the previous lecture with a new Common Table Expression (CTE) containing the same columns. Let all columns in the result set appear on the same row.

WITH cte AS (SELECT
    NOW(),
    DATE_SUB(NOW(), INTERVAL 2 MONTH) AS cte_a_month_earlier,
    DATE_SUB(NOW(), INTERVAL -2 YEAR) AS cte_a_year_later)
SELECT * FROM dates d1 JOIN cte c;

# 6: Again, create a query joining the result sets from the dates temporary table you created during the previous lecture with a new Common Table Expression (CTE) containing the same columns. This time, combine the two sets vertically.

WITH cte AS (SELECT
    NOW(),
    DATE_SUB(NOW(), INTERVAL 1 MONTH) AS cte_a_month_earlier,
    DATE_SUB(NOW(), INTERVAL -1 YEAR) AS cte_a_year_later)
SELECT * FROM dates UNION SELECT * FROM cte;

# 7: Drop the male_max_salaries and dates temporary tables you recently created.
DROP TABLE IF EXISTS male_max_salaries;
DROP TABLE IF EXISTS dates;
