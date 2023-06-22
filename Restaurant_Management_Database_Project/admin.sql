--SIPARIS (eve yoxsa restoran)
--yemekler
--YEMEK ELAVE ETMEK UCUN PROSEDUR
----------------------------------------------------------
/*Veritaban? Tasar?m?: Restoran?n?z?n i? gereksinimlerine uygun bir veritaban? tasarlamak �nemlidir. Bu tasar?m, men�ler, sipari?ler, m�?teri bilgileri, �al??anlar ve di?er ilgili veriler gibi restoran i?letmesi i�in gereken bilgileri i�ermelidir. Veritaban? tasar?m?nda tablolar, s�tunlar ve ili?kiler gibi temel bile?enleri tan?mlamal?s?n?z.

Veri Taban? Olu?turma: Oracle SQL kullanarak, veritaban? y�netim sisteminde restoran?n?z i�in bir veritaban? olu?turman?z gerekecektir. Veritaban?n?z? olu?tururken, tablolar?, s�tunlar? ve uygun veri tiplerini tan?mlayarak veritaban?n?z?n yap?s?n? olu?turman?z gerekecektir.

Tablo ve Veri Ekleme: Restoran?n?z?n i? gereksinimlerine uygun tablolar? olu?turduktan sonra, bu tablolara veri eklemeniz gerekecektir. M�?teri bilgileri, men�ler, �al??anlar ve di?er ilgili verileri tablolara ekleyerek restoran?n?z?n veritaban?n? olu?turabilirsiniz.

Veri Sorgulama: Oracle SQL kullanarak, restoran?n?z?n veritaban?ndaki verilere eri?ebilir ve sorgular olu?turabilirsiniz. �rne?in, m�?teri sipari?lerini sorgulayabilir, men� �?elerini g�ncelleyebilir veya �al??an bilgilerini sorgulayabilirsiniz.

Veri G�ncelleme ve Silme: Restoran?n?z?n veritaban?ndaki verileri g�ncellemek veya silmek istedi?inizde, Oracle SQL kullanarak ilgili tablolarda g�ncelleme ve silme i?lemleri ger�ekle?tirebilirsiniz. �rne?in, bir m�?terinin sipari?ini g�ncellemek veya bir �al??an? veritaban?ndan silmek i�in uygun SQL komutlar?n? kullanman?z gerekecektir.

Veritaban? Yedekleme ve G�venlik: Veri kayb?n? �nlemek i�in restoran?n?z?n veritaban?n? d�zenli olarak yedeklemeniz �nemlidir. Ayr?ca, g�venlik �nlemleri alarak veritaban?n?z? yetkisiz eri?imlere kar?? koruman?z gerekecektir.
*/
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
    WHEN kateqoriya = 'predzakaz' THEN 'BAYRAM YEM?KL?R? - �NC?D?N S?FAR??'
    WHEN kateqoriya = 'hleb' THEN '��R?K'
    WHEN kateqoriya = 'deserty' THEN 'DESERTL?R'
    WHEN kateqoriya = 'kyababy' THEN 'KABABLAR'
    WHEN kateqoriya = 'pasta' THEN 'PASTA'
    WHEN kateqoriya = 'picca' THEN 'PIZZA'
    WHEN kateqoriya = 'dieticheskie-blyuda' THEN 'P?HR?Z YEM?KL?R?'
    WHEN kateqoriya = 'garniry' THEN 'QARN?RL?R'
    WHEN kateqoriya = 'SahurIftarMenyu' THEN 'SAHUR V? ?FTAR MENYUSU (23.03.23 tarixind?n sifari? q?bul edilir)'
    WHEN kateqoriya = 'tureckie-blyuda' THEN 'T�RK YEM?KL?R?'
    WHEN kateqoriya = 'ovoshchnye-blyuda' THEN 'T?R?V?Z YEM?KL?R?'
    WHEN kateqoriya = 'muchnye-blyuda' THEN 'X?M?R YEM?KL?R?'
    WHEN kateqoriya = 'breakfast' THEN 'S?H?R YEM?Y?'
    WHEN kateqoriya = 'evropeyskie-blyuda' THEN 'AVROPA YEM?KL?R?'
    WHEN kateqoriya = 'doner' THEN 'D�N?R'
    WHEN kateqoriya = 'zavtrak' THEN 'BURQERL?R'
    WHEN kateqoriya = 'sandwich' THEN 'SENDV?�L?R'
    WHEN kateqoriya = 'pide' THEN 'P?DE'
    WHEN kateqoriya = 'prohladitelnye-napitki' THEN 'S?R?NL??D?R?C? i�K?L?R'
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