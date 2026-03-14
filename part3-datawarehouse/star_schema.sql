-- Part 3.1  - Star Schema for Sales Data Warehouse

-- Dimension: Date
CREATE TABLE dim_date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    full_date DATE,
    month INT,
    year INT
);

-- Dimension: Store
CREATE TABLE dim_store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(50)
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Fact table: Sales
CREATE TABLE fact_sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    units_sold INT,
    total_revenue DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- INSERT data into dimensions

INSERT INTO dim_date (full_date, month, year) VALUES
('2023-08-29',8,2023),
('2023-12-12',12,2023),
('2023-02-05',2,2023),
('2023-02-20',2,2023),
('2023-01-15',1,2023),
('2023-08-09',8,2023),
('2023-03-31',3,2023),
('2023-10-26',10,2023),
('2023-12-08',12,2023),
('2023-08-15',8,2023);

INSERT INTO dim_date (full_date, month, year) VALUES
('2023-08-29',8,2023),
('2023-12-12',12,2023),
('2023-02-05',2,2023),
('2023-02-20',2,2023),
('2023-01-15',1,2023),
('2023-08-09',8,2023),
('2023-03-31',3,2023),
('2023-10-26',10,2023),
('2023-12-08',12,2023),
('2023-08-15',8,2023);

INSERT INTO dim_product (product_name, category) VALUES
('Speaker','Electronics'),
('Tablet','Electronics'),
('Phone','Electronics'),
('Smartwatch','Electronics'),
('Atta 10kg','Grocery'),
('Jeans','Clothing'),
('Biscuits','Groceries'),
('Jacket','Clothing'),
('Laptop','Electronics'),
('Milk 1L','Groceries'),
('Saree','Clothing'),
('Headphones','Electronics');

INSERT INTO fact_sales (date_id,store_id,product_id,units_sold,total_revenue) VALUES
(1,1,1,3,14778.78),
(2,1,2,11,255487.32),
(3,1,3,20,974067.80),
(4,2,2,14,325165.68),
(5,1,4,10,588510.10),
(6,3,5,12,629568),
(7,4,4,6,353106.06),
(8,4,6,16,37079.52),
(9,3,7,9,247229.91),
(10,3,4,3,176553.03);