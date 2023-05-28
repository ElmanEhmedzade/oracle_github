SET SERVEROUTPUT ON;
------------------------------------------------
--silmeyi qadagan eden trigger yaradaq
CREATE OR REPLACE TRIGGER YOU_CANT_DROP_THIS_TRIGGER
BEFORE DROP ON SCHEMA
BEGIN
RAISE_APPLICATION_ERROR(-20000,'BU SILINE BILMEZ');
END;

DROP TRIGGER YOU_CANT_DROP_THIS_TRIGGER;
  
  

CREATE OR REPLACE TRIGGER BANK_TRIGGER
AFTER INSERT ON kredit_ver
FOR EACH ROW
BEGIN
  INSERT ALL
    INTO kredit (MUSTERI_ID, KREDITIN_MEBLEGI, VALYUTA, TARIX, FAIZ)
      VALUES (:NEW.MUSTERI_ID, :NEW.KREDITIN_MEBLEGI, :NEW.VALYUTA, :NEW.TARIX,
              CASE :NEW.ay
                WHEN 12 THEN 6
                WHEN 18 THEN 7
                WHEN 24 THEN 8
                WHEN 36 THEN 9
                ELSE 0 
              END)
    INTO musteri (MUSTERI_ID, AD, SOYAD, NOMRE, DOGUM_TARIXI, IS_YERI)
      VALUES (:NEW.MUSTERI_ID, :NEW.AD, :NEW.SOYAD, :NEW.NOMRE, :NEW.DOGUM_TARIXI, :NEW.IS_YERI)
   SELECT * FROM DUAL
   WHERE :NEW.maas - :NEW.xerc > :NEW.kreditin_meblegi / :NEW.ay;
  
  IF SQL%ROWCOUNT = 0 THEN
    dbms_output.put_line('Kredit verilmir.');
  END IF;
END;
/


---------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
SELECT * FROM KREDIT;
SELECT * FROM KREDIT_ver;
SELECT * FROM musteri;

----------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------