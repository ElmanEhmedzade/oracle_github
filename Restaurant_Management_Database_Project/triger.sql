-- icaze ucun trigger kim ne etdi  wdidw cedveline insert olacaq 
--meselen insert edib oradad saat necede kim hansi ip daress ile hansi kopmuter ile edib gorunur

CREATE OR REPLACE TRIGGER food_trigger
AFTER INSERT OR UPDATE OR DELETE ON yemekler
FOR EACH ROW
DECLARE 
    wh_pc wdidw.pc%TYPE;
    wh_ip wdidw.ip_adress%TYPE;
BEGIN
    wh_pc := food_pkg.get_host;
    wh_ip := food_pkg.get_ip_address;
    IF INSERTING THEN
        INSERT INTO wdidw(who, wdid, whend, pc, ip_adress, id_food, name_food, price_food, categ_food) 
        VALUES (USER, 'INSERT', SYSDATE, wh_pc, wh_ip, :NEW.ID, :NEW.ad, :NEW.qiymet, :NEW.kateqoriya);
    END IF;
    IF DELETING THEN
        INSERT INTO wdidw(who, wdid, whend, pc, ip_adress, id_food, name_food, price_food, categ_food) 
        VALUES (USER, 'DELETE', SYSDATE, wh_pc, wh_ip, :OLD.ID, :OLD.ad, :OLD.qiymet, :OLD.kateqoriya);
    END IF;
    IF UPDATING THEN
        INSERT INTO wdidw(who, wdid, whend, pc, ip_adress, id_food, name_food, price_food, categ_food) 
        VALUES (USER, 'NEW_UPDATE', SYSDATE, wh_pc, wh_ip, :NEW.ID, :NEW.ad, :NEW.qiymet, :NEW.kateqoriya);
        
        INSERT INTO wdidw(who, wdid, whend, pc, ip_adress, id_food, name_food, price_food, categ_food) 
        VALUES (USER, 'OLD_UPDATE', SYSDATE, wh_pc, wh_ip, :OLD.ID, :OLD.ad, :OLD.qiymet, :OLD.kateqoriya);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SEHV VAR: ' || SQLERRM);
END;


select * from wdidw;