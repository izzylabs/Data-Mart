-- Initial table creation
CREATE TABLE sales_data (
  sale_id INT NOT NULL,
  sale_date DATE NOT NULL,
  salesperson_id INT NOT NULL,
  region TEXT NOT NULL,
  sale_amount NUMERIC NOT NULL,
  PRIMARY KEY (sale_id, sale_date)
) PARTITION BY RANGE (sale_date);

-- Create sequence table
CREATE SEQUENCE sales_data_sale_id_seq;

ALTER TABLE sales_data 
ALTER COLUMN sale_id SET DEFAULT nextval('sales_data_sale_id_seq');

