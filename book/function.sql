CREATE OR REPLACE FUNCTION total_sales(
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
CREATE OR REPLACE FUNCTION total_sales1(
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

--YAZARIN NECE KITAB SATDIGINI GOSTEREN PROCEDURE YARAT  

