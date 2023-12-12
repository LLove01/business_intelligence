# select
# 	...
# 	ROW_NUMBER() OVER() AS ...
# FROM
# ...

# OVER clause
# none = empty OVER clause 	... evaluations on all query rows
# partition by 				... data will be organized into partitions


USE employees;

# empty OVER CLAUSE
SELECT 
    emp_no, salary, ROW_NUMBER() OVER() AS row_num
FROM
    salaries;
    
# partition by OVER CLAUSE
SELECT 
    emp_no, salary, ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM
    salaries;