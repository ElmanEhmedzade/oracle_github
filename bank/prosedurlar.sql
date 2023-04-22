set serveroutput on;
BEGIN
  DBMS_SCHEDULER.CREATE_JOB(
    job_name => 'update_kredit_rate_job',
    job_type => 'STORED_PROCEDURE',
    job_action => 'update_monthly_rate',
    start_date => TRUNC(SYSDATE, 'MM') + INTERVAL '1' MONTH, -- start next month
    repeat_interval => 'FREQ=MONTHLY;BYMONTHDAY=1', -- run on the first day of each month
    enabled => TRUE);
END;

---------------------------------------------------------------------------------------------------------------




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

---------------------------------------------------------------------------------------------------------------

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

execute update_monthly_rate(3);