SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER YOU_CANT_DROP_THIS_TRIGGER
BEFORE DROP ON SCHEMA
BEGIN
RAISE_APPLICATION_ERROR(-20000,'BU SILINE BILMEZ');
END;

DROP TRIGGER YOU_CANT_DROP_THIS_TRIGGER;
  
  


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
INSERT INTO kredit_ver (musteri_id, AD,SOYAD,NOMRE,DOGUM_TARIXI,IS_YERI,KREDITIN_MEBLEGI,maas,valyuta,ay,xerc,tarix)
VALUES (1, 'Elvin', 'Abbasov', 05100101000, to_date('1985-01-01', 'YYYY-MM-DD'),'DIM',1000,5000,'AZN',12,1500,to_date('2023-01-01', 'YYYY-MM-DD'));

INSERT INTO kredit_ver (musteri_id, AD,SOYAD,NOMRE,DOGUM_TARIXI,IS_YERI,KREDITIN_MEBLEGI,maas,valyuta,ay,xerc,tarix)
VALUES (2, 'Tural', 'Mammedov', 0509080700, to_date('1993-01-01', 'YYYY-MM-DD'),'DIN',20000,5000,'AZN',12,1500,to_date('2023-02-01', 'YYYY-MM-DD'));

INSERT INTO kredit_ver (musteri_id, AD,SOYAD,NOMRE,DOGUM_TARIXI,IS_YERI,KREDITIN_MEBLEGI,maas,valyuta,ay,xerc,tarix)
VALUES (3,'Nergiz', 'Memmedova', 0506010600, to_date('1998-01-01', 'YYYY-MM-DD'),'BDU',2000,5000,'AZN',12,1500,to_date('2023-03-01', 'YYYY-MM-DD'));

INSERT INTO kredit_ver (musteri_id, AD,SOYAD,NOMRE,DOGUM_TARIXI,IS_YERI,KREDITIN_MEBLEGI,maas,valyuta,ay,xerc,tarix)
VALUES (4,'Nigar', 'Hüseynova', 0507030400, to_date('1995-01-01', 'YYYY-MM-DD'),'AZMIU',200000,5000,'AZN',12,1500,to_date('2023-04-01', 'YYYY-MM-DD'));


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
    UPDATE KREDIT SET son_tarix = sysdate WHERE MUSTERI_ID = ID1;
    
    

    DBMS_OUTPUT.PUT_LINE('Musteri kreditinin ayliq ödenisi yenilendi.');
    EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('sehv var: ' || SQLERRM);
END;

EXECUTE UPDATE_MONTHLY_PAYMENT(1);
------------------------------------------------------------------------------------------------------------------------------------------
----burdayam duzelt
create or replace procedure update_monthly_rate(id_p IN NUMBER) is
   p_customer_id kredit.musteri_id%type;
   p_loan_amount kredit.kredt_meblegi%type;
   p_date kredit.tarix%type;
   p_montly_total_rate number;
  -- p_rate kredit.faiz%type;
   p_total number;
begin
    select kredit_meblegi into p_loan_amount from kredit where musteri_id = id_p;
    p_montly_total_rate :=kreditin_meblegi+( kreditin_meblegi * 0.01) ;
    p_total:= kreditin_meblegi + p_montly_rate;
    if (SELECT  MONTHS_BETWEEN(TO_DATE(son_tarix, 'YYYY-MM-DD'), TO_DATE(p_date, 'YYYY-MM-DD')),1) FROM KREDIT WHERE MUSTERI_ID = ID1) > 1 then
    UPDATE KREDIT SET kreditin_meblegi = round(p_total) WHERE MUSTERI_ID = ID1;
    else
    
    end if;
    DBMS_OUTPUT.PUT_LINE('Musteri kreditinin ayliq ödenisi yenilendi.');


  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('sehv var ' || SQLERRM);
   end;
   
   
   SELECT ROUND(MONTHS_BETWEEN(TO_DATE('2020-09-22', 'YYYY-MM-DD'), TO_DATE('2020-08-31', 'YYYY-MM-DD')),1)  FROM dual ;


CREATE OR REPLACE PROCEDURE update_monthly_rate(id_p IN NUMBER) IS
   p_customer_id kredit.musteri_id%type;
   p_loan_amount kredit.kreditin_meblegi%type;
   p_date kredit.tarix%type;
   p_montly_total_rate number;
   p_total number;
   p_months_diff number;
BEGIN
    SELECT musteri_id, kreditin_meblegi, tarix INTO p_customer_id, p_loan_amount, p_date FROM kredit WHERE musteri_id = id_p;
    p_montly_total_rate := p_loan_amount * 0.01; -- 1% ayl?k faiz
    p_total := p_loan_amount + p_montly_total_rate;
    SELECT months_between(sysdate, p_date) INTO p_months_diff FROM kredit WHERE musteri_id = id_p;
    IF p_months_diff > 1 THEN
        UPDATE kredit SET kreditin_meblegi = round(p_total) WHERE musteri_id = id_p;
        DBMS_OUTPUT.PUT_LINE('Mü?teri kredisi için ayl?k ödeme güncellendi.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Mü?teri kredisi için ayl?k ödeme güncellenmedi. 1 aydan daha az süredir kredi kullan?lmaktad?r.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Belirtilen mü?teri için kredi kayd? bulunamad?.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Hata: ' || SQLERRM);
END;

exec update_monthly_rate(3);