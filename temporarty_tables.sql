/*Quesetion 1
Using the example from the lesson, create a temporary table called employees_with_departments that contains 
first_name, last_name, and dept_name for employees currently with that department. 
Be absolutely sure to create this table on your own database. 
If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database 
that you can only read. */


USE tobias_2305;
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT
	first_name, last_name, dept_name
FROM 
	employees.employees
JOIN
	employees.dept_emp
		using(emp_no)
JOIN 
	employees.departments
		using(dept_no)
WHERE 
	to_date > now();

-- to make sure the table exists
Select 
*
from
employees_with_departments;

/* QA
Add a column named full_name to this table. It should be a VARCHAR whose 
length is the sum of the lengths of the first name and last name columns. */
-- To find the specific length of first_name and last_name

SELECT MAX(
	length(concat(first_name, ' ', last_name)))
FROM
	employees_with_departments;


ALTER TABLE employees_with_departments ADD full_name varchar(30);

-- make sure the column is added
select
*
from
employees_with_departments;


/* QB
Update the table so that the full_name column contains the correct data */

UPDATE employees_with_departments
SET full_name = concat(first_name, ' ', last_name);

-- make sure the column is added
SELECT 
*
FROM
employees_with_departments;

/* QC
Remove the first_name and last_name columns from the table.
*/

ALTER TABLE employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name ;

-- make sure the column's are dropped

SELECT
*
FROM
employees_with_departments;


-- an easier way is just to pull the full names all togther in the select statment so you dont have to add new columns
/* QD
What is another way you could have ended up with this same table?
You can preprocess the table in employees before pulling the information into your new table */

/* Question 2:
Create a temporary table based on the payment table from the sakila database.
Write the SQL necessary to transform the amount column such that it is stored as an 
integer representing the number of cents of the payment. 
For example, 1.99 should become 199. */

CREATE TEMPORARY TABLE sakila_payments
SELECT 
	*
FROM
	sakila.payment;
	
-- make sure the table exists:

SELECT
*
FROM
sakila_payments;

-- transform the amount column

ALTER TABLE sakila_payments ADD amount_in_cents int;

UPDATE sakila_payments 
SET amount_in_cents = (amount * 100);

ALTER TABLE sakila_payments DROP COLUMN amount;

-- make sure it worked
Select 
*
FROM
sakila_payments;



/* Question 3: 
Go back to the employees database. 
Find out how the current average pay in each department compares to the overall current pay for 
everyone at the company. For this comparison, you will calculate the z-score for each salary. 
In terms of salary, what is the best department right now to work for? The worst? */

Use tobias_2305;
CREATE TEMPORARY TABLE zscore_by_dept
SELECT
    d.dept_name AS department
    -- avereage salary
    ,ROUND(AVG(s.salary),2) AS department_avg_pay
	-- make sure average salary is from current employees/salaries
    ,(SELECT ROUND(AVG(salary),2) FROM employees.salaries WHERE to_date > NOW()) AS company_avg_pay
    -- calculate the z-score for current salaries
    ,(AVG(s.salary) - (SELECT AVG(salary) FROM employees.salaries WHERE to_date > NOW())) / STDDEV(s.salary) AS z_score
FROM employees.departments d
    JOIN employees.dept_emp de ON d.dept_no = de.dept_no AND de.to_date > NOW()
    JOIN employees.salaries s ON de.emp_no = s.emp_no AND s.to_date > NOW()
GROUP BY d.dept_name
ORDER BY z_score DESC;

Select * from zscore_by_dept order by z_score DESC;

-- Sales is the best department, human resource is the worst 

    


