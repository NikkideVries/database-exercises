/* Question 1
Find all the current employees with the same hire date as employee 101010 using a subquery 
*/
USE employees;
-- Subquery
SELECT hire_date
FROM employees
WHERE emp_no IN ('101010');

-- Query
SELECT 
	e.emp_no
    , concat(e.first_name, ' ',e.last_name) as "Name"
    , e.hire_date
    -- ,de.to_date to double check that the dates are current
FROM 
	employees as e
Inner Join
	dept_emp as de
		using(emp_no) 
WHERE 
	e.hire_date = 
    ( SELECT hire_date
FROM employees
WHERE emp_no IN ('101010')
) 
and de.to_date > curdate()
;

/* Question 2
Find all the titles ever held by all current employees with the first name Aamod.
*/

-- Subquery
Select 
	first_name
From 
	employees
Where 
	first_name IN ('Aamod');

-- Query
SELECT 
	titles.title
    , employees.first_name
    , count(employees.first_name) as number_of_Aamods
From 
	titles
JOIN 
	employees
		using(emp_no)
JOIN 
	dept_emp
		using(emp_no)
WHERE first_name IN 
( Select 
	first_name
From 
	employees
Where 
	first_name IN ('Aamod')
)
and dept_emp.to_date > curdate()
Group by
	titles.title;


/* Question 3
How many people in the employees table are no longer working for the company? 
Give the answer in a comment in your code.
*/

-- subquery
SELECT emp_no
FROM dept_emp
WHERE to_date < curdate();

-- Query
SELECT 
	count(emp_no) as number_of_employees
FROM 
	employees
WHERE 
	emp_no IN
(SELECT emp_no
FROM dept_emp
WHERE to_date < curdate()
);
-- the nubmer of employees no longer working are 85,108

/* Question 4
Find all the current department managers that are female. 
List their names in a comment in your code.
*/

-- Subquery
SELECT 
	concat(first_name, ' ', last_name) as "Name"
FROM employees
WHERE gender IN ('f');

-- Query

SELECT 
	concat(e.first_name, ' ', e.last_name) as current_dm_females
    , d.dept_name 
FROM
	dept_manager as dm
JOIN 
	employees as e
		using(emp_no)
JOIN 
	departments as d
		using(dept_no)
WHERE
	dm.to_date > curdate()
    and concat(first_name, ' ', last_name) IN (SELECT 
	concat(first_name, ' ', last_name) as "Name"
FROM employees
WHERE gender IN ('f')
) 
;
-- The current female managers are: Finance, Human Resources, Development, Reaserach

/* Question 5
Find all the employees who currently have a higher salary than the companies overall, 
historical average salary.
*/

-- subquery for current employees
SELECT 
	emp_no
FROM 
	dept_emp
WHERE 
	to_date > curdate();

-- subquery for highest hitorical average salary
SELECT
	avg(salary)
FROM
	salaries;
    
-- QUERY

SELECT
	concat(e.first_name, ' ', e.last_name) as "Name"
    , e.emp_no
    , avg(s.salary) "average salary"
FROM
	employees as e
JOIN 
	dept_emp as de
		using(emp_no)
Join 
	salaries as s
		using(emp_no)
WHERE
	de.emp_no IN 
( SELECT 
	emp_no
FROM 
	dept_emp
WHERE 
	to_date > curdate()
) 
and s.salary > 
( SELECT
	avg(salary)
FROM
	salaries
)
Group by
	e.emp_no;



/* Question 6
How many current salaries are within 1 standard deviation of the current highest salary? 
(Hint: you can use a built in function to calculate the standard deviation.) 
What percentage of all salaries is this?
Hint: You will likely use multiple subqueries in a variety of ways
Hint: It's a good practice to write out all of the small queries that you can. 
Add a comment above the query showing the number of rows returned. 
You will use this number (or the query that produced it) in other, larger queries.
*/ 

-- Subquery 1: current highest salary

SELECT
	MAX(salary)
FROM
	salaries
WHERE 
	to_date > curdate();

-- subquery 2: standard deviation
 
SELECT
	stddev(salary)
FROM
	salaries
WHERE 
	to_date > curdate();

-- query 1 standard deviation from the hightest salary
SELECT
	MAX(salary) - stddev(salary) as "one std"
FROM 
	salaries
WHERE to_date > curdate();

-- counts current salaries on standard deviation away

SELECT 
	count(salary) AS number_of_salaries
FROM 
	salaries 
WHERE 
	to_date > now()
AND salary >= 
(
SELECT
	MAX(salary) - stddev(salary) as "one std"
FROM 
	salaries
WHERE to_date > curdate()
);
	
-- There are 83 salaries that are withing one standard deviation from the max salary.

-- Query to find percentages:
SELECT 
((SELECT 
	count(salary) AS number_of_salaries
FROM 
	salaries 
WHERE 
	to_date > now()
AND salary >= 
(
SELECT
	MAX(salary) - stddev(salary) as "one std"
FROM 
	salaries
WHERE to_date > curdate()
))
/ -- divide 83 by total number of salaries that are current. 
(
SELECT
 count(salary)
FROM 
	salaries
 Where 
	to_date > curdate()
) 
 * 100) as percentage ; -- times 100 makes it a percentage;

-- the percentage is 0.0436% of salaries are 1 standard deviation from the max salary.

/* Bonus Questions
B1: Find all the department names that currently have female managers.
*/



/*
B2:Find the first and last name of the employee with the highest salary.
*/
/*
B3: Find the department name that the employee with the highest salary works in.
*/
/*
B4:Who is the highest paid employee within each department.
*/ 