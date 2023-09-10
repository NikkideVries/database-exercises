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

/* Question 5.
Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code. */

SELECT distinct
	last_name 
FROM
	employees
WHERE
	last_name like '%q%' and last_name not like '%qu%';
    
/* Question 6 
Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.
*/

SELECT distinct Count(
	last_name)
FROM
	employees
WHERE
	last_name like '%q%' and last_name not like '%qu%';
    
/* Find all employees with first names 'Irena', 'Vidya', or 'Maya'. 
Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.
*/ 

SELECT COUNT( 
	first_name)
FROM
	employees
WHERE 
	first_name IN ('Irena', 'Vidya' , 'Maya');

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

/* Question 9




