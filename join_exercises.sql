/* Question 1
Use the join_example_db. Select all the records from both the users and roles tables.
*/

USE join_example_db;
Describe users;
Describe roles;
SELECT * From users;
SELECT * From roles;
-- CMD+shift+return; creates multipe tabs to view. make sure to HIGHLIGHT the ones you want. 

/* Question 2
Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
Before you run each query, guess the expected number of results.
*/

-- Join

SELECT 
	b.id as roles_id
    , b.`name` as role_name 
    ,email
    ,role_id
FROM 
	users as a
Inner JOIN 
	roles as b
		on a.role_id = b.id;

-- Left Join

SELECT 
	b.id as roles_id
    , b.`name` as role_name 
    ,email
    ,role_id
FROM 
	users as a
Left  JOIN 
	roles as b
		on a.role_id = b.id;
 
 -- Right Join
 
 SELECT 
	b.id as roles_id
    , b.`name` as role_name 
    ,email
    ,role_id
FROM 
	users as a
Right JOIN 
	roles as b
		on a.role_id = b.id;
 
	
/* Question 3
Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
Hint: You will also need to use group by in the query.
*/ 

SELECT 
	r.name
    , count(u.name) as number_of_users
From 
	users as u
-- 
Right Join 
	roles as r
		on r.id = u.role_id
Group by
	`name`;
    
-- Review: 
    
-- Employees Database:
/* Question 1:
Use the employees database.
*/
Use employees;
SELECT * FROM dept_emp;
SELECT * From dept_manager;
SELECT * FROM employees;
SELECT * FROM departments;

/* Question 2: 
Using the example in the Associative Table Joins section as a guide, 
write a query that shows each department along with the name of the current manager for that department.
*/

SELECT 
-- do select star to make sure that everything flows and the table is pulling everything that you want. 
	dept_name as "Department Name" 
    , concat(employees.first_name, ' ', employees.last_name) as "Department Manager"
FROM 
	departments
Inner Join 
	dept_manager
		on departments.dept_no = dept_manager.dept_no
Inner Join 
	employees
		on employees.emp_no = dept_manager.emp_no
WHERE
	dept_manager.to_date > curdate()
order by
	dept_name;

/* Question 3
Find the name of all departments currently managed by women.
*/

SELECT 
	dept_name as "Department Name"
    , concat(employees.first_name, ' ', employees.last_name) as "Manager Name"
FROM
	departments
Inner Join 
	dept_manager
		on departments.dept_no = dept_manager.dept_no
Inner Join 
	employees
		on employees.emp_no = dept_manager.emp_no
WHERE 
	employees.gender = 'F'
    and dept_manager.to_date > curdate()
Order by
	dept_name;
    
/* Question 4
Find the current titles of employees currently working in the Customer Service department.
*/

SELECT 
	title
    , count(title) as "Count"
From 
	titles 
Inner Join
	employees as emp
		on emp.emp_no = titles.emp_no
Inner join
	dept_emp
		on dept_emp.emp_no = emp.emp_no
Inner Join 
	departments
		on departments.dept_no = dept_emp.dept_no
WHERE
	dept_emp.to_date > curdate()
    and departments.dept_name Like 'Customer Service'
	and titles.to_date > curdate()
Group by
	title
-- Found the count of the group of employee titles. All the titles have to be grouped: examples all the assitant engineers.
Order by
	title;
    
    
/* Question 5
Find the current salary of all current managers
*/

SELECT 
	dept_name as "Department Name"
    , concat(employees.first_name, ' ', employees.last_name) as "Name"
    , salary as "Salary"
From
	salaries
Inner JOIN
	employees
		on salaries.emp_no = employees.emp_no
INNER JOIN
	dept_manager
		on employees.emp_no = dept_manager.emp_no
Inner JOIN
	departments
		on dept_manager.dept_no = departments.dept_no
WHERE
	salaries.to_date > curdate()
    and dept_manager.to_date > curdate()
Order by 
	dept_name;

/* Question 6:
Find the number of current employees in each department.
*/

SELECT
	departments.dept_no
    , departments.dept_name
    , count(dept_emp.emp_no) as num_employees
FROM
	dept_emp
INNER JOIN
	departments
		on dept_emp.dept_no = departments.dept_no
WHERE 
	dept_emp.to_date > curdate()
Group by
	dept_name
Order by
	dept_no;

-- review    


SELECT
	d.dept_no
    ,d.dept_name
    ,count(*) as num_employees
FROM 
	dept_emp as de
-- start with all observations from DE table and matching depts observations
LEFT JOIN
	departments as d
		on d.dept_no = de.dept_no
WHERE 
	de.to_date > curdate()
GROUP by
	dept_name
ORder by 
	dept_no; 
/* Question 7
Which department has the highest average salary? Hint: Use current not historic information.
*/

SELECT 
	departments.dept_name
	, AVG(salaries.salary) as average_salary
FROM 
	salaries
INNER JOIN
	employees
		on salaries.emp_no = employees.emp_no
INNER Join
	dept_emp
		on employees.emp_no = dept_emp.emp_no
INNER join
	departments
		on dept_emp.dept_no = departments.dept_no
WHERE
	salaries.to_date > curdate()
    and dept_emp.to_date > curdate()
GROUP by
	dept_name
ORDER BY
	average_salary DESC
Limit 1;


-- Review:

SELECT 
	d.dept_name
	, AVG(s.salary) as average_salary

FROM
	salaries as s
-- Left join beacuse we want to keep all salaries observatons
INNER JOIN
	dept_emp as de
		on s.emp_no = de.emp_no
INNER JOIN 
	departments as d
		on d.dept_no = de.dept_no
WHERE
	s.to_date > curdate()
    and de.to_date > curdate()
Group by
	d.dept_name
Order By
	average_salary DESC
Limit 1;


		

/* Question 8
Who is the highest paid employee in the Marketing department?
*/

SELECT
	first_name ,
	last_name 
From 
	employees
INNER JOIN
	salaries
		on employees.emp_no = salaries.emp_no
INNER JOIN
	dept_emp
		on salaries.emp_no = dept_emp.emp_no
INNER JOIN
	departments
		on dept_emp.dept_no = departments.dept_no
WHERE 
	departments.dept_name like 'market%'
    and salaries.to_date > curdate()
    and dept_emp.to_date > curdate()
ORDER BY
	salaries.salary desc
Limit 1;
    
/* Question 9
Which current department manager has the highest salary?
*/

SELECT 
	first_name,
    last_name,
    salary,
    dept_name 
FROM
	employees
INNER JOIN
	salaries
		on employees.emp_no = salaries.emp_no
INNER Join
	dept_manager
		on salaries.emp_no = dept_manager.emp_no
INNER JOIN
	departments
		on dept_manager.dept_no = departments.dept_no
WHERE 
	dept_manager.to_date > curdate()
Order by 
	salary DESC
Limit 1;

-- Review
SELECT 
	first_name,
    last_name,
    salary,
    dept_name 
FROM
	employees
LEFT JOIN
	salaries
		on employees.emp_no = salaries.emp_no
LEFT Join
	dept_manager
		on salaries.emp_no = dept_manager.emp_no
LEFT JOIN
	departments
		on dept_manager.dept_no = departments.dept_no
WHERE 
	dept_manager.to_date > curdate()
Order by 
	salary DESC
Limit 1;
		
/* Question 10
Determine the average salary for each department. Use all salary information and round your results.
*/ 

SELECT 
	dept_name,
    ROUND(AVG(salaries.salary)) as average_salary
FROM 
	salaries
INNER JOIN
	dept_emp
		on salaries.emp_no = dept_emp.emp_no
INNER JOIN
	departments
		on dept_emp.dept_no = departments.dept_no
GROUP by
	dept_name
ORDER by 
	average_salary DESC;
    
/* BONUS Question 11 */
    
SELECT 
	concat(e1.first_name, ' ', e1.last_name) as "Employee Name"
	, concat(e2.first_name, ' ', e2.last_name) as "Manager Name"
	, dept_name as "Department Name"
From 
	employees as e1
INNER JOIN
	dept_emp as de
		on e1.emp_no = de.emp_no
INNER JOIN
	departments as d1
		on de.dept_no = d1.dept_no
INNER JOIN
	dept_manager as dm
		on d1.dept_no = dm.dept_no
INNER JOIN
	employees as e2 
		on dm.emp_no = e2.emp_no
WHERE
	 de.to_date > curdate()
    and dm.to_date > curdate()
    and dept_name like 'Cus%'
;



/* Bouns Querys that were brute force */

-- QUERY 1
SELECT 
	concat(first_name, ' ', last_name) as "Employee Name"
    , dept_name as "Department Name"
FROM 
	employees
INNER JOIN
	dept_emp 
		using(emp_no)
INNER JOIN
	departments
		using(dept_no)
WHERE
	dept_emp.to_date > curdate()
Order by 
	dept_name ASC
LIMIT 1;
    
-- QUERY 2
SELECT 
	concat(first_name, ' ', last_name) as "Manager Name"
FROM 
	employees
INNER JOIN
	dept_manager
		using(emp_no)
INNER JOIN
	departments 
		using(dept_no)
WHERE
	dept_manager.to_date > curdate()
ORDER by
	concat(first_name, ' ', last_name) DESC;
    
    
-- QUERY 3
SELECT 
	concat(first_name, ' ', last_name) as "Employee Name"
    , dept_name as "Department Name"
    , (SELECT 
	concat(first_name, ' ', last_name) as "Manager Name"
FROM 
	employees
INNER JOIN
	dept_manager
		using(emp_no)
INNER JOIN
	departments 
		using(dept_no)
WHERE
	dept_manager.to_date > curdate()
ORDER by
	concat(first_name, ' ', last_name) DESC
    Limit 1) as "Manaager Name"
FROM 
	employees
INNER JOIN
	dept_emp 
		using(emp_no)
INNER JOIN
	departments
		using(dept_no)
WHERE
	dept_emp.to_date > curdate()
Order by 
	dept_name ASC
LIMIT 1;
	
		
	
	
	
	



