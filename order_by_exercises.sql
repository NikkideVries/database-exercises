USE employees;

-- 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

/* Question 2.
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?
*/

SElECT 
    first_name,
    last_name
FROM 
	employees
WHERE 
	first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY 
	first_name ASC;
# The first row is Irena Reutenauer and the last row is Vidya Simmen

/* Question 3. 
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?
*/
SELECT 
    first_name,
    last_name
FROM
	employees
WHERE
	(first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya')
ORDER BY 
	first_name ASC, last_name ASC;
# The first row is Irena  Acton and the last row is Vidya Zweizig
	
/* Question 4. 
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?
*/

SELECT
	last_name,
    first_name
FROM
	employees
WHERE
	first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya'
ORDER BY
	last_name ASC;
# The first row is Irena Acton and the last row is Maya Zyda 

/* Question 5
Write a query to find all employees whose last name starts and ends with 'E'. 
Sort the results by their employee number. 
Enter a comment with the number of employees returned, 
the first employee number and their first and last name, 
and the last employee number with their first and last name.
*/

SELECT
	last_name,
    first_name,
    emp_no
FROM 
	employees
WHERE 
	last_name Like 'E%E'
ORDER By 
	emp_no ASC;
# There were 899 rows returned. The first employee is Erde Ramzi and the last employee is Erde Tadahiro. 
	

/* Question 6.
Write a query to find all employees whose last name starts and ends with 'E'. 
Sort the results by their hire date, so that the newest employees are listed first. 
Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
*/

SELECT 
	last_name
FROM
	employees
WHERE 
	last_name Like 'e%e'
Order By
	hire_date DESC;
# the number of employees retuned was 899. The last name of the newest employee is eldridge and the newest employee Erde.

/* Question 7
Find all employees hired in the 90s and born on Christmas. 
Sort the results so that the oldest employee who was hired last is the first result. 
Enter a comment with the number of employees returned, 
the name of the oldest employee who was hired last, 
and the name of the youngest employee who was hired first.
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
ORDER by
	birth_date ASC, hire_date DESC;
# the number of results is 362. 
# The oldest employee who was hired last is Khun Bernini and the youngest employee who was hire first is Douadi Pettis.







