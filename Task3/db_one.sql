-- Create db_one
CREATE DATABASE db_one;

-- Create db_two
CREATE DATABASE db_two;

-- Install the required extension
CREATE EXTENSION postgres_fdw;

-- Create a foreign server that connects to 'db_two'
CREATE SERVER same_server_postgres
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (dbname 'db_two');

-- Create a user mapping for the current user
CREATE USER MAPPING FOR CURRENT_USER
    SERVER same_server_postgres
    OPTIONS (user 'postgres', password 'user');
	
-- Define a foreign table that maps to 'remote_table' in 'db_two'
CREATE FOREIGN TABLE local_remote_table (
   id INTEGER,
   name VARCHAR(255),
   age INTEGER
)
SERVER same_server_postgres
OPTIONS (schema_name 'public', table_name 'remote_table');

-- Select all records from the foreign table
SELECT * FROM local_remote_table;

-- Insert a new record into the foreign table
INSERT INTO local_remote_table (id, name, age) VALUES (4, 'Eve Adams', 36);

-- Update an existing record in the foreign table
UPDATE local_remote_table SET age = 44 WHERE name = 'Carol Williams';

-- Delete a record from the foreign table
DELETE FROM local_remote_table WHERE name = 'Bob Smith';

CREATE TABLE local_table (
    id serial PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL
);

--The student has performed some operations using their own queries
INSERT INTO local_table (name, email) VALUES
    ('Alice Johnson',  'alice.johnson@gmail.com'),
    ('Bob Smith','bob.smith@gmail.com'),
    ('Carol Williams','carol.williams@gmail.com' );
	
SELECT r.*, l.email
FROM local_remote_table  r 
LEFT JOIN  local_table l ON (r.name = l.name );
	