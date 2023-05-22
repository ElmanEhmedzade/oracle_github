CREATE OR REPLACE TRIGGER customers_table_trigger --trigger update ve insert edende avtomatik digercedvele update olunur
BEFORE INSERT OR UPDATE OR DELETE ON customers_table_test_data
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO customers_table (CustomerID, NAME, Surname, Email, Telephone, Address, City, Country, date_registration)
    VALUES (:NEW.CustomerID, :NEW.NAME, :NEW.Surname, :NEW.Email, :NEW.Telephone, :NEW.Address, :NEW.City, :NEW.Country, :NEW.date_registration);
  END IF;
  
  IF UPDATING THEN
  UPDATE customers_table
  SET NAME = :NEW.NAME,Surname =  :NEW.Surname, Email = :NEW.Email, Telephone=:NEW.Telephone,Address =  :NEW.Address,City= :NEW.City, Country=:NEW.Country, date_registration=:NEW.date_registration
  WHERE CustomerID = :NEW.CustomerID;
  END IF;
END;
------------------------
CREATE OR REPLACE TRIGGER customers_table_trigger_delete ----trigger  delete edende avtomatik digercedvele update olunur
AFTER DELETE ON customers_table_test_data
FOR EACH ROW
BEGIN
  DELETE FROM customers_table WHERE CustomerID = :OLD.CustomerID;
END;

---------------------------------------------------
--trigger burada customerid_1 olan musterinin silinmesine qadaga qoyur
CREATE OR REPLACE TRIGGER DELETE_ME
BEFORE DELETE on customers_table_test_data
FOR EACH ROW
BEGIN
--  IF :OLD.CustomerID = :old.CustomerID THEN
  IF :OLD.CustomerID = 1 THEN
  raise_application_error(-20000, 'menim id_im silinmir  )');
  end if;
END;


-------------------------------------------------------------------------




-------------------------------------------------------------------------
--suallar
--update edende insert olundugu saatimi yazir update olundugu saatimi yazir&
--triggeri ne vaxt kim  ne etdi kimi et
-----------------------------------------------------------------
--test
drop trigger customers_table_trigger;
DELETE FROM customers_table_test_data WHERE CustomerID = 1;
update customers_table_test_data set name = 'alma' where CustomerID = 2;
INSERT INTO customers_table_test_data (CustomerID, NAME, Surname, Email, Telephone, Address, City, Country, date_registration)
VALUES (3, 'John', 'Doe', 'john@example.com', '123456789', '123 Main St', 'City', 'Country', SYSDATE);
INSERT INTO customers_table_test_data (CustomerID, NAME, Surname, Email, Telephone, Address, City, Country, date_registration)
VALUES (2, 'Jane', 'Smith', 'jane@example.com', '987654321', '456 Elm St', 'City', 'Country', SYSDATE);


select * from customers_table;


INSERT INTO customers_table_test_data (CustomerID, NAME, Surname, Email, Telephone, Address, City, Country, date_registration)
VALUES (1, 'Elman', '?hm?dzad?', 'Elman@example.com', '123456789', 'HBZ', 'Baku', 'AZERBA?JAN', SYSDATE);
delete from customers_table_test_data where customerid = 2;
---------------------------------------------------------------------













