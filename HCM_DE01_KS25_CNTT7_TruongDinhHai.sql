CREATE DATABASE SalesManagement;

USE SalesManagement;

CREATE TABLE Product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100),
    price DECIMAL(12,2),
    stock INT
);

CREATE TABLE Customer (
    customer_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(12,2),
    customer_id VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Detail (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    price_at_time DECIMAL(12,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

ALTER TABLE Orders ADD note TEXT;
ALTER TABLE Product CHANGE manufacturer nha_san_xuat VARCHAR(100);

-- DROP TABLE Order_Detail;
-- DROP TABLE Orders;

INSERT INTO Product(product_id, product_name, nha_san_xuat, price, stock) VALUES
('P001', 'MacBook Air M2', 'Apple', 25000000, 10),
('P002', 'iPhone 15', 'Apple', 20000000, 15),
('P003', 'Dell XPS 13', 'Dell', 18000000, 8),
('P004', 'Asus ROG', 'Asus', 22000000, 5),
('P005', 'Logitech Mouse', 'Logitech', 500000, 50);

INSERT INTO Customer(customer_id, full_name, email, phone, address) VALUES
('C001', 'Nguyen Van A', 'a@gmail.com', '0123456789', 'HCM'),
('C002', 'Tran Thi B', 'b@gmail.com', NULL, 'HN'),
('C003', 'Le Van C', 'c@gmail.com', '0987654321', 'DN'),
('C004', 'Pham Thi D', 'd@gmail.com', '0111111111', 'HP'),
('C005', 'Hoang Van E', 'e@gmail.com', NULL, 'CT');

INSERT INTO Orders(order_id, order_date, total_amount, customer_id, note) VALUES
('DH001', '2024-01-01', 45000000, 'C001', NULL),
('DH002', '2024-01-02', 20000000, 'C003', NULL),
('DH003', '2024-01-03', 18000000, 'C004', NULL),
('DH004', '2024-01-04', 22000000, 'C001', NULL),
('DH005', '2024-01-05', 500000, 'C003', NULL);

INSERT INTO Order_Detail(order_id, product_id, quantity, price_at_time) VALUES
('DH001', 'P001', 1, 25000000),
('DH001', 'P002', 1, 20000000),
('DH002', 'P002', 1, 20000000),
('DH003', 'P003', 1, 18000000),
('DH005', 'P005', 1, 500000);

UPDATE Product
SET price = price * 1.1
WHERE nha_san_xuat = 'Apple';

DELETE FROM Customer
WHERE phone IS NULL;

SELECT * FROM Product
WHERE price BETWEEN 10000000 AND 20000000;

SELECT product_name FROM Product
WHERE product_id IN (
    SELECT product_id FROM Order_Detail
    WHERE order_id = 'DH001'
);

SELECT * FROM Customer
WHERE customer_id IN (
    SELECT customer_id FROM Orders
    WHERE order_id IN (
        SELECT order_id FROM Order_Detail
        WHERE product_id IN (
            SELECT product_id  FROM Product
            WHERE product_name = 'MacBook Air M2'
        )
    )
);