CREATE OR REPLACE FUNCTION total_sales(-- kitabin idsine gore total getirir
  BOOK_ID1 NUMBER

) RETURN NUMBER
IS
  TOTAL_SALES NUMBER :=0;
BEGIN
  SELECT SUM(B.price*S.sales_amount) INTO TOTAL_SALES  FROM BOOKS B
  INNER JOIN SALE S USING(book_id) WHERE BOOK_ID = BOOK_ID1 ;
  RETURN TOTAL_SALES;
END;
-------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION total_sales1( -- kitabin adina gore total getirir
  book_name1 VARCHAR2
) RETURN NUMBER

IS
  TOTAL_SALES12 NUMBER :=0;
BEGIN
  SELECT SUM(B.price*S.sales_amount) INTO TOTAL_SALES12  FROM BOOKS B
  INNER JOIN SALE S USING(book_id) WHERE book_name = book_name1 ;
  RETURN TOTAL_SALES12;
END;

SELECT total_sales1('To Kill a Kingdom') TOTAL FROM DUAL;
----------------------------------------------------------------------

--YAZARIN NECE KITABinin SATilDIGINI GOSTEREN PROCEDURE YARAT  

CREATE OR REPLACE FUNCTION writer_total_count1(
writer_NAME1 VARCHAR2
) RETURN NUMBER
IS
  total_count NUMBER:=0;
BEGIN
  SELECT s.sales_amount into total_count  FROM writer w
  INNER JOIN books b  USING(writer_id)
  INNER JOIN sale s  USING(book_id)
  WHERE writer_NAME = writer_NAME1;
  return total_count;
END;

SELECT writer_total_count1('J.D. Salinger') TOTAL FROM DUAL;

----------------------------------------------------------------------

--sat?c?n?n  NECE kitab? SATDIGINI GOSTEREN funksiya YARAT  

CREATE OR REPLACE FUNCTION suplier_total_count1(
  seller_id1 number
) RETURN NUMBER
IS
  total_count NUMBER:=0;
BEGIN
  SELECT s.sales_amount into total_count  FROM suplier 
  INNER JOIN sale s  USING(seller_id)
  WHERE seller_id = seller_id1;
  RETURN total_count;
END;

SELECT suplier_total_count1(1) TOTAL FROM DUAL;
--------------------------------------------------------