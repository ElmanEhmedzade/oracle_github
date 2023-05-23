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
 IF :OLD.CustomerID = :old.CustomerID THEN
-- IF :OLD.CustomerID = 1 THEN
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
SELECT * FROM customers_table_test_data;

DROP TRIGGER customers_table_trigger;
DELETE FROM customers_table_test_data WHERE CustomerID = 2;
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

create or replace trigger 


CREATE OR REPLACE TRIGGER customer_TRIGGER
BEFORE INSERT OR UPDATE OR DELETE ON PROFIT
FOR EACH ROW
DECLARE
    WHOST customers_table.PC%TYPE;
    WIP customers_table.ip_adress%TYPE;
BEGIN
    SELECT SYS_CONTEXT('USERENV','HOST'), SYS_CONTEXT('USERENV','IP_ADDRESS')
    INTO WHOST, WIP
    FROM DUAL;

    IF INSERTING THEN
        INSERT INTO customers_table_admin(NE_ETDI, KIM_ETDI, NE_ZAMAN, PC, IP_ADRESS, CustomerID)
        VALUES ('INSERT', USER, SYSDATE, WHOST, WIP, :NEW.CustomerID);
    END IF;

    IF UPDATING THEN
        INSERT INTO customers_table_admin(NE_ETDI, KIM_ETDI, NE_ZAMAN, PC, IP_ADRESS, CustomerID)
        VALUES ('NEWUPDATE', USER, SYSDATE, WHOST, WIP, :NEW.CustomerID);

        INSERT INTO customers_table_admin(NE_ETDI, KIM_ETDI, NE_ZAMAN, PC, IP_ADRESS, CustomerID)
        VALUES ('OLDUPDATE', USER, SYSDATE, WHOST, WIP, :OLD.CustomerID);
    END IF;

    IF DELETING THEN
        INSERT INTO customers_table_admin(NE_ETDI, KIM_ETDI, NE_ZAMAN, PC, IP_ADRESS, CustomerID)
        VALUES ('OLDUPDATE', USER, SYSDATE, WHOST, WIP, :OLD.CustomerID);
    END IF;
END;





--------------------------------- 12C Error(11,54): PLS-00049: bad bind variable 'NEW.CUSTOMERID' PROBLEMS






