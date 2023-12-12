# Window function syntax: 
# SELECT 
#	...,
#	ROW_NUMBER() OVER alias AS ...
# FROM
#	...
# WINDOW alias ()
# best to avoid - redundant WINDOW keyword

USE employees;

SELECT 
    emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
    salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);