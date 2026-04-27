 create database Books;

use Books;

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
   full_name VARCHAR(100) NOT NULL
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    category_id INT,
    foreign key (author_id) references Authors( author_id),
    foreign key (category_id) references Categories (category_id)
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- INSERT INTO Authors (name) VALUES 
-- ('Nguyễn Nhật Ánh'),
-- ('Dan Brown'),
-- ('Tony Robbins');

-- INSERT INTO Categories (name) VALUES
-- ('Văn học'),
-- ('Trinh thám'),
-- ('Kỹ năng');

-- INSERT INTO Books (title, author_id, category_id) VALUES 
-- ('Mắt biếc',1 ,1),
-- ('Cho tôi xin một vé về tuổi thơ',1,1),
-- ('Thiên thần và ác quỷ', 2, 2),
-- ('Mật mã Da Vinci', 2, 2),
-- ('Đánh thức con người phi thường', 3, 3),
-- ('Unlimited Power', 3, 3),
-- ('Cô gái đến từ hôm qua', 1, 1),
-- ('Inferno', 2, 2);

-- INSERT INTO Customers (name, email) VALUES
-- ('An', 'an@gmail.com'),
-- ('Bình', 'binh@gmail.com'),
-- ('Cường', 'cuong@gmail.com'),
-- ('Dũng', 'dung@gmail.com'),
-- ('Em', 'em@gmail.com');

-- INSERT INTO  Customers (name, email) 
-- VALUES ('Master An','an@gmail.com');
-- -- Cột email được đặt ràng buộc UNIQUE, nên mỗi email chỉ tồn tại một lần trong bảng.
-- -- Khi thêm khách hàng mới có email trùng với email đã tồn tại, hệ thống sẽ báo lỗi và không cho insert dữ liệu.
-- -- Điều này giúp đảm bảo dữ liệu không bị trùng lặp và giữ tính toàn vẹn.

INSERT INTO Authors (full_name, email) VALUES
('Nguyễn Nhật Ánh', 'nna@gmail.com'),
('Agatha Christie', 'agatha@gmail.com'),
('Dale Carnegie', 'dale@gmail.com');

INSERT INTO Categories (category_name) VALUES
('Văn học'),
('Trinh thám'),
('Kỹ năng');

INSERT INTO Books (title, author_id, category_id) VALUES
('Mắt biếc', 1, 1),
('Cho tôi xin một vé đi tuổi thơ', 1, 1),
('Án mạng trên sông Nile', 2, 2),
('Vụ án mạng ở nhà mục sư', 2, 2),
('Đắc nhân tâm', 3, 3),
('Quẳng gánh lo đi và vui sống', 3, 3),
('Tôi thấy hoa vàng trên cỏ xanh', 1, 1),
('Hẹn bạn trên đỉnh thành công', 3, 3);

INSERT INTO Customers (full_name, email) VALUES
('Nguyễn Văn A', 'a@gmail.com'),
('Trần Thị B', 'b@gmail.com'),
('Lê Văn C', 'c@gmail.com'),
('Phạm Thị D', 'd@gmail.com'),
('Hoàng Văn E', 'e@gmail.com');

-- Cố tình thêm khách hàng có email trùng
INSERT INTO Customers (full_name, email) VALUES
('Nguyễn Văn F', 'a@gmail.com');
-- Lệnh trên sẽ bị lỗi vì email 'a@gmail.com' đã tồn tại trong bảng Customers.
-- Do cột email được thiết lập ràng buộc UNIQUE,
-- nên hệ quản trị CSDL sẽ không cho phép thêm dữ liệu trùng lặp.
-- Điều này giúp đảm bảo mỗi khách hàng có một email duy nhất.


SELECT * FROM Authors;
SELECT * FROM Categories;
SELECT * FROM Books;
SELECT * FROM Customers;