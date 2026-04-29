CREATE DATABASE LibraryManagement;

USE LibraryManagement;

CREATE TABLE Book (
    book_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100),
    publish_year INT,
    quantity INT DEFAULT 0
);

CREATE TABLE Reader (
    reader_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    birth_date DATE
);

CREATE TABLE Borrow_Card (
    card_id VARCHAR(10) PRIMARY KEY,
    borrow_date DATE,
    return_date DATE,
    reader_id VARCHAR(10),
    FOREIGN KEY (reader_id) REFERENCES Reader(reader_id)
);

CREATE TABLE Borrow_Detail (
    card_id VARCHAR(10),
    book_id VARCHAR(10),
    status VARCHAR(10),
    fee DECIMAL(10,2),
    PRIMARY KEY (card_id, book_id),
    FOREIGN KEY (card_id) REFERENCES Borrow_Card(card_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

ALTER TABLE Reader ADD address_detail TEXT;

ALTER TABLE Book
CHANGE publish_year NamPhatHanh INT;

INSERT INTO Book VALUES
('B001','Lập trình SQL căn bản','Nguyễn Văn A',2020,10),
('B002','Dế mèn phiêu lưu ký','Tô Hoài',2018,5),
('B003','Mắt biếc','Nguyễn Nhật Ánh',2019,7),
('B004','Tôi thấy hoa vàng trên cỏ xanh','Nguyễn Nhật Ánh',2021,6),
('B005','Tiếng gọi nơi hoang dã','Jack London',2016,4);

INSERT INTO Reader (reader_id, full_name, email, phone, birth_date) VALUES
('R001','Nguyễn Văn A','a@gmail.com','0123','2000-01-01'),
('R002','Trần Thị B',NULL,'0456','2001-02-02'),
('R003','Lê Văn C','c@gmail.com','0789','1999-03-03'),
('R004','Phạm Thị D','d@gmail.com','0111','2002-04-04'),
('R005','Hoàng Văn E','e@gmail.com','0222','2000-05-05');

INSERT INTO Borrow_Card VALUES
('PM001','2026-04-01','2026-04-10','R001'),
('PM002','2026-04-05','2026-04-15','R002'),
('PM003','2026-03-01','2026-03-10','R003'),
('PM004','2026-04-20','2026-04-30','R004'),
('PM005','2026-02-01','2026-02-10','R005');

INSERT INTO Borrow_Detail VALUES
('PM001','B001','Mới',5000),
('PM001','B003','Cũ',3000),
('PM002','B002','Mới',4000),
('PM003','B005','Cũ',2000),
('PM004','B004','Mới',6000);

UPDATE Book
SET quantity = quantity + 5
WHERE author = 'Nguyễn Nhật Ánh';

DELETE FROM Reader
WHERE email IS NULL;

SELECT * FROM Book
WHERE NamPhatHanh BETWEEN 2015 AND 2023;

SELECT r.full_name, b.card_id FROM Reader r
JOIN Borrow_Card b ON r.reader_id = b.reader_id
WHERE MONTH(b.borrow_date) = 4 AND YEAR(b.borrow_date) = 2026;

SELECT bk.title FROM Borrow_Detail bd
JOIN Book bk ON bd.book_id = bk.book_id
WHERE bd.card_id = 'PM001';

SELECT r.full_name, r.phone FROM Reader r
JOIN Borrow_Card bc ON r.reader_id = bc.reader_id
JOIN Borrow_Detail bd ON bc.card_id = bd.card_id
JOIN Book b ON bd.book_id = b.book_id
WHERE b.title = 'Lập trình SQL căn bản';

SELECT bc.card_id, b.title, bd.status FROM Borrow_Card bc
JOIN Borrow_Detail bd ON bc.card_id = bd.card_id
JOIN Book b ON bd.book_id = b.book_id
WHERE b.author = 'Jack London';