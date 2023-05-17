select * from depozit;

CREATE OR REPLACE FUNCTION end_depo_pay(dep_id NUMBER) RETURN NUMBER
IS
  month_amount NUMBER;
  dep_mon depozit.ay%type;
BEGIN

SELECT (DEPOZITIN_MEBLEGI /ay)*0.06 INTO month_amount FROM depozit where MUSTERI_ID =  dep_id;
return month_amount;
END;


DECLARE
  result NUMBER;
BEGIN
  result := end_depo_pay(1);
  DBMS_OUTPUT.PUT_LINE('Ayl?q mikdar: ' || result);
END;
/
