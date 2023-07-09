/*Assignment_5 - Done using MySQL

1. Find all the departments where the minimum salary is less than 2000.*/

SELECT department_name FROM departments d JOIN employees e ON d.department_id = e.department_id GROUP BY department_name HAVING MIN(e.min_salary) < 2000;

/*2. Find all the countries where no employees exist.countries*/

SELECT c.country_id, c.country_name FROM countries c 
LEFT JOIN locations l ON c.country_id = l.country_id
LEFT JOIN departments d ON l.location_id = d.location_id
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

/*3. From the following tables write a query to find all the jobs, having at least 2 employees in a single department.(don’t use joins)*/

SELECT job_id, job_title FROM jobs j WHERE EXISTS (SELECT department_id FROM employees e WHERE e.job_id = j.job_id GROUP BY department_id HAVING COUNT(*) >= 2);

/*4. From the following tables write a query to find all the countries, having cities with all the city names starting with 'a'.(don’t use joins)*/

SELECT country_id, country_name FROM countries c WHERE EXISTS (SELECT * FROM locations l WHERE l.country_id = c.country_id AND city NOT LIKE 'a%');

/*5. From the following tables write a query to find all the departments, having no cities.*/

SELECT department_id, department_name FROM departments d WHERE NOT EXISTS (SELECT * FROM locations l WHERE l.location_id = d.location_id);

