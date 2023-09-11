/* Question 1
Use the join_example_db. Select all the records from both the users and roles tables.
*/

USE join_example_db;
Describe users;
Describe roles;

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

	



