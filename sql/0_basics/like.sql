# LIKE - for patterns 
# % - a substitute for a sequence of characters
# _ - a substitute for one character

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_')
        OR first_name LIKE ('%ar');