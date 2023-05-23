/*
.

Kitap ekleme i?lemi için bir "Kitap Ekle" prosedürü olu?turun. Bu prosedür, kitap bilgilerini alacak ve "Kitaplar" tablosuna ekleyecektir.
Yazar ekleme i?lemi için bir "Yazar Ekle" prosedürü olu?turun. Bu prosedür, yazar bilgilerini alacak ve "Yazarlar" tablosuna ekleyecektir.
Sat?c? ekleme i?lemi için bir "Sat?c? Ekle" prosedürü olu?turun. Bu prosedür, sat?c? bilgilerini alacak ve "Sat?c?lar" tablosuna ekleyecektir.
Kitap sat??? gerçekle?tirme i?lemi için bir "Sat?? Gerçekle?tir" prosedürü olu?turun. Bu prosedür, kitap, mü?teri ve sat?c? bilgilerini alacak, "Sat??lar" tablosuna sat?? bilgilerini ekleyecek ve ilgili tablolarda güncellemeler yapacakt?r.
PL/SQL Fonksiyonlar? Haz?rlama:

Belirli bir kitab?n sat?? miktar?n? hesaplayan bir "Sat?? Miktar?n? Hesapla" fonksiyonu olu?turun. Bu fonksiyon, kitap kimlik numaras?n? alacak ve ilgili kitap için gerçekle?en toplam sat?? miktar?n? döndürecektir.
Bir yazar?n yazd??? kitaplar?n say?s?n? hesaplayan bir "Kitap Say?s?n? Hesapla" fonksiyonu olu?turun. Bu fonksiyon, yazar kimlik numaras?n? alacak ve ilgili yazar?n kaç kitap yazd???n? döndürecektir.
PL/SQL ??lemlerini ve Fonksiyonlar? Kullanma:

Kitap eklemek için "Kitap Ekle"
PL/SQL ??lemlerini ve Fonksiyonlar? Kullanma:

Kitap eklemek için "Kitap Ekle" prosedürünü ça??rabilirsiniz:
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