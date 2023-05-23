--BOOKS PROCEDURE
CREATE OR REPLACE PROCEDURE add_books(
  book_name1 VARCHAR2,
  writer_id1 NUMBER,
  price1 NUMBER,
  stock1 NUMBER)
as
BEGIN
  INSERT INTO BOOKS( book_name ,writer_id,price,stock)
  VALUES (book_name1 ,writer_id1,price1,stock1);
  COMMIT;
  dbms_output.put_line('KITABLAR UPDATE OLUNDU');
END;
-------------------------------------------------------------
--Writer PROCEDURE
CREATE OR REPLACE PROCEDURE add_writer(
  writer_name1 VARCHAR2,
  country1 VARCHAR2)
as
BEGIN
  INSERT INTO writer(writer_name,country )
  VALUES (writer_name1,country1 );
  COMMIT;
  dbms_output.put_line('YAZICILAR UPDATE OLUNDU');
END;
-------------------------------------------------------------
--suplier PROCEDURE
CREATE OR REPLACE PROCEDURE add_suplier(
  seller1 VARCHAR2,
  address1 VARCHAR2,
  phone1 VARCHAR2,
  email1 VARCHAR2)
as
BEGIN
  INSERT INTO suplier(seller,address,phone,email)
  VALUES (seller1,address1,phone1,email1);
  COMMIT;
  dbms_output.put_line('SATICILAR UPDATE OLUNDU');
END;
----------------------------------------------------------
--saling PROCEDURE
CREATE OR REPLACE PROCEDURE saling(
  sale_id1 NUMBER,
  book_id1 NUMBER,
  seller_id1 NUMBER,
  sale_date1 DATE,
  sales_amount1 NUMBER
)
AS

BEGIN
  
  INSERT INTO sale(book_id, seller_id, sale_date, sales_amount)
  VALUES (book_id1, seller_id1, sale_date1, sales_amount1);
  
  
 UPDATE books SET stock = stock - sales_amount1 WHERE book_id = book_id1;
 UPDATE sale SET sales_amount = nvl(sales_amount,0) + sales_amount1 WHERE book_id = book_id1;
 
end;

--------------------------------------------------------
--KITAB HAQQINDA MELUMAT GETIREN PROCEDURE YARAT
--EN COX SATIS EDEN YAZARI GETIR  FILTERASIYA ISLERI
COMMIT;