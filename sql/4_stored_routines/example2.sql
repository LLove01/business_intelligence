# Create a procedure that will provide the average salary of all employees.
# Then, call the procedure.

DELIMITER $$

CREATE PROCEDURE avg_salary()
BEGIN
	SELECT
		AVG(salary)
	FROM
		salaries;
END$$

DELIMITER ;

CALL avg_salary;
CALL avg_salary();
CALL employees.avg_salary;
CALL employees.avg_salary();