-- writer tablosu için örnek veriler
INSERT INTO writer (writer_name, country)
VALUES ('F. Scott Fitzgerald', 'USA');

INSERT INTO writer (writer_name, country)
VALUES ('Harper Lee', 'USA');

INSERT INTO writer (writer_name, country)
VALUES ('George Orwell', 'UK');

INSERT INTO writer (writer_name, country)
VALUES ('Jane Austen', 'UK');

INSERT INTO writer (writer_name, country)
VALUES ('J.D. Salinger', 'USA');

INSERT INTO writer (writer_name, country)
VALUES ('J.R.R. Tolkien', 'UK');

INSERT INTO writer (writer_name, country)
VALUES ('Alexandra Christo', 'USA');

INSERT INTO writer (writer_name, country)
VALUES ('Paulo Coelho', 'Brazil');

INSERT INTO writer (writer_name, country)
VALUES ('J.K. Rowling', 'UK');

INSERT INTO writer (writer_name, country)
VALUES ('C.S. Lewis', 'UK');

INSERT INTO books (book_name, writer_id, price, stock)
VALUES ('The Great Gatsby', 1, 12.99, 50);

INSERT INTO books (book_name, writer_id, price, stock)
VALUES ('To Kill a Mockingbird', 2, 9.99, 75);

INSERT INTO books (book_name, writer_id, price, stock)
VALUES ('1984', 3, 10.99, 100);

INSERT INTO books (book_name, writer_id, price, stock)
VALUES ('Pride and Prejudice', 4, 8.99, 120);

INSERT INTO books (book_name, writer_id, price, stock)
VALUES ('The Catcher in the Rye', 5, 11.99, 60);

INSERT INTO books (book_name, writer_id, price, stock)
VALUES ('The Hobbit', 6, 14.99, 90);

INSERT INTO books (book_name, writer_id, price, stock)
VALUES ('To Kill a Kingdom', 7, 13.99, 30);

INSERT INTO books (book_name, writer_id, price, stock)
VALUES ('The Alchemist', 8, 9.99, 200);

INSERT INTO books (book_name, writer_id, price, stock)
VALUES ('Harry Potter and the Sorcerer''s Stone', 9, 15.99, 80);

INSERT INTO books (book_name, writer_id, price, stock)
VALUES ('The Lion, the Witch and the Wardrobe', 10, 12.99, 110);


--------------------------------------------------------
-- suplier tablosu için örnek veriler
INSERT INTO suplier (seller, address, phone, email)
VALUES ('ABC Books', '123 Main Street, Cityville', '123-456-7890', 'abcbooks@example.com');

INSERT INTO suplier (seller, address, phone, email)
VALUES ('XYZ Publishers', '456 Elm Street, Townsville', '987-654-3210', 'xyzpublishers@example.com');

INSERT INTO suplier (seller, address, phone, email)
VALUES ('Book World', '789 Oak Avenue, Villagetown', '555-123-4567', 'bookworld@example.com');

INSERT INTO suplier (seller, address, phone, email)
VALUES ('Global Books', '321 Pine Road, Metropolis', '111-222-3333', 'globalbooks@example.com');

INSERT INTO suplier (seller, address, phone, email)
VALUES ('Bestseller Publishers', '555 Cedar Lane, Megacity', '444-555-6666', 'bestsellerpub@example.com');

INSERT INTO suplier (seller, address, phone, email)
VALUES ('Readers Paradise', '888 Maple Street, Dreamland', '777-888-9999', 'readersparadise@example.com');

INSERT INTO suplier (seller, address, phone, email)
VALUES ('Fantastic Books', '999 Walnut Avenue, Magicland', '222-333-4444', 'fantasticbooks@example.com');

INSERT INTO suplier (seller, address, phone, email)
VALUES ('Books R Us', '444 Birch Road, Enchanted City', '666-777-8888', 'booksrus@example.com');

INSERT INTO suplier (seller, address, phone, email)
VALUES ('Novelty Publishers', '222 Spruce Street, Fairyland', '999-000-1111', 'noveltypub@example.com');

INSERT INTO suplier (seller, address, phone, email)
VALUES ('Classic Books', '777 Oak Lane, Wonderland', '333-444-5555', 'classicbooks@example.com');
------------------------------------------------------------------------------------------


INSERT INTO sale (book_id, seller_id, sale_date, sales_amount)
VALUES (1, 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 5);

INSERT INTO sale (book_id, seller_id, sale_date, sales_amount)
VALUES (2, 3, TO_DATE('2023-05-02', 'YYYY-MM-DD'), 10);

INSERT INTO sale (book_id, seller_id, sale_date, sales_amount)
VALUES (3, 2, TO_DATE('2023-05-03', 'YYYY-MM-DD'), 8);

INSERT INTO sale (book_id, seller_id, sale_date, sales_amount)
VALUES (4, 5, TO_DATE('2023-05-04', 'YYYY-MM-DD'), 12);

INSERT INTO sale (book_id, seller_id, sale_date, sales_amount)
VALUES (5, 4, TO_DATE('2023-05-05', 'YYYY-MM-DD'), 6);

INSERT INTO sale (book_id, seller_id, sale_date, sales_amount)
VALUES (6, 7, TO_DATE('2023-05-06', 'YYYY-MM-DD'), 15);

INSERT INTO sale (book_id, seller_id, sale_date, sales_amount)
VALUES (7, 6, TO_DATE('2023-05-07', 'YYYY-MM-DD'), 3);

INSERT INTO sale (book_id, seller_id, sale_date, sales_amount)
VALUES (8, 9, TO_DATE('2023-05-08', 'YYYY-MM-DD'), 20);

INSERT INTO sale (book_id, seller_id, sale_date, sales_amount)
VALUES (9, 8, TO_DATE('2023-05-09', 'YYYY-MM-DD'), 25);

INSERT INTO sale (book_id, seller_id, sale_date, sales_amount)
VALUES (10, 10, TO_DATE('2023-05-10', 'YYYY-MM-DD'), 18);

commit;


----------------------------------------------------------------------
SELECT * FROM suplier;
SELECT * FROM books;
select * from writer;