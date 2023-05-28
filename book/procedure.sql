--c?dv?l? kitab ?lav? ed?n PROCEDURE
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
--c?dv?l? yaz??? ?lav? ed?n PROCEDURE
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
--c?dv?l? sat?c? ?lav? ed?n PROCEDURE
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
--c?dv?l? sat?? ?lav? ed?n v? book c?dv?lind?n stocku update ed?n procedure PROCEDURE 
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

-----------------------------------------------------
--kitab?n idsin? gör? haqq?nda m?lumat g?tir?n prosedur
CREATE OR REPLACE PROCEDURE about_books(
  book_id124 VARCHAR2)
AS
  book_name124 varchar2(50);
  TOTAL_SALES124 NUMBER :=0;
  writer_name124 VARCHAR2(60);
  price124 NUMBER;
  stock124 NUMBER;
  SALES_AMOUNT1 number;
BEGIN

  SELECT book_name, price, stock INTO book_name124, price124, stock124  FROM BOOKS
  WHERE book_id = book_id124 ;
  
  SELECT writer_name  INTO writer_name124   FROM BOOKS  B
  INNER JOIN writer  USING(writer_id) WHERE B.book_id = book_id124 ;

  SELECT SALES_AMOUNT INTO SALES_AMOUNT1   FROM sale
  WHERE book_id = book_id124 ;

  SELECT SUM(B.price*S.sales_amount) INTO TOTAL_SALES124  FROM BOOKS B
  INNER JOIN SALE S USING(book_id) WHERE book_id = book_id124 ;

  COMMIT;
  dbms_output.put_line('KITAB_?D ||'||book_id124 ||'|| KITABIN_ADI ||'||book_name124||'|| YAZIÇI ||' ||writer_name124 ||'|| Q?YM?T ||'||price124||'|| SAYI ||' ||stock124 ||' sat?? say?'||SALES_AMOUNT1|| '|| ÜMUM? SATI?I ||'||TOTAL_SALES124);
  
  exception
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('data tapilmadi');
  
END;

SET serveroutput ON;
exec about_books(8);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


COMMIT;
----------------------------------------------------------------------------------------