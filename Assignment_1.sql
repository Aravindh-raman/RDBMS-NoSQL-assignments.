/*Assignment_1 - Done using MySQL 


1. Create the following schema
*/ 
create table jobs (job_id varchar(10) primary key, job_title varchar(50), min_salary int, max_salary int);

ALTER TABLE jobs ADD CONSTRAINT chk_minimum_salary CHECK (min_salary > 1000);

create table employees (employee_id varchar(10) primary key, first_name varchar(25), last_name varchar(25), email varchar(50), phone_number int(10), hire_date date, 
job_id varchar(10), salary int(10), manager_id varchar(10), department_id varchar(10));

ALTER TABLE employees MODIFY first_name varchar(25) NOT NULL, Modify last_name varchar(25) NOT NULL;

ALTER TABLE employees ADD FOREIGN KEY (job_id) REFERENCES jobs (job_id);

create table dependents (dependent_id varchar(10) primary key, first_name varchar(25), last_name varchar(25), relationship varchar(20), employee_id varchar(10));

ALTER TABLE dependents MODIFY first_name varchar(25) NOT NULL, Modify last_name varchar(25) NOT NULL;

ALTER TABLE dependents ADD FOREIGN KEY (employee_id) REFERENCES employees (employee_id);

create table departments (department_id varchar(10) primary key, department_name varchar(20), location_id varchar(20));

ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments (department_id);

create table locations (location_id varchar(15) primary key, street_address varchar(100), postal_code int(10), city varchar(25), state_province varchar(25), country_id varchar(15));

ALTER TABLE departments ADD FOREIGN KEY (location_id) REFERENCES locations (location_id);

create table countries (country_id varchar(10) primary key, country_name varchar(25), region_id varchar(10));

ALTER TABLE locations ADD FOREIGN KEY (country_id) REFERENCES countries (country_id);

create table regions (region_id varchar(10) primary key, region_name varchar(30));

ALTER TABLE countries ADD FOREIGN KEY (region_id) REFERENCES regions (region_id);



/* 2. Insert 5 rows in the jobs, dependents, regions, countries, locations, departments tables and  10 rows in the Employee table. */

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES ('JOB001', 'Software Engineer', 50000, 80000), ('JOB002', 'Marketing Manager', 60000, 100000), 
('JOB003', 'Data Analyst', 45000, 75000), ('JOB004', 'Sales Representative', 40000, 70000), ('JOB005', 'Human Resources Specialist', 45000, 80000);

INSERT INTO regions (region_id, region_name)
VALUES ('REG001', 'North America'),
('REG002', 'Europe'),
('REG003', 'Asia'),
('REG004', 'South America'),
('REG005', 'Africa');

INSERT INTO countries (country_id, country_name, region_id)
VALUES ('COUNTRY001', 'United States', 'REG001'),
('COUNTRY002', 'United Kingdom', 'REG002'),
('COUNTRY003', 'China', 'REG003'),
('COUNTRY004', 'Brazil', 'REG004'),
('COUNTRY005', 'South Africa', 'REG005');

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
VALUES ('LOC001', '123 Main St', 12345, 'New York', 'NY', 'COUNTRY001'),
('LOC002', '456 Elm St', 67890, 'London', 'England', 'COUNTRY002'),
('LOC003', '789 Oak St', 23456, 'Beijing', 'Beijing', 'COUNTRY003'),
('LOC004', '987 Pine St', 56789, 'São Paulo', 'São Paulo', 'COUNTRY004'),
('LOC005', '654 Maple St', 43210, 'Johannesburg', 'Gauteng', 'COUNTRY005');

INSERT INTO departments (department_id, department_name, location_id)
VALUES ('DEP001', 'Sales', 'LOC001'),
('DEP002', 'Marketing', 'LOC002'),
('DEP003', 'Human Resources', 'LOC003'),
('DEP004', 'Finance', 'LOC004'),
('DEP005', 'Operations', 'LOC005');

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
VALUES ('EMP001', 'John', 'Doe', 'johndoe@example.com', 1234567890, '2022-01-15', 'JOB001', 60000, 'EMP002', 'DEP001'),
('EMP002', 'Jane', 'Smith', 'janesmith@example.com', 2345678901, '2022-05-20', 'JOB002', 70000, 'EMP003', 'DEP001'),
('EMP003', 'Mike', 'Johnson', 'mikejohnson@example.com', 3456789012, '2022-09-10', 'JOB002', 65000, 'EMP001', 'DEP002'),
('EMP004', 'Emily', 'Davis', 'emilydavis@example.com', 4567890123, '2022-03-01', 'JOB003', 55000, 'EMP001', 'DEP002'),
('EMP005', 'David', 'Wilson', 'davidwilson@example.com', 5678901234, '2022-07-18', 'JOB004', 50000, 'EMP002', 'DEP003'),
('EMP006', 'Sarah', 'Brown', 'sarahbrown@example.com', 6789012345, '2022-04-12', 'JOB001', 55000, 'EMP001', 'DEP001'),
('EMP007', 'Michael', 'Lee', 'michaellee@example.com', 7890123456, '2022-08-27', 'JOB003', 60000, 'EMP002', 'DEP002'),
('EMP008', 'Jennifer', 'Taylor', 'jennifertaylor@example.com', 8901234567, '2022-06-05', 'JOB004', 70000, 'EMP003', 'DEP003'),
('EMP009', 'Robert', 'Johnson', 'robertjohnson@example.com', 9012345678, '2022-09-15', 'JOB001', 65000, 'EMP001', 'DEP001'),
('EMP010', 'Michelle', 'Anderson', 'michelleanderson@example.com', 0123456789, '2022-11-30', 'JOB002', 60000, 'EMP003', 'DEP002');

INSERT INTO dependents (dependent_id, first_name, last_name, relationship, employee_id)
VALUES ('DEP001', 'Emma', 'Doe', 'Daughter', 'EMP001'),
('DEP002', 'Liam', 'Smith', 'Son', 'EMP002'),
('DEP003', 'Olivia', 'Johnson', 'Daughter', 'EMP003'),
('DEP004', 'Noah', 'Davis', 'Son', 'EMP004'),
('DEP005', 'Sophia', 'Wilson', 'Daughter', 'EMP005');



/* 3. Column:
		a. In departments table, add a new field ‘manager_name’ of type VARCHAR*/

ALTER TABLE departments ADD manager_name VARCHAR(50);

/* 		b. REMOVE field max_salary from jobs. */

ALTER TABLE jobs DROP COLUMN max_salary;

/* 		c. In the locations table, rename postal_code column to pincode. */

ALTER TABLE locations RENAME COLUMN postal_code TO pincode;



















