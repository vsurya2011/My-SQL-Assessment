CREATE TABLE Books (
    book_id INT AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    price DECIMAL(8,2),
    published_date DATE,
    in_stock INT DEFAULT 1,
    primary key(book_id)
);

desc books; 
 
-- inserting bulk records 
INSERT INTO Books (title, isbn, price, published_date, in_stock)
VALUES
('Data Structure', 'ISBN1005', 550.00, '2021-07-12', 10),
('Java Programming', 'ISBN1006', 650.00, '2022-02-20', 5),
('Sql basics', 'ISBN1007', 750.00, '2025-08-25', 0),
('JDBC connectivity', 'ISBN1008', 700.00, '2021-03-28', 8);


-- inserting single values pair
INSERT INTO Books (title, isbn, price, published_date)
VALUES
('Learning of prompting', 'ISBN1009', 450.00, '2025-06-15');

SELECT * FROM books;

-- altering the table of title column name book_title
ALTER TABLE Books
RENAME COLUMN title TO book_title;

-- modifying column price data type to float
ALTER TABLE Books
MODIFY COLUMN price FLOAT;
desc Books;

-- adding the new column
ALTER TABLE Books
ADD COLUMN author_name VARCHAR(50) NOT NULL DEFAULT 'Unknown';

-- adding discount
UPDATE Books
SET price = price * 0.90
WHERE book_id > 0
AND published_date < '2020-01-01';

-- deleting out of stock books
DELETE FROM Books
WHERE book_id > 0
AND in_stock = 0;
SELECT * FROM books;

-- adding auto increment from specific number or id
ALTER TABLE Books
AUTO_INCREMENT = 101;

-- conditional select
SELECT book_title, price, published_date
FROM Books
WHERE book_title LIKE '%History%'
AND price > 500
ORDER BY price DESC;

-- wokring with second table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURDATE())
);
desc Members;

SELECT * FROM Members
WHERE YEAR(join_date) = 2024
ORDER BY member_name ASC;


