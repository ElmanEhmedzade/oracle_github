--musteri kredit ve kredit_ver cedvelleri vardir
drop table musteri;
DROP TABLE kredit;
drop table kredit_ver;
DROP TABLE depozit;
DROP TABLE debt;
select * from kredit;
----------------------------------------------
CREATE TABLE musteri (
  musteri_id NUMBER,
  ad VARCHAR2(30),
  soyad VARCHAR2(30),
  nomre NUMBER(15),
  dogum_tarixi DATE,
  is_yeri VARCHAR2(60),
  CONSTRAINT pk_musteri PRIMARY KEY (musteri_id)
);

CREATE TABLE kredit (
  kredit_id NUMBER GENERATED ALWAYS AS IDENTITY,
  musteri_id NUMBER,
  kreditin_meblegi NUMBER,
  valyuta VARCHAR2(10),
  faiz NUMBER default  0,
  tarix DATE,
  son_tarix DATE DEFAULT TO_DATE('2023-01-01', 'YYYY-MM-DD'),
 -- odenib NUMBER(1),
  --qaliq NUMBER,
  CONSTRAINT pk_kredit PRIMARY KEY (kredit_id),
  CONSTRAINT fk_kredit_musteri FOREIGN KEY (musteri_id) REFERENCES kredit_ver(musteri_id)
 -- CONSTRAINT ck_odenib CHECK (odenib IN (1,0))
);
CREATE TABLE kredit_ver (
  musteri_id NUMBER,
  ad VARCHAR2(30),
  soyad VARCHAR2(30),
  nomre NUMBER(15),
  dogum_tarixi DATE,
  is_yeri VARCHAR2(60),
  kreditin_meblegi NUMBER,
  valyuta VARCHAR2(10),
  maas NUMBER,
  ay number,
  xerc NUMBER,
  tarix date,

  CONSTRAINT pk_kredit_ver PRIMARY KEY (musteri_id)
);

CREATE TABLE debt(
  USER_id NUMBER,
  ad VARCHAR2(30),
  pul NUMBER,
 -- parol VARCHAR2(50),
  tarix date,
  constraint  pk_debt primary key(user_id)  
  );


CREATE TABLE depozit (
  musteri_id NUMBER,
  ad VARCHAR2(30),
  soyad VARCHAR2(30),
  nomre NUMBER(15),
  dogum_tarixi DATE,
  is_yeri VARCHAR2(60),
  depozitin_meblegi NUMBER,
  dep_qoy_tar DATE,
  update_tarixi DATE,
  son_meblegi NUMBER,
  ay NUMBER,
 -- faiz NUMBER,
--  son_tarix date,
  CONSTRAINT pk_depozit PRIMARY KEY (musteri_id),
  CONSTRAINT fk_deposit_musteri FOREIGN KEY (musteri_id) REFERENCES kredit_ver(musteri_id)
);