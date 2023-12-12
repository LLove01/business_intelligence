# Write a query that upon execution, assigns a row number to all managers we have information for in the "employees" database (regardless of their department).
# Let the numbering disregard the department the managers have worked in. Also, let it start from the value of 1. Assign that value to the manager with the lowest employee number.
SELECT
    emp_no,
    dept_no,
    ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num
FROM
dept_manager;

# Write a query that upon execution, assigns a sequential number for each employee number registered in the "employees" table. Partition the data by the employee's first name and order it by their last name in ascending order (for each partition).
SELECT
	emp_no,
	first_name,
	last_name,
	ROW_NUMBER() OVER (PARTITION BY first_name ORDER BY last_name) AS row_num
FROM
employees;