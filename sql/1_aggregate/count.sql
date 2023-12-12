# How many departments are there in the “employees” database?
SELECT
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;