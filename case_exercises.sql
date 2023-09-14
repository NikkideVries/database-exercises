/* Question 1
Write a query that returns all employees, their department number, their start date, their end date, 
and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. 
DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.
*/

USE 
	employees;

SELECT
	concat(first_name,' ',last_name) as full_name
    , dept_no
    , from_date
    , to_date
	, IF (to_date > curdate(), true, false) as is_current_employee
FROM
	dept_emp
Join
	employees as e
		using(emp_no)
;

/* Question 2
Write a query that returns all employee names (previous and current), and a new column 'alpha_group' 
that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
*/

SELECT 
	concat(last_name, ', ', first_name) as 'Name'
    , CASE
		WHEN Left(last_name,1) >= 'A' and Left(last_name,1) <= 'H' THEN 'A-H'
        WHEN Left(last_name,1) >= 'I' and Left(last_name,1) <= 'Q' THEN 'I-Q'
	    WHEN LEFT(last_name,1) >= 'R' and Left(last_name,1) <= 'Z' THEN 'R-Z'
	Else 'not a name'
	END as alpha_group
FROM 
	employees
;
-- review:
SELECT 
	concat(last_name, ', ', first_name) as 'Name'
    , CASE
		WHEN Left(last_name,1) <= 'H' THEN 'A-H'
        WHEN Left(last_name,1) <= 'Q' THEN 'I-Q'
	    ELSE 'R-Z'
	END as alpha_group
FROM 
	employees
;



/* Question 3 
How many employees (current or previous) were born in each decade?
*/

-- to find the century to start at
SELECT
	Min(birth_date), max(birth_date)
FROM
	employees;
-- query

SElECT
     count(*)
    , CASE
		WHEN birth_date between '1950-01-01' and '1959-12-31' THEN '1950''s'
        WHEN birth_date between '1960-01-01' and '1969-12-31' THEN '1960''s'
        -- WHEN birth_date between '1970-01-01' and '1979-12-31' THEN '1970''s'
        -- WHEN birth_date between '1980-01-01' and '1989-12-31' THEN '1980''s'
        -- WHEN birth_date between '1990-01-01' and '1999-12-31' THEN '1990''s'
	END as birth_century
From
	employees
Group by
	birth_century
;

-- Review:

SElECT
	count(*)
    , CASE
		WHEN birth_date like '195%' THEN '50s'
        Else '60s'
	END as birth_century
From
	employees
GROUP by
	birth_century
;


/* Question 4
What is the current average salary for each of the following department groups: 
R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
*/

/* WRONG
SELECT
	d.dept_name
    , avg(salary) as average_salary
FROM
	salaries as s
Left join
	dept_emp as de 
		using(emp_no)
Join
	departments as d
		using(dept_no)
WHERE 
	s.to_date > curdate()
Group by
	d.dept_name;
    
Select
	case 
		when dept_name IN ('Sales','Marketing') THEN sum(average_salary)
	END 
FROM
(
SELECT
	d.dept_name
    , avg(salary) as average_salary
FROM
	salaries as s
Left join
	dept_emp as de 
		using(emp_no)
Join
	departments as d
		using(dept_no)
WHERE 
	s.to_date > curdate()
Group by
	d.dept_name
) as average_salary_table
Group by
	dept_name;
*/



select 
*
from
departments;

SELECT 
	case
		WHEN dept_name IN ('Sales', 'Marketing') Then 'Sales & Marketing'
        WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
        WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
       --  WHEN dept_name IN ('Customer Service') THEN 'Customer Service'
       Else dept_name
	END as dept_group
    ,round(avg(s.salary),2) as average_salary
FROM
	departments as d
Join
	dept_emp as de
		using(dept_no)
Join 
	salaries as s
		using(emp_no)
Where 
	s.to_date > curdate()
    and de.to_date > curdate()
Group by
	dept_group
Order by 
	dept_group
;
    





/* Bonus Question
Remove duplicate employees from exercise 1.
*/ 

SELECT
	concat(first_name,' ',last_name) as full_name
    , dept_no
    , from_date
    , to_date
	, IF (to_date > curdate(), true, false) as is_current_employee
FROM
	dept_emp
Join
	employees as e
		using(emp_no)
;
