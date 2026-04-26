 create database Books;

use Books;

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    category_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Authors (name) VALUES 
('Nguyễn Nhật Ánh'),
('Dan Brown'),
('Tony Robbins');

INSERT INTO Categories (name) VALUES
('Văn học'),
('Trinh thám'),
('Kỹ năng');

INSERT INTO Books (title, author_id, category_id) VALUES 
('Mắt biếc',1 ,1),
('Cho tôi xin một vé về tuổi thơ',1,1),
('Thiên thần và ác quỷ', 2, 2),
('Mật mã Da Vinci', 2, 2),
('Đánh thức con người phi thường', 3, 3),
('Unlimited Power', 3, 3),
('Cô gái đến từ hôm qua', 1, 1),
('Inferno', 2, 2);

INSERT INTO Customers (name, email) VALUES
('An', 'an@gmail.com'),
('Bình', 'binh@gmail.com'),
('Cường', 'cuong@gmail.com'),
('Dũng', 'dung@gmail.com'),
('Em', 'em@gmail.com');

INSERT INTO  Customers (name, email) 
VALUES ('Master An','an@gmail.com');
-- Cột email được đặt ràng buộc UNIQUE, nên mỗi email chỉ tồn tại một lần trong bảng.
-- Khi thêm khách hàng mới có email trùng với email đã tồn tại, hệ thống sẽ báo lỗi và không cho insert dữ liệu.
-- Điều này giúp đảm bảo dữ liệu không bị trùng lặp và giữ tính toàn vẹn.

SELECT * FROM Authors;
SELECT * FROM Categories;
SELECT * FROM Books;
SELECT * FROM Customers;