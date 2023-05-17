SET SERVEROUTPUT ON;
------------------------------------------------
--silmeyi qadagan eden trigger yaradaq
CREATE OR REPLACE TRIGGER YOU_CANT_DROP_THIS_TRIGGER
BEFORE DROP ON SCHEMA
BEGIN
RAISE_APPLICATION_ERROR(-20000,'BU SILINE BILMEZ');
END;

DROP TRIGGER YOU_CANT_DROP_THIS_TRIGGER;
  
  

--------------------------------------------------------
-- burada gelir xerc analizi edek
CREATE OR REPLACE TRIGGER BANK_TRIGGER
AFTER INSERT ON kredit_ver
FOR EACH ROW
DECLARE
  
BEGIN
  IF :NEW.MAAS - :NEW.XERC > :NEW.KREDITIN_MEBLEGI / :NEW.AY  THEN
  INSERT ALL
    INTO kredit (MUSTERI_ID, KREDITIN_MEBLEGI,VALYUTA,TARIX) VALUES (:NEW.MUSTERI_ID, :NEW.KREDITIN_MEBLEGI,:NEW.VALYUTA,:NEW.TARIX)
    INTO musteri (MUSTERI_ID, AD,SOYAD,NOMRE,DOGUM_TARIXI,IS_YERI) VALUES (:NEW.MUSTERI_ID, :NEW.AD,:NEW.SOYAD,:NEW.NOMRE,:NEW.DOGUM_TARIXI,:NEW.IS_YERI)
    SELECT * FROM DUAL;
  ELSE
    dbms_output.put_line('Kredit verilmir.');
  END IF;
END;


---------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------
SELECT * FROM KREDIT;
SELECT * FROM KREDIT_ver;
SELECT * FROM musteri;

----------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------