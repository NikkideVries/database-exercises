USE employees;

-- 1. Copy the order by exercise and save it as functions_exercises.sql.

/* Question 2.
Write a query to find all employees whose last name starts and ends with 'E'. 
Use concat() to combine their first and last name together as a single column named full_name.
*/
SELECT 
	concat(first_name, ' ', last_name) as Employees_List
FROM
	employees
WHERE
	last_name like '%e';

/* Question 3
Convert the names produced in your last query to all uppercase.
*/ 

SELECT 
	concat(upper(first_name), ' ', upper(last_name)) as Employee_List
From
	employees
WHERE last_Name like '%e';

/* Question 4
Use a function to determine how many results were returned from your previous query.
*/

SELECT 	
	COUNT(concat(upper(first_name), ' ', upper(last_name))) as total_amount
FROM
	employees
WHERE
	last_name like '%e';
#the amount of results is 24292

/* Question 5
Find all employees hired in the 90s and born on Christmas. 
Use datediff() function to find how many days they have been working at the company 
(Hint: You will also need to use NOW() or CURDATE()),
*/

SELECT 
	datediff(now(), hire_date) as Days_Worked
FROM
	employees
WHERE
	hire_date like '199%' 
    AND birth_date LIKE '%-12-25';
    
/* Question 6
Find the smallest and largest current salary from the salaries table.
*/ 

SELECT 
	MIN(salary) as smallest_salary,
	MAX(salary) as largest_salary
FROM 
	salaries;
    
/* Question 7
Use your knowledge of built in SQL functions to generate a username for all of the employees. 
A username should be all lowercase, and consist of the first character of the employees first name, 
the first 4 characters of the employees last name, an underscore, the month the employee was born, 
and the last two digits of the year that they were born. 
*/

SELECT 
	concat(
		Lower(Substr(first_name, 1, 1))
        ,Lower(substr(last_name, 1, 4))
        ,' _ '
        ,substr(birth_date, 6, 2)
		,substr(birth_date, 3, 2)) as username
        ,first_name
        ,last_name
        ,birth_date
FROM
	employees;        


 

