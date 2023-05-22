set serveroutput on;

---------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------
--ayliq odenisden cixmalar

CREATE OR REPLACE PROCEDURE UPDATE_MONTHLY_PAYMENT (ID1 IN NUMBER) IS
    v_customer_id   kredit.musteri_id%TYPE;
    v_loan_amount   kredit.kreditin_meblegi%TYPE;
    v_monthly_payment NUMBER;
    v_monthly_ay  KREDIT_ver.ay%type;
    v_total NUMBER;
BEGIN
    SELECT kreditin_meblegi INTO v_loan_amount FROM KREDIT WHERE MUSTERI_ID = ID1;
    SELECT ay INTO v_monthly_ay FROM KREDIT_ver WHERE MUSTERI_ID = ID1;
    v_monthly_payment := v_loan_amount / v_monthly_ay ;
    v_total := v_loan_amount - v_monthly_payment;
    UPDATE KREDIT SET kreditin_meblegi = round(v_total) WHERE MUSTERI_ID = ID1;
    UPDATE KREDIT SET son_tarix = sysdate WHERE MUSTERI_ID = ID1;
    
    

    DBMS_OUTPUT.PUT_LINE('Musteri kreditinin ayliq ödenisi yenilendi.');
    EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('sehv var: ' || SQLERRM);
END;

EXECUTE UPDATE_MONTHLY_PAYMENT(1);

SELECT * FROM KREDIT;
---------------------------------------------------------------------------------------------------------------
--gecikdirme hazir deyil
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
        DBMS_OUTPUT.PUT_LINE('Musteri kreditinin ayliq ödenisi yenilendi.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('MMusteri kreditinin ayliq ödenisi yenilenmedi..');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('musteri tapilmadi');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('sehv ' || SQLERRM);
END;

EXECUTE update_monthly_rate(3);
---------------------------------------------------------------------------------------------------------------------------
---tewt
CREATE OR REPLACE PROCEDURE UPDATE_MONTHLY_PAYMENT  IS
    v_customer_id   kredit.musteri_id%TYPE;
    v_loan_amount   kredit.kreditin_meblegi%TYPE;
    v_monthly_payment NUMBER;
    v_monthly_ay    KREDIT_ver.ay%TYPE;
    v_debt          debt.rowtype;
    v_total NUMBER;
    
    
BEGIN


    select user_id,pul from debt where  
    SELECT kreditin_meblegi INTO v_loan_amount FROM KREDIT WHERE MUSTERI_ID = ID1;
    SELECT ay INTO v_monthly_ay FROM KREDIT_ver WHERE MUSTERI_ID = ID1;
    v_monthly_payment := v_loan_amount / v_monthly_ay ;
    v_total := v_loan_amount - v_monthly_payment;
    UPDATE KREDIT SET kreditin_meblegi = round(v_total) WHERE MUSTERI_ID = ID1;
    UPDATE KREDIT SET son_tarix = sysdate WHERE MUSTERI_ID = ID1;
    
    

    DBMS_OUTPUT.PUT_LINE('Musteri kreditinin ayliq ödenisi yenilendi.');
    EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('sehv var: ' || SQLERRM);
END;












----------------------------------------


--depozit ayliq yenilenme
CREATE OR REPLACE PROCEDURE update_depozit_monthly IS
  v_faiz   number;
  v_depozit_meblegi depozit.depozitin_meblegi%TYPE;
  v_depozit_son_meblegi depozit.SON_MEBLEGI%TYPE;
  v_depozit depozit%ROWTYPE;
  v_monthly_amount NUMBER;
    CURSOR c_depozit IS SELECT *  FROM depozit;
BEGIN
  OPEN c_depozit;
  LOOP
    FETCH c_depozit INTO v_depozit;
    EXIT WHEN c_depozit%NOTFOUND;
    CASE v_depozit.ay
      WHEN 12 THEN v_faiz := 6;
      WHEN 18 THEN v_faiz := 7;
      WHEN 24 THEN v_faiz := 8;
      WHEN 36 THEN v_faiz := 9;
    END CASE;
      IF v_depozit.SON_MEBLEGI = 0 THEN
        UPDATE depozit
        SET SON_MEBLEGI = v_depozit.depozitin_meblegi + (v_depozit.depozitin_meblegi * v_faiz / 100), UPDATE_TARIXI = SYSDATE
        WHERE musteri_id = v_depozit.musteri_id;
      ELSE   
        UPDATE depozit
        SET SON_MEBLEGI = ROUND(SON_MEBLEGI + (SON_MEBLEGI * v_faiz / 100), 2),
            UPDATE_TARIXI = SYSDATE
        WHERE musteri_id = v_depozit.musteri_id;
      END IF;
   DBMS_OUTPUT.PUT_LINE('Musteri ID: ' || v_depozit.musteri_id || ', Mebleg: ' || v_depozit.depozitin_meblegi || ', Update Tarixi: '|| TO_CHAR(v_depozit.update_tarixi, 'YYYY-MM-DD HH24:MI:SS') || '    DEPOZITIN SON AY MEBLEGI    '|| v_depozit.SON_MEBLEGI);
  
 END LOOP;
   
  CLOSE c_depozit;

  DBMS_OUTPUT.PUT_LINE('Depozit cedveli update olundu');
END;
/
------------------------------------------------------------------------

select * from kredit_ver;