# PARTITION BY 
# does not reduce number of results
# affects how the window function result will be obtained
# only used within the context of applying window functions

# GROUP BY 
# reduces results
# affects how the window function result will be obtained


# 1: Find out the lowest salary value each employee has ever signed a contract for. To obtain the desired output, use a subquery containing a window function, as well as a window specification introduced with the help of the WINDOW keyword.
SELECT a.emp_no,
       MIN(salary) AS min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
GROUP BY emp_no;


# 2: Again, find out the lowest salary value each employee has ever signed a contract for. Once again, to obtain the desired output, use a subquery containing a window function. This time, however, introduce the window specification in the field list of the given subquery.
SELECT a.emp_no,
       MIN(salary) AS min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary) AS row_num
FROM
salaries) a
GROUP BY emp_no;


# 3: Once again, find out the lowest salary value each employee has ever signed a contract for. This time, to obtain the desired output, avoid using a window function. Just use an aggregate function and a subquery.
SELECT
    a.emp_no, MIN(salary) AS min_salary
FROM
    (SELECT
        emp_no, salary
    FROM
        salaries) a
GROUP BY emp_no;


# 4: Once more, find out the lowest salary value each employee has ever signed a contract for. To obtain the desired output, use a subquery containing a window function, as well as a window specification introduced with the help of the WINDOW keyword. Moreover, obtain the output without using a GROUP BY clause in the outer query.
SELECT a.emp_no,
a.salary as min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
WHERE a.row_num=1;


# 5: Find out the second-lowest salary value each employee has ever signed a contract for. To obtain the desired output, use a subquery containing a window function, as well as a window specification introduced with the help of the WINDOW keyword. Moreover, obtain the desired result set without using a GROUP BY clause in the outer query.
SELECT a.emp_no,
a.salary as min_salary FROM (
SELECT
emp_no, salary, ROW_NUMBER() OVER w AS row_num
FROM
salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a
WHERE a.row_num=2;
