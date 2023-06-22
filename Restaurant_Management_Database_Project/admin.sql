
----------------------------------------------------------

CREATE TABLE yemekler(
ID NUMBER GENERATED  ALWAYS AS IDENTITY,
ad VARCHAR2(100),
qiymet NUMBER(6,2),
kateqoriya varchar2(100)
);
UPDATE yemekler
SET kateqoriya =
  CASE
    WHEN kateqoriya = 'rybnye-blyuda' THEN 'BALIQ YEM?KL?R?'
    WHEN kateqoriya = 'predzakaz' THEN 'BAYRAM YEM?KL?R? - ÷NC?D?N S?FAR??'
    WHEN kateqoriya = 'hleb' THEN '«÷R?K'
    WHEN kateqoriya = 'deserty' THEN 'DESERTL?R'
    WHEN kateqoriya = 'kyababy' THEN 'KABABLAR'
    WHEN kateqoriya = 'pasta' THEN 'PASTA'
    WHEN kateqoriya = 'picca' THEN 'PIZZA'
    WHEN kateqoriya = 'dieticheskie-blyuda' THEN 'P?HR?Z YEM?KL?R?'
    WHEN kateqoriya = 'garniry' THEN 'QARN?RL?R'
    WHEN kateqoriya = 'SahurIftarMenyu' THEN 'SAHUR V? ?FTAR MENYUSU (23.03.23 tarixind?n sifari? q?bul edilir)'
    WHEN kateqoriya = 'tureckie-blyuda' THEN 'T‹RK YEM?KL?R?'
    WHEN kateqoriya = 'ovoshchnye-blyuda' THEN 'T?R?V?Z YEM?KL?R?'
    WHEN kateqoriya = 'muchnye-blyuda' THEN 'X?M?R YEM?KL?R?'
    WHEN kateqoriya = 'breakfast' THEN 'S?H?R YEM?Y?'
    WHEN kateqoriya = 'evropeyskie-blyuda' THEN 'AVROPA YEM?KL?R?'
    WHEN kateqoriya = 'doner' THEN 'D÷N?R'
    WHEN kateqoriya = 'zavtrak' THEN 'BURQERL?R'
    WHEN kateqoriya = 'sandwich' THEN 'SENDV?«L?R'
    WHEN kateqoriya = 'pide' THEN 'P?DE'
    WHEN kateqoriya = 'prohladitelnye-napitki' THEN 'S?R?NL??D?R?C? i«K?L?R'
    WHEN kateqoriya = 'lahmadzhun' THEN 'LAHMACUN'
    WHEN kateqoriya = 'supy' THEN '?ORBALAR'
    WHEN kateqoriya = 'svezhevyzhatye-soki' THEN 'T?Z? SIXILMI? MEYV? ??R?L?R?'
    WHEN kateqoriya = 'salaty' THEN 'SALATLAR'
    WHEN kateqoriya = 'holodnye-zakuski' THEN 'SOYUQ Q?LYANALTILARI'
    WHEN kateqoriya = 'kombo-menyu' THEN 'KOMBO MENYU'
    WHEN kateqoriya = 'azerbaydzhanskie-blyuda' THEN 'AZ?RBAYCAN YEM?KL?R?'
  END;
CREATE TABLE wdidw(
wdidw_id NUMBER GENERATED AS IDENTITY,
who VARCHAR2(50),
wdid VARCHAR2(20),
whend DATE,
pc  VARCHAR(30),
ip_adress VARCHAR(30),
id_food NUMBER,
name_food VARCHAR(100),
price_food NUMBER(6,2),
categ_food VARCHAR(100)
);
CREATE TABLE USER_REG(
ID NUMBER GENERATED ALWAYS AS IDENTITY,
USER_NAME VARCHAR2(50),
USER_LAST_NAME VARCHAR2(50),
USER_EMAIL VARCHAR2(50),
USER_PASSWORD VARCHAR2(100)
);


SELECT * FROM YEMEKLER;


CREATE TABLE registration(
masa_id NUMBER NOT NULL,
masa_date timestamp
):