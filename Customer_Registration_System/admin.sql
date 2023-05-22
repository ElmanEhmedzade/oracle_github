--Veritaban? Olu?turma:
--Mü?teri Tablosunun Olu?turulmas?
--Trigger Olu?turma
--Prosedür Olu?turma
--Filtreleme ve Sorgulama Fonksiyonlar?: 
--Test ve Uygulama
/*Mü?teri Kay?t Sistemi adl? bir PL/SQL proje ba?latmak için a?a??daki ad?mlar? izleyebilirsiniz:

Veritaban? Olu?turma: Öncelikle bir veritaban? olu?turman?z gerekecektir. Veritaban?n?zda mü?teri bilgilerini saklayacak bir tablo ve bu tabloya ili?kin gerekli alanlar? içeren bir ?ema olu?turman?z gerekecektir.

Mü?teri Tablosunun Olu?turulmas?: Veritaban?nda mü?teri bilgilerini saklamak için bir tablo olu?turman?z gerekecektir. Tabloda mü?teri ad?, soyad?, e-posta, telefon numaras? gibi bilgileri içeren sütunlar bulunmal?d?r. Ayr?ca tabloya birincil anahtar (primary key) eklemeniz, her mü?teri için benzersiz bir tan?mlay?c?ya sahip olman?z için önemlidir.

Trigger Olu?turma: Mü?teri tablosuna yeni bir kay?t ekledi?inizde veya mevcut bir kayd? güncelledi?inizde tetiklenecek bir trigger olu?turman?z gerekecektir. Örne?in, yeni bir mü?teri kaydedildi?inde, trigger otomatik olarak kay?t tarihini ve kay?t saatinin eklenmesini sa?layabilir. Ayn? ?ekilde, mü?teri bilgileri güncellendi?inde trigger, güncelleme tarihini ve saatini kaydedebilir.

Prosedür Olu?turma: Mü?teri bilgilerini eklemek, güncellemek ve silmek için prosedürler olu?turman?z gerekecektir. Örne?in, yeni mü?teri eklemek için bir "Musteri_Ekle" prosedürü olu?turabilirsiniz. Bu prosedür, mü?terinin ad?n?, soyad?n?, e-posta adresini ve telefon numaras?n? parametre olarak almal? ve bu bilgileri mü?teri tablosuna eklemelidir. Benzer ?ekilde, mü?teri güncellemek veya silmek için ayr? prosedürler olu?turabilirsiniz.

Filtreleme ve Sorgulama Fonksiyonlar?: Mü?teri bilgilerini sorgulama ve filtreleme i?lemleri için fonksiyonlar olu?turman?z faydal? olabilir. Örne?in, belirli bir mü?terinin bilgilerini getiren bir "Musteri_Bilgisi_Getir" fonksiyonu olu?turabilirsiniz. Bu fonksiyon, mü?teri ad? veya mü?teri numaras? gibi parametrelere dayal? olarak mü?teri bilgilerini getirebilir.

Test ve Uygulama: Olu?turdu?unuz triggerlar, prosedürler ve fonksiyonlar? test etmek ve uygulamak için bir ortam olu?turun. Test senaryolar? haz?rlay*/

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