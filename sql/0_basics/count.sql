SELECT 
    COUNT(emp_no)
FROM
    employees;
    
# select without duplicates
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;

