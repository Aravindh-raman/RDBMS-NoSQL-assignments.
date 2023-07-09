/*Assignment_3 - Done using MySQL

1. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.*/

select department_name, sum(salary) as total_salary from employees e join departments d on e.department_id=d.department_id group by department_name order by total_salary;

/*2. Write the query to get the department, total no. employee of each department, total(sum) salary with respect to department from "Employee" table.*/

select department_name, count(employee_id), sum(salary) as total_salary from employees e join departments d on e.department_id=d.department_id group by department_name;

/*3. Get department wise maximum salary from "Employee" table order by salary ascending*/

select department_name, max(salary) as max_salary from employees e join departments d on e.department_id=d.department_id group by department_name order by max_salary;

/*4. Write a query to get the departments where average salary is more than 60k*/

select department_name, avg(salary) as avg_salary from employees e join departments d on e.department_id=d.department_id group by department_name having avg_salary > 60000;

/*5. Write down the query to fetch department name assign to more than one Employee.*/

select department_name from departments d join employees e on d.department_id=e.department_id group by department_name having count(*)>1;

/*6. Write a query to show department_name and assignedTo where assignedTo will be “One candidate” if its assigned to only one employee otherwise “Multiple candidates”*/

select department_name,
  case
    when (select count(*) from employees where employees.department_id = departments.department_id) = 1 
    then 'One candidate' else 'Multiple candidates'
  end as assignedTo from departments;
