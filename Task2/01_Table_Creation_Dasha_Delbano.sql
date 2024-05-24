-- Installing the required extensions
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Creating the employees table with an encrypted password column
CREATE TABLE employees (
   id SERIAL PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   email VARCHAR(255),
   encrypted_password TEXT
);

