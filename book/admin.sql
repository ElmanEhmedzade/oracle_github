/*
.

Kitap ekleme i?lemi i�in bir "Kitap Ekle" prosed�r� olu?turun. Bu prosed�r, kitap bilgilerini alacak ve "Kitaplar" tablosuna ekleyecektir.
Yazar ekleme i?lemi i�in bir "Yazar Ekle" prosed�r� olu?turun. Bu prosed�r, yazar bilgilerini alacak ve "Yazarlar" tablosuna ekleyecektir.
Sat?c? ekleme i?lemi i�in bir "Sat?c? Ekle" prosed�r� olu?turun. Bu prosed�r, sat?c? bilgilerini alacak ve "Sat?c?lar" tablosuna ekleyecektir.
Kitap sat??? ger�ekle?tirme i?lemi i�in bir "Sat?? Ger�ekle?tir" prosed�r� olu?turun. Bu prosed�r, kitap, m�?teri ve sat?c? bilgilerini alacak, "Sat??lar" tablosuna sat?? bilgilerini ekleyecek ve ilgili tablolarda g�ncellemeler yapacakt?r.
PL/SQL Fonksiyonlar? Haz?rlama:

Belirli bir kitab?n sat?? miktar?n? hesaplayan bir "Sat?? Miktar?n? Hesapla" fonksiyonu olu?turun. Bu fonksiyon, kitap kimlik numaras?n? alacak ve ilgili kitap i�in ger�ekle?en toplam sat?? miktar?n? d�nd�recektir.
Bir yazar?n yazd??? kitaplar?n say?s?n? hesaplayan bir "Kitap Say?s?n? Hesapla" fonksiyonu olu?turun. Bu fonksiyon, yazar kimlik numaras?n? alacak ve ilgili yazar?n ka� kitap yazd???n? d�nd�recektir.
PL/SQL ??lemlerini ve Fonksiyonlar? Kullanma:

Kitap eklemek i�in "Kitap Ekle"
PL/SQL ??lemlerini ve Fonksiyonlar? Kullanma:

Kitap eklemek i�in "Kitap Ekle" prosed�r�n� �a??rabilirsiniz:
?ste?e Ba?l?: Di?er Fonksiyonlar? ve ??lemleri Ekleyin:

"Sat?? Miktar?n? Hesapla" fonksiyonunu kullanarak belirli bir kitab?n sat?? miktar?n? alabilirsiniz:
*/

--cedvel yaradaq
--- 
DROP TABLE BOOKS;
CREATE TABLE books(
  book_id number GENERATED ALWAYS AS IDENTITY,
  book_name VARCHAR2(50),
  writer VARCHAR2(50),
  price NUMBER,
  stock NUMBER,
  constraint pk_books primary key (book_id)
);

CREATE TABLE writer(
  writer_id NUMBER GENERATED ALWAYS AS IDENTITY,
  writer_name VARCHAR2(50),
  country VARCHAR2(30),
  constraint pk_writer primary key (writer_id)
);




CREATE TABLE suplier(
  seller_id NUMBER GENERATED ALWAYS AS IDENTITY,
  seller VARCHAR2(50),
  address VARCHAR2(50),
  phone VARCHAR2(50),
  email VARCHAR2(50),
  constraint pk_suplier primary key (seller_id)
);


CREATE TABLE sale(
  sale_id number GENERATED ALWAYS AS IDENTITY,
  book_id number,
  seller_id number,
  sale_date DATE,
  sales_amount NUMBER,
  CONSTRAINT pk_sale PRIMARY KEY (seller_id),
  CONSTRAINT fk_sale_books FOREIGN KEY (book_id) REFERENCES books(book_id),
  CONSTRAINT fk_sale_suplier FOREIGN KEY (seller_id) REFERENCES suplier(seller_id)
);