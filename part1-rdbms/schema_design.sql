CREATE DATABASE assignment_db;

USE assignment_db;

-- Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Products Table
CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(20) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

-- Orders Table
CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    sales_rep_id VARCHAR(20),
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- INSERT sample data
-- 
INSERT INTO customers VALUES
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),
('C006','Neha Gupta','neha@gmail.com','Delhi');

INSERT INTO products VALUES
('P004','Notebook','Stationery',120),
('P007','Pen Set','Stationery',250),
('P005','Headphones','Electronics',3200);

INSERT INTO sales_reps VALUES
('SR02','Anita Desai','anita@corp.com','Delhi Office, Connaught Place, New Delhi - 110001'),
('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ, Nariman Point, Mumbai - 400021');

INSERT INTO orders VALUES
('ORD1027','C002','SR02','2023-11-02'),
('ORD1114','C001','SR01','2023-08-06'),
('ORD1153','C006','SR01','2023-02-14'),
('ORD1002','C002','SR02','2023-01-17');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
('ORD1027','P004',4),
('ORD1114','P007',2),
('ORD1153','P007',3),
('ORD1002','P005',1);


