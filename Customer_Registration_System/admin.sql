--Veritaban? Olu?turma:
--M�?teri Tablosunun Olu?turulmas?
--Trigger Olu?turma
--Prosed�r Olu?turma
--Filtreleme ve Sorgulama Fonksiyonlar?: 
--Test ve Uygulama
/*M�?teri Kay?t Sistemi adl? bir PL/SQL proje ba?latmak i�in a?a??daki ad?mlar? izleyebilirsiniz:

Veritaban? Olu?turma: �ncelikle bir veritaban? olu?turman?z gerekecektir. Veritaban?n?zda m�?teri bilgilerini saklayacak bir tablo ve bu tabloya ili?kin gerekli alanlar? i�eren bir ?ema olu?turman?z gerekecektir.

M�?teri Tablosunun Olu?turulmas?: Veritaban?nda m�?teri bilgilerini saklamak i�in bir tablo olu?turman?z gerekecektir. Tabloda m�?teri ad?, soyad?, e-posta, telefon numaras? gibi bilgileri i�eren s�tunlar bulunmal?d?r. Ayr?ca tabloya birincil anahtar (primary key) eklemeniz, her m�?teri i�in benzersiz bir tan?mlay?c?ya sahip olman?z i�in �nemlidir.

Trigger Olu?turma: M�?teri tablosuna yeni bir kay?t ekledi?inizde veya mevcut bir kayd? g�ncelledi?inizde tetiklenecek bir trigger olu?turman?z gerekecektir. �rne?in, yeni bir m�?teri kaydedildi?inde, trigger otomatik olarak kay?t tarihini ve kay?t saatinin eklenmesini sa?layabilir. Ayn? ?ekilde, m�?teri bilgileri g�ncellendi?inde trigger, g�ncelleme tarihini ve saatini kaydedebilir.

Prosed�r Olu?turma: M�?teri bilgilerini eklemek, g�ncellemek ve silmek i�in prosed�rler olu?turman?z gerekecektir. �rne?in, yeni m�?teri eklemek i�in bir "Musteri_Ekle" prosed�r� olu?turabilirsiniz. Bu prosed�r, m�?terinin ad?n?, soyad?n?, e-posta adresini ve telefon numaras?n? parametre olarak almal? ve bu bilgileri m�?teri tablosuna eklemelidir. Benzer ?ekilde, m�?teri g�ncellemek veya silmek i�in ayr? prosed�rler olu?turabilirsiniz.

Filtreleme ve Sorgulama Fonksiyonlar?: M�?teri bilgilerini sorgulama ve filtreleme i?lemleri i�in fonksiyonlar olu?turman?z faydal? olabilir. �rne?in, belirli bir m�?terinin bilgilerini getiren bir "Musteri_Bilgisi_Getir" fonksiyonu olu?turabilirsiniz. Bu fonksiyon, m�?teri ad? veya m�?teri numaras? gibi parametrelere dayal? olarak m�?teri bilgilerini getirebilir.

Test ve Uygulama: Olu?turdu?unuz triggerlar, prosed�rler ve fonksiyonlar? test etmek ve uygulamak i�in bir ortam olu?turun. Test senaryolar? haz?rlay*/

CREATE TABLE customers_table(
  CustomerID NUMBER,
  NAME VARCHAR2(50),
  Surname VARCHAR2(50),
  Email VARCHAR2(50),
  Telephone VARCHAR2(50),
  Address VARCHAR2(100),
  City VARCHAR2(100),
  Country VARCHAR2(100),
  date_registration date,
  constraint pk_customers_table primary key (CustomerID)
);