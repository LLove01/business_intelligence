USE employees;

DROP PROCEDURE IF EXISTS select_employees;
DELIMITER //
CREATE PROCEDURE select_employees()
BEGIN 
	SELECT * FROM employees
    LIMIT 1000;
END// 

DELIMITER ;

# routine call
call employees.select_employees();