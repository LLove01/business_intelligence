# a tool for obtaining such temporary result sets that exist within the execution of a given quuery

# Syntax: 
# WITH cte_name AS (SELECT ... FROM...)
# SELECT 
# 	...
# FROM 
#	cte_name...;

# TASK: How many salary contracts signed by female employees have been valued above the all-time average contract salary value of the company

WITH cte AS (
SELECT AVG (salary) AS avg_salary FROM salaries)
SELECT 
SUM(CASE WHEN s.salary > c.avg_salary THEN 1 ELSE 0 END) AS no_f_salaries_above_avg,
COUNT(s.salary) AS total_no_of_salary_contracts
FROM 
	salaries s 
		JOIN
	employees e ON s.emp_no = e.emp_no AND e.gender = 'F'
		CROSS JOIN
	cte c;
    



