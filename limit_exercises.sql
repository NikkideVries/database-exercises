Show Databases;
Use employees;
describe employees;

/* Question 2
List the first 10 distinct last name sorted in descending order.
*/

Select distinct
	last_name
From 
	employees
ORDER BY
	last_name DESC
Limit 10;
# The ten names are: Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker, Zuberek, Zschoche, Zongker

/* Question 3
Find all previous or current employees hired in the 90s and born on Christmas. 
Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. 
Write a comment in your code that lists the five names of the employees returned.
*/ 

SELECT 
	first_name,
    last_name,
    birth_date,
    hire_date
FROM 
	employees 
WHERE 
	hire_date like '199%' 
    AND birth_date LIKE '%-12-25'
ORDER BY 
	hire_date ASC
LIMIT 5;
/* The 5 names are:
Alselm Cappello,
Utz Mandell, 
Bouchung Schreiter,
Baocai  Kushner,
Petter Stroustrup
*/

/* Question 4
Try to think of your results as batches, sets, or pages. 
The first five results are your first page. 
The five after that would be your second page, etc. 
Update the query to find the tenth page of results.
*/

SELECT 
	first_name,
    last_name,
    birth_date,
    hire_date
FROM 
	employees 
WHERE 
	hire_date like '199%' 
    AND birth_date LIKE '%-12-25'
ORDER BY 
	hire_date ASC
LIMIT 5 Offset 45;

#Question 5 
#LIMIT and OFFSET can be used to create multiple pages of data. 
# What is the relationship between OFFSET (number of results to skip), 
# LIMIT (number of results per page), 
# and the page number?
# ANSWER: The offset number divided by the limit plus one the page number and the limit is the amount of text or data on the specific page.


