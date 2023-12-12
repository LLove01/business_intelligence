# AND - both conditions must apply 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'F';
    
# OR - at least one must apply 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' or  first_name = 'Elvis';
    
# AND > OR - operator precedence
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' and ( gender = 'M' or gender = 'F');
