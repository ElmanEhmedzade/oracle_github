--rezervazasiya (eve yoxsa restoran)
--yemekler


CREATE TABLE yemekler(
ID NUMBER GENERATED  ALWAYS AS IDENTITY,
ad VARCHAR2(100),
qiymet NUMBER(6,2),
kateqoriya varchar2(100)
);

drop table yemekler;
select * from yemekler;