/*1. Create a trigger to fill up the full_name column in the dependents table while inserting any new records.*/

DELIMITER //

CREATE TRIGGER fill_dependent_full_name
BEFORE INSERT ON dependents
FOR EACH ROW
BEGIN
  SET NEW.full_name = CONCAT(NEW.first_name, ' ', NEW.last_name);
END //

DELIMITER ;

/*2. Create a trigger that stores the transaction records of each insert, update and delete operations performed on the locations table into locations_info table.*/

DELIMITER //

CREATE TRIGGER location_insert_trigger
AFTER INSERT ON locations
FOR EACH ROW
BEGIN
  INSERT INTO locations_info (location_id, action, transaction_date)
  VALUES (NEW.location_id, 'INSERT', NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER location_update_trigger
AFTER UPDATE ON locations
FOR EACH ROW
BEGIN
  INSERT INTO locations_info (location_id, action, transaction_date)
  VALUES (OLD.location_id, 'UPDATE', NOW());
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER location_delete_trigger
AFTER DELETE ON locations
FOR EACH ROW
BEGIN
  INSERT INTO locations_info (location_id, action, transaction_date)
  VALUES (OLD.location_id, 'DELETE', NOW());
END //

DELIMITER ;

/*3. For the following tables create a view named employee_information with employee first name, last name, salary, department name, city, postal code insert only those records whose 
postal code length is less than 5.*/

CREATE VIEW employee_information AS
SELECT e.first_name, e.last_name, e.salary, d.department_name, l.city, l.postal_code FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE LENGTH(l.postal_code) < 5;

/*4. Explain ACID properties with an example.

ACID is an acronym that stands for Atomicity, Consistency, Isolation, and Durability. These are fundamental properties that ensure reliable and transactional behavior in database management systems (DBMS). 
Let's explore each of these properties:
1. Atomicity:
Atomicity guarantees that a transaction is treated as a single, indivisible unit of work. Either all the operations within a transaction are successfully completed, or none of them are applied. If any part of a transaction fails, the entire transaction is rolled back, and the database remains unchanged. Atomicity ensures that the database is always in a consistent state.

2. Consistency:
Consistency ensures that a transaction brings the database from one consistent state to another. It enforces the integrity constraints defined on the database, ensuring that the data meets certain rules or conditions. If a transaction violates any of the integrity constraints, it is rolled back, and the database remains in its original consistent state.

3. Isolation:
Isolation ensures that concurrent transactions do not interfere with each other, providing the illusion that each transaction is executed in isolation. Concurrently executing transactions should not be aware of other transactions executing concurrently. Each transaction should see the database as if it were the only one accessing it, preventing any conflicts or anomalies caused by concurrent access.

4. Durability:
Durability guarantees that once a transaction is committed, its changes are permanent and will survive any subsequent failures, such as power outages or system crashes. The changes made by committed transactions are stored in a persistent manner and will not be lost.

The ACID properties ensure data integrity, consistency, and reliability in a DBMS, providing a robust and dependable environment for managing transactions. These properties are essential for applications that require reliable data processing, such as financial systems, e-commerce platforms, and other mission-critical systems.
*/  

/* 5. Which one of the fields is the index built from?

The index field associated with the values 1, 3, 2, 5 and 4 is the Occupation field because after sorting the Occupational field lexicographically will give the sequence 1,3,2,5,4.*/
