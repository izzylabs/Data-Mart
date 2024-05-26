-- Create a sample table
CREATE TABLE remote_table (
    id serial PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER
);

-- Insert sample data into the table
INSERT INTO remote_table (name, age) VALUES
    ('Alice Johnson', 21),
    ('Bob Smith', 34),
    ('Carol Williams', 29);