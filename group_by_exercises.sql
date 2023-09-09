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
