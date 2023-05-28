SET SERVEROUTPUT ON;
--INSERT UCUN PROSEDUR
CREATE OR REPLACE PROCEDURE add_customers(
  CUSTOMERID1 NUMBER,
  NAME1 VARCHAR2,
  surname1 VARCHAR2,
  email1 VARCHAR2,
  telephone1 VARCHAR2,
  address1 VARCHAR2,
  city1 VARCHAR2,
  country1 VARCHAR2,
  date_registration1 VARCHAR2
) 
AS
BEGIN
  INSERT INTO customers_table (CustomerID, NAME, Surname, Email, Telephone, Address, City, Country, date_registration) 
  VALUES (CUSTOMERID1, NAME1, surname1, email1, telephone1, address1, city1, country1, date_registration1);
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('MUSTERILER UPDATE OLUNDU');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
----------------------------------------------------
--silmek UCUN PROSEDUR
CREATE OR REPLACE PROCEDURE DELETE_customers(
  CUSTOMERID1 NUMBER
) 
AS
BEGIN
  delete from  customers_table where CustomerID = CUSTOMERID1;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('MUSTERI silindi');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;

------------------------------------------------
--musteri update 
CREATE OR REPLACE PROCEDURE UPDATE_customers(
  CUSTOMERID1 NUMBER,
  NAME1 VARCHAR2,
  surname1 VARCHAR2,
  email1 VARCHAR2,
  telephone1 VARCHAR2,
  address1 VARCHAR2,
  city1 VARCHAR2,
  country1 VARCHAR2,
  date_registration1 VARCHAR2
) 
AS
BEGIN
  UPDATE customers_table 
  SET NAME = NAME1,
      Surname = surname1,
      Email = email1,
      Telephone = telephone1,
      Address = address1,
      City = city1,
      Country = country1,
      date_registration = date_registration1
  WHERE CustomerID = CUSTOMERID1;
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('MUSTERI UPDATE OLUNDU');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
exec UPDATE_customers(111,'tes','test','tes@gmail.com','21645612','wef','ewf','32','01-01-24');
select * from customers_table;
------------------------------------------------------------------------

--id e gore musterinin butunu melumatlarini getirir
CREATE OR REPLACE PROCEDURE id_customers( CUSTOMERID1 NUMBER)
AS
  NAME1 VARCHAR2(50);
  Surname1 VARCHAR2(50);
  Email1 VARCHAR2(50);
  Telephone1 VARCHAR2(50);
  Address1 VARCHAR2(100);
  City1 VARCHAR2(100);
  Country1 VARCHAR2(100);
  date_registration1 DATE;


BEGIN
  SELECT NAME, Surname, Email, Telephone, Address, City, Country, date_registration 
  INTO  NAME1, Surname1, Email1, Telephone1, Address1, City1, Country1, date_registration1 FROM customers_table  WHERE CUSTOMERID = CUSTOMERID1;
  DBMS_OUTPUT.PUT_LINE(NAME1||' ' || Surname1||' ' || Email1||' '|| Telephone1||' '|| Address1||' '|| City1|| ' '|| Country1||' '|| date_registration1);
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
------------------------------------------------------------------

-----------------------------------------------------------------------
SELECT * FROM customers_table;
SET SERVEROUTPUT ON;
EXECUTE add_customers(111, 'TEST', 'TEST', 'TEST@example.com', '123456789', '123 Main St', 'CL', 'US', SYSDATE);
EXEC UPDATE_CUSTOMERS(4, 'TEST1', 'TEST', 'TEST@example.com', '123456789', '123 Main St', 'CL', 'US', SYSDATE);
exec DELETE_customers(4);
exec id_customers(1);
EXECUTE id_customers(111);
--------------------------------------------------------------------------------