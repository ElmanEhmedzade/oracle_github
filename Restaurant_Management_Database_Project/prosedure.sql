set serveroutput on;
--add food to yemekler table
CREATE OR REPLACE PROCEDURE food_add(
  food_name VARCHAR2,
  food_price NUMBER,
  food_category VARCHAR2) 
as

BEGIN
  INSERT INTO yemekler(ad,qiymet,kateqoriya) VALUES(food_name,food_price,food_category);
  COMMIT;
  dbms_output.put_line('YEMEKLER INSERT OLUNDU');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('sehv oldu: ' || SQLERRM);
end;

exec food_add('test161',7.9,'hleb');
--------------------------------------------------------------------------------------------------
--update yemekler
 CREATE OR REPLACE PROCEDURE food_update(
  food_id number,
  food_name VARCHAR2,
  food_price NUMBER,
  food_category VARCHAR2) 
as
BEGIN
  UPDATE yemekler SET
  ad = food_name,
  qiymet = food_price,
  kateqoriya = food_category 
  where id = food_id;
  COMMIT;
  dbms_output.put_line('YEMEKLER UPADTE OLUNDU');

EXCEPTION
    WHEN OTHERS THEN
    dbms_output.put_line('SEHV VAR' ||SQLERRM);
END;
exec food_update(166,'test545434',10.8,'hleb');
----------------------------------------------------------------

--delete yemekler
 CREATE OR REPLACE PROCEDURE food_delete(
  food_id number)
AS
  row_count number;

BEGIN
  delete from  yemekler 
  where id = food_id;
  COMMIT;
  dbms_output.put_line('Yemek silindi');
EXCEPTION
    WHEN OTHERS THEN
    dbms_output.put_line('SEHV VAR' ||SQLERRM);
END;


exec food_delete(167);
----------------------------------------------------------------
select * from yemekler;