SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING count(first_name) > 250
ORDER BY first_name;
    
# order of operations: 
# SELECT 
# WHERE (cannot use aggregate funcions within its conditions)
# GROUP BY
# HAVING 
# ORDER BY