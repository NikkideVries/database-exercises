-- 1. Open MySQL Workbench and login to the database server
show databases;

-- 2. Save your work in a file named db_tables_exercises.sql
-- 3. List all the databases

-- 4. Write the SQL code necessary to use the albums_db database
use albums_db;

-- 5. Show the currently selected database
select database();

-- 6. List all tables in the database
show Tables;
# There is only one table: albums

-- 7. Write the SQL code to switch to the employees database
use employees;

-- 8. Show the currently selected database
select database();

-- 9. List all tables in the database
show tables;
/* the tables are as follows: 
departments
dept_emp
dept_manager
employees
salaries
titles
*/

-- 10. Explore the employees table. What different data types are present in this table?
describe employees; 
#there are int, dates, varchar(14), Varchar(16), enum

describe departments;
describe dept_emp;
describe dept_manager;
describe salaries;
describe titles;

/* 
11. Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
 A: employees, dept_manager, dept_emp, salaries, titles
 - Employees has int for emp_no (employee number)
 - dept_manager has int for emp_no (employee number)
 - dept_emp has int for emp_no (employee number)
 - Salaries has int for emp_no and the salarie
 - titles has int for emp_no 

12. Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
A: employees, departments, dept_emp, dept_manager, titles
- Employess has varchar string for first and last name 
- Departments has varchar string for department name
- Dept_emp has a char string for dept_no 
- dept_manager has a char string for dept_no
- title has a varchar string for titles

13. Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
A: employees, dept_emp, dept_manager, salries, titles 
- Employees has a date column for birth dates ande hire dates
- Dept_emp has dates how long they have been working for (from_date - to_date)
- Dept_manager has dates for from_date and to_date
- salaries has dates for from_date and to_date  
- titles has dates for from_date and to_date 

14. What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
- The employees table and the departments table share a column with a primary key and they both have varchar types of strings.
- They are also both apart of the employees database.  
- elements of both tables are in the joiner table dept_emp. (emp_no and dept_no). The dept_emp table links employees and the departments. 

*/

--  Show the SQL code that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
show create table dept_manager;

/* CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1

*/


