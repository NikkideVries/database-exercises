/* Question 1: Create a new file named group_by_exercises.sql */

/* Question 2.
In your script, use DISTINCT to find the unique titles in the titles table. 
How many unique titles have there ever been? Answer that in a comment in your SQL file.
*/

USE employees;
SELECT 
	COUNT(distinct (title))
From 
	titles;
# There are 7 distinct titles in the title table.

/* Question 3. 
Write a query to find a list of all unique last names that start and end with 'E' 
using GROUP BY.
*/ 

SELECT 
	distinct(last_name)
FROM
	employees
WHERE
	last_name like 'e%e'
GROUP BY
	last_name;

-- Insturctro versoin:

SELECT distinct
	last_name
FROM 
	employees
HAVING last_name like '%e' and last_name like 'e%';

/* Question 4.
Write a query to to find all unique combinations of first and last names of 
all employees whose last names start and end with 'E' */

SELECT distinct 
	first_name, 
    last_name
FROM
	employees
WHERE
	last_name like 'e%e';

-- instructor:

SELECT distinct
	first_name
    , last_name
From
	employees
Having 
	last_name like 'e%e'
Order BY 
	last_name;

/* Question 5.
Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code. */

SELECT distinct
	last_name 
FROM
	employees
WHERE
	last_name like '%q%' and last_name not like '%qu%';
    
# Names: 'Chleq', 'Lindqvist', 'Qiwen'

-- instructor:

SELECT distinct
	last_name 
FROM 
	employees
Having 
	last_name like '%q%' and last_name not like '%qu%';
    
/* Question 6 
Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.
*/

SELECT distinct 
	last_name,
    count(*)
FROM
	employees
WHERE
	last_name like '%q%' and last_name not like '%qu%'
GROUP by
	last_name;
    
    
-- Instructor:

SELECT distinct 
	last_name,
    count(*)
FROM
	employees
Group by 
	last_name
Having 
	last_name like '%q%' and last_name not like '%qu%';
    
/* Question 7. 
Find all employees with first names 'Irena', 'Vidya', or 'Maya'. 
Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.
*/ 

/* WRONG:
SELECT COUNT( 
	first_name)
FROM
	employees
WHERE 
	first_name IN ('Irena', 'Vidya' , 'Maya');
*/

SELECT 
	first_name,
    Count(*),
    gender
FROM 
	employees
WHERE
	first_name IN ('Irena', 'Vidya' , 'Maya')
GROUP BY
	first_name,
    gender;

/* Question 8
Using your query that generates a username for all employees, generate a count of employees with each unique username.
*/
 
 SELECT distinct (
 COUNT(Concat(
	lower(LEFT(first_name, 1)) 
    , lower(LEFT(last_name, 4)) 
    , ' _ '
	, DATE_FORMAT(birth_date, '%m%y')))) as username_count
	
FROM 
	employees;

-- Instructor:

SELECT
concat(
		Lower(Substr(first_name, 1, 1))
        ,Lower(substr(last_name, 1, 4))
        ,' _ '
        ,substr(birth_date, 6, 2)
		,substr(birth_date, 3, 2)) as username
        , Count(*)
FROM 
	employees
Group by
	username;




/* Question 9
From your previous query, are there any duplicate usernames? 
What is the highest number of times a username shows up? Bonus: How many duplicate usernames are there?
*/
 
SELECT 
	COUNT(Concat(
	lower(LEFT(first_name, 1)) 
    , lower(LEFT(last_name, 4)) 
    , ' _ '
	, DATE_FORMAT(birth_date, '%m%y'))) as username_count
    ,Concat(
	lower(LEFT(first_name, 1)) 
    , lower(LEFT(last_name, 4)) 
    , ' _ '
	, DATE_FORMAT(birth_date, '%m%y')) as username
FROM 
	employees
GROUP BY
	username
Having 
	(username_count) > 1
ORDER By
	username_count DESC;
	
    
-- Instructor: 
SELECT
concat(
		Lower(Substr(first_name, 1, 1))
        ,Lower(substr(last_name, 1, 4))
        ,' _ '
        ,substr(birth_date, 6, 2)
		,substr(birth_date, 3, 2)) as username
        , Count(*)
FROM 
	employees
Group by
	username
ORDER by
	count(*) DESC;
# There are duplicate usernames and the hightest time a username shows up is 6 times. 
	

SELECT 
	count(*)
FROM 
 (SELECT
	Concat(
	lower(LEFT(first_name, 1)) 
    , lower(LEFT(last_name, 4)) 
    , ' _ '
	, DATE_FORMAT(birth_date, '%m%y')) as username
    FROM
		employees
	Group by
		username
	Having 
		count(*) > 1
	Order by
		count(*) DESC) as bonus_question;
# There are 13251 duplicate usernames

/* Bonus Questions 
B1. Determine the historic average salary for each employee. 
When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
*/

SELECT 
	emp_no
    , avg(salary) as historic_average
FROM
	salaries
GROUP by
	emp_no;
    
-- INRUCTOR

SELECT
	avg(salary) as historic_average,
	emp_no
FROM
	salaries
GROUp by
	emp_no;

/* 
B2. Using the dept_emp table, count how many current employees work in each department. 
The query result should show 9 rows, one for each department and the employee count.
*/ 

/* WRONG
SELECT 
	Count(emp_no) as number_of_employees
    , dept_no
From
	dept_emp
Group by
	dept_no;
  */  
-- INSTRUCTOR

SELECT
	dept_no,
    count(distinct emp_no) as num_current_employees
FROM
	dept_emp
Where 
	to_date > now()
Group by
	dept_no;
    
/* 
3. Determine how many different salaries each employee has had. 
This includes both historic and current.
*/

SELECT 
	emp_no
    , count(distinct salary) as different_salary
FROM
	salaries
GROUP by
	emp_no;
	
-- Instructor: 

SELECT 
	emp_no,
    count(salary)
FROM 
	salaries
GROUP by
	emp_no;

        
/*
5. Find the maximum salary for each employee.
*/

SELECT 
	MAX(salary) as miximum_salary,
    emp_no
FROM
	salaries
GROUP by
	emp_no;
    
	
/*
6. Find the minimum salary for each employee.	
*/

SELECT
	MIN(salary) as minimum_salary,
    emp_no
FROM
	salaries
GROUP by
	emp_no;

/* 
7. Find the standard deviation of salaries for each employee.
*/ 

SELECT
	round(stddev(salary), 1) as standard_deviation
    , emp_no
    , count(*)
FROM
	salaries
GROUP by
	emp_no;
   
    
/*
8. Find the max salary for each employee where that max salary is greater than $150,000
*/

SELECT
	MAX(salary) as max_salary,
    emp_no
FROM
	salaries
GROUp by
	emp_no
having 
	max_salary > 150000;




/*
9.Find the average salary for each employee where that average salary is between $80k and $90k.
*/ 
	
SELECT
	AVG(salary) as avg_salary,
    emp_no
FROM
	salaries
GROUp by
	emp_no
having 
	avg_salary between 80000 and 90000;

