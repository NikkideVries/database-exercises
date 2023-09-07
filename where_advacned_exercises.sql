USE employees;
SELECT database();
SHOW tables;
Describe employees;
SELECT * FROM employees;

-- 1. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
SELECT 
	emp_no,
    first_name
FROM 
	employees
WHERE 
	first_name IN ('Irena', 'Vidya', 'Maya');
# the employee numers are 10200, 10397, 10610

-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
-- What is the employee number of the top three results? Does it match the previous question?
SELECT 
	emp_no,
    first_name
FROM
	employees
WHERE
	first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';
# The employee numers are 10200, 10397, and 1061. They do match the previous question. 
	
-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
-- What is the employee number of the top three results.
SELECT
	first_name,
    emp_no,
    gender
FROM
	employees
WHERE
	first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya' AND 'M';

-- 4. Find all unique last names that start with 'E'.
SELECT 
	last_name
FROM 
	employees
WHERE 
	last_name Like 'E%';

-- 5. Find all unique last names that start or end with 'E'.
SELECT 
	last_name
FROM
	employees
WHERE 
	last_name LIKE '%E';

-- 6. Find all unique last names that end with E, but does not start with E?
SELECT 
	last_name
FROM 
	employees
WHERE 
	last_name LIKE '%E' and last_name NOT LIKE 'E%';

-- 7. Find all unique last names that start and end with 'E'.
SELECT 
	last_name
FROM
	employees
WHERE
	last_name Like '%E' and last_name LIKE 'E%';

-- 8. Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
SELECT
	emp_no,
    hire_date
FROM 
	employees
WHERE 
	hire_date Between '1990-01-01' and '1999-12-31';
#The top three employee numbers are 10008,10011,10012.

-- 9. Find all current or previous employees born on Christmas. 
-- Enter a comment with top three employee numbers.
SELECT 
	emp_no,
    birth_date
FROM 
	employees
WHERE 
	birth_date LIKE '%-12-25';
#The employees born on christmas are 10078, 10115, 10261

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. 
-- Enter a comment with top three employee numbers.
SELECT 
	emp_no,
    birth_date,
    hire_date
FROM
	employees
WHERE 
	hire_date Between '1990-01-01' and '1999-12-31' and birth_date LIKE '%-12-25';

-- 11. Find all unique last names that have a 'q' in their last name.
SELECT
	last_name
FROM
	employees
WHERE 
	last_name Like '%q%';

-- 12. Find all unique last names that have a 'q' in their last name but not 'qu'.
SELECT
	last_name
FROM
	employees
WHERE last_name LIKE '%q%' and last_name not like '%qu%';
