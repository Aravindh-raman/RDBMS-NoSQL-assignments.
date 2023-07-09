/*Assignment_4 - Done using MySQL

For the given schema, write SQL queries to perform the following:

1. From the following tables write a SQL query to find the details of an employee. Return full name, email, salary, Department Name, postal code, and City.*/

select concat(first_name," ",last_name) as full_name, email, salary, department_name, postal_code 
from employees e join departments d on e.department_id=d.department_id join locations l on d.location_id=l.location_id;

/*2. From the following tables write a SQL query to find the departments whose location is in "Jammu Kashmir" or "Jharkhand". Return Department Name, state_province,
street_address.*/

select department_name, state_province, street_address from departments d join locations l on d.location_id=l.location_id where state_province="Jammu Kashmir" or state_province="Jharkhand";

/*3. From the following tables write a SQL query to find the count of employees present in different jobs whose average salary is greater than 10,000. Return all the jobs with
employee count, Job Name, and average salary.*/

select count(employee_id), job_title, avg(salary) as avg_salary from employees e join jobs j on e.job_id=j.job_id group by job_title having avg_salary>10000;

/*4. From the following table write a SQL query to find all the first_names and last_names in both dependents and employees tables. Return the duplicate records as
well and order the records in descending order of the last_name column.*/

select e.first_name, e.last_name from employees e join dependents d on e.employee_id=d.employee_id order by last_name desc;

/*5. From the following table write a SQL query to list every employee that has a manager with the name of his or her manager.*/

select employee_id, first_name, last_name, manager_id, manager_name from employees e join departments d on e.department_id=d.department_id;

/*6. Find the departments that have more than 5 employees earning a salary greater than 50,000 and are located in either New York or California. Include the department name,
location, and the number of employees meeting the criteria.*/

select d.department_name, l.city as location, COUNT(*) as employee_count from departments d
join employees e on d.department_id = e.department_id
join locations l on d.location_id = l.location_id
where e.salary > 50000 and l.city in ('New York', 'California') group by d.department_name, l.city having COUNT(*) > 5;

/*7. List any employees who have dependents and have a job title that includes the word 'manager', and sort the results by department name in ascending order.*/

select e.employee_id, e.first_name, e.last_name, job_title, department_name from employees e 
join dependents dpen on e.employee_id=dpen.employee_id 
join jobs j on e.job_id=j.job_id 
join departments d on e.department_id=d.department_id
where job_title like "%manager%" order by department_name;

/*8. Add a column in the dependent table called “city” depicting their current location of stay. Find all employees who have been hired in the past 3 years and have dependents
living in a city that is different from the city they work in (if I work in Kolkata, then my dependent should not be in Kolkata). Additionally, only include employees whose salary 
is greater than the average salary of their job title(suppose, my job_title is ”developer” and the salary is 80k, and the average salary under the same job_title “developer” is 70k), 
and whose manager's job title includes the word 'director'. Finally, include the department name and location of each employee, and sort the results by department name in ascending order*/

ALTER TABLE dependents ADD city VARCHAR(50);

select e.employee_id, e.first_name, e.last_name, e.salary, dpt.department_name, l.city, e.manager_id from employees e join dependents d on e.employee_id = d.employee_id
join jobs j on e.job_id = j.job_id join departments dpt on e.department_id = dpt.department_id join locations l on dpt.location_id = l.location_id
where e.hire_date >= date_sub(curdate(), interval 3 year) and d.city != l.city and e.salary > (select avg(salary) from employees where job_id = e.job_id)
  AND EXISTS (SELECT * FROM employees m JOIN jobs mj ON m.job_id = mj.job_id WHERE m.employee_id = e.manager_id AND mj.job_title LIKE '%director%')
ORDER BY dpt.department_name ASC;
