-- Inserting sample data into the employees table with encrypted passwords
INSERT INTO employees (first_name, last_name, email, encrypted_password) VALUES
   ('Alice', 'Smith', 'alice.smith@example.com', crypt('password123', gen_salt('bf'))),
   ('Bob', 'Johnson', 'bob.johnson@example.com', crypt('securepass', gen_salt('bf'))),
   ('Charlie', 'Brown', 'charlie.brown@example.com', crypt('mypassword', gen_salt('bf')));

-- Selecting all employees
SELECT * FROM employees;

-- Updating an employee's last name
UPDATE employees SET last_name = 'Williams' WHERE email = 'bob.johnson@example.com';

-- Deleting an employee record by email
DELETE FROM employees WHERE email = 'charlie.brown@example.com';

-- Querying the pg_stat_statements view to gather statistics
SELECT * FROM pg_stat_statements;

