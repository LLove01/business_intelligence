# Assign the same rank to records representing identical values by changing row_number to rank

USE employees;

# rank - counts each value seperately

SELECT emp_no, salary, rank() over w as rank_num
from salaries 
where emp_no = 11839 
window w as (partition by emp_no order by salary desc);

# Dense rank - counts each rank seperately
SELECT emp_no, salary, dense_rank() over w as rank_num
from salaries 
where emp_no = 11839 
window w as (partition by emp_no order by salary desc);