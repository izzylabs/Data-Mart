-- Implementing partioning
CREATE TABLE sales_data_2023_01 PARTITION OF sales_data
FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');

CREATE TABLE sales_data_2023_02 PARTITION OF sales_data
FOR VALUES FROM ('2023-02-01') TO ('2023-03-01');

CREATE TABLE sales_data_2023_03 PARTITION OF sales_data
FOR VALUES FROM ('2023-03-01') TO ('2023-04-01');

CREATE TABLE sales_data_2023_04 PARTITION OF sales_data
FOR VALUES FROM ('2023-04-01') TO ('2023-05-01');

CREATE TABLE sales_data_2023_05 PARTITION OF sales_data
FOR VALUES FROM ('2023-05-01') TO ('2023-06-01');

CREATE TABLE sales_data_2023_06 PARTITION OF sales_data
FOR VALUES FROM ('2023-06-01') TO ('2023-07-01');

CREATE TABLE sales_data_2023_07 PARTITION OF sales_data
FOR VALUES FROM ('2023-07-01') TO ('2023-08-01');

CREATE TABLE sales_data_2023_08 PARTITION OF sales_data
FOR VALUES FROM ('2023-08-01') TO ('2023-09-01');

CREATE TABLE sales_data_2023_09 PARTITION OF sales_data
FOR VALUES FROM ('2023-09-01') TO ('2023-10-01');

CREATE TABLE sales_data_2023_10 PARTITION OF sales_data
FOR VALUES FROM ('2023-10-01') TO ('2023-11-01');

CREATE TABLE sales_data_2023_11 PARTITION OF sales_data
FOR VALUES FROM ('2023-11-01') TO ('2023-12-01');

CREATE TABLE sales_data_2023_12 PARTITION OF sales_data
FOR VALUES FROM ('2023-12-01') TO ('2024-01-01');

--Inserting Data
INSERT INTO sales_data (sale_date, salesperson_id, region, sale_amount) VALUES 
('2023-01-15', 1, 'North', 1000.00),
('2023-02-20', 2, 'South', 1500.00),
('2023-03-10', 3, 'East', 1250.00),
('2023-04-25', 4, 'West', 1750.00),
('2023-05-05', 5, 'North', 2000.00),
('2023-06-18', 1, 'South', 1600.00),
('2023-07-22', 2, 'East', 800.00),
('2023-08-30', 3, 'West', 950.00),
('2023-09-12', 4, 'North', 1100.00),
('2023-10-28', 5, 'South', 1000.00),
('2023-11-16', 1, 'East', 1300.00),
('2023-12-03', 2, 'West', 1400.00),
('2023-01-08', 3, 'North', 1800.00),
('2023-02-14', 4, 'South', 1700.00),
('2023-03-21', 5, 'East', 1600.00),
('2023-04-19', 1, 'West', 1500.00),
('2023-05-25', 2, 'North', 900.00),
('2023-06-05', 3, 'South', 1900.00),
('2023-07-13', 4, 'East', 2000.00),
('2023-08-27', 5, 'West', 850.00);

--Retrieve all sales in January 2023
SELECT * FROM sales_data
WHERE sale_date BETWEEN '2023-01-01' AND '2023-01-31';

--Calculate the total sale amount for January 2023
SELECT SUM(sale_amount) FROM sales_data
WHERE sale_date BETWEEN '2023-01-01' AND '2023-01-31';

--Identify the top three salespersons by sale amount in the 'North' region across all partitions
SELECT salesperson_id, SUM(sale_amount) AS total_sales
FROM sales_data
WHERE region = 'North'
GROUP BY salesperson_id
ORDER BY total_sales DESC
LIMIT 3;

--Dropping an old partition
DROP TABLE IF EXISTS sales_data_2022_01;

--Creating a new partition for the current month
CREATE TABLE sales_data_2024_01 PARTITION OF sales_data
FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');
