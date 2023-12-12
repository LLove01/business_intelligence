# Combine Information from employees and dept_manager tables.

# From the employees table, select employees whose last name is 'Denis'.
# Include their employee number (emp_no), first name (first_name), and last name (last_name).
# Do not include their department information (set dept_no and from_date as NULL).

# From the dept_manager table, select the department number (dept_no) and the start date of their management role (from_date).
# Do not include personal details of the department managers (set emp_no, first_name, and last_name as NULL).

# Merge the results from both tables into a single list.
# Ensure that the structure of the combined result set includes the following columns: emp_no, first_name, last_name, dept_no, from_date.
# Order the final result set by the employee number (emp_no) in descending order. 

SELECT
    *
FROM
    (SELECT
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) as a
ORDER BY a.emp_no DESC;