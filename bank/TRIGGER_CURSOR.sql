SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER YOU_CANT_DROP_THIS_TRIGGER
BEFORE DROP ON SCHEMA
BEGIN
RAISE_APPLICATION_ERROR(-20000,'BU SILINE BILMEZ');
END;

--DROP TRIGGER YOU_CANT_DROP_THIS_TRIGGER;
  
  


CREATE OR REPLACE TRIGGER BANK_TRIGGER
AFTER INSERT ON kredit_ver
FOR EACH ROW
DECLARE
  
BEGIN
  IF :NEW.MAAS - :NEW.XERC > :NEW.KREDITIN_MEBLEGI / :NEW.AY  THEN
  INSERT ALL
    INTO kredit (MUSTERI_ID, KREDITIN_MEBLEGI) VALUES (:NEW.MUSTERI_ID, :NEW.KREDITIN_MEBLEGI)
    INTO musteri (MUSTERI_ID, AD,SOYAD,NOMRE,DOGUM_TARIXI,IS_YERI) VALUES (:NEW.MUSTERI_ID, :NEW.AD,:NEW.SOYAD,:NEW.NOMRE,:NEW.DOGUM_TARIXI,:NEW.IS_YERI)
    SELECT * FROM DUAL;
  ELSE
    dbms_output.put_line('Kredit verilmir.');
  END IF;
END;


---------------------------------------------------------------------------------------------------------------
INSERT INTO kredit_ver (musteri_id, AD,SOYAD,NOMRE,DOGUM_TARIXI,IS_YERI,KREDITIN_MEBLEGI,maas,valyuta,ay,xerc)
VALUES (1, 'Elvin', 'Abbasov', 05100101000, to_date('1985-01-01', 'YYYY-MM-DD'),'DIM',1000,5000,'AZN',12,1500);

INSERT INTO kredit_ver (musteri_id, AD,SOYAD,NOMRE,DOGUM_TARIXI,IS_YERI,KREDITIN_MEBLEGI,maas,valyuta,ay,xerc)
VALUES (2, 'Tural', 'Mammedov', 0509080700, to_date('1993-01-01', 'YYYY-MM-DD'),'DIN',20000,5000,'AZN',12,1500);

INSERT INTO kredit_ver (musteri_id, AD,SOYAD,NOMRE,DOGUM_TARIXI,IS_YERI,KREDITIN_MEBLEGI,maas,valyuta,ay,xerc)
VALUES (3,'Nergiz', 'Memmedova', 0506010600, to_date('1998-01-01', 'YYYY-MM-DD'),'BDU',2000,5000,'AZN',12,1500);

INSERT INTO kredit_ver (musteri_id, AD,SOYAD,NOMRE,DOGUM_TARIXI,IS_YERI,KREDITIN_MEBLEGI,maas,valyuta,ay,xerc)
VALUES (4,'Nigar', 'Hüseynova', 0507030400, to_date('1995-01-01', 'YYYY-MM-DD'),'AZMIU',200000,5000,'AZN',12,1500);


---------------------------------------------------------------------------------------------------------------
SELECT * FROM KREDIT;
SELECT * FROM KREDIT_ver;
SELECT * FROM musteri;



----------------------------------------------------------------------------------------------------------------------------------------



CREATE OR REPLACE PROCEDURE UPDATE_MONTHLY_PAYMENT (ID1 IN NUMBER) IS
    v_customer_id   kredit.musteri_id%TYPE;
    v_loan_amount   kredit.kreditin_meblegi%TYPE;
    v_monthly_payment NUMBER;
    v_total NUMBER;
BEGIN
    SELECT kreditin_meblegi INTO v_loan_amount FROM KREDIT WHERE MUSTERI_ID = ID1;
    v_monthly_payment := v_loan_amount / 12 ;
    v_total := v_loan_amount - v_monthly_payment;
    UPDATE KREDIT SET kreditin_meblegi = round(v_total) WHERE MUSTERI_ID = ID1;

    DBMS_OUTPUT.PUT_LINE('Mü?t?ri kreditinin ayl?q öd?ni?i yenil?ndi.');
END;

EXECUTE UPDATE_MONTHLY_PAYMENT(3);
------------------------------------------------------------------------------------------------------------------------------------------