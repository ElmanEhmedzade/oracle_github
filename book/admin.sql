--kitab c?dv?li
CREATE TABLE books( 
  book_id number GENERATED ALWAYS AS IDENTITY,
  book_name VARCHAR2(50),
  writer_id number,
  price NUMBER,
  stock NUMBER,
  CONSTRAINT pk_books PRIMARY KEY (book_id),
  constraint fk_writer_books foreign key (writer_id) references writer(writer_id)
);
--yaz?ç? c?dv?li
CREATE TABLE writer(
  writer_id NUMBER GENERATED ALWAYS AS IDENTITY,
  writer_name VARCHAR2(50),
  country VARCHAR2(30),
  CONSTRAINT pk_writer PRIMARY KEY (writer_id)
);
--sat?c?lar c?dv?li
CREATE TABLE suplier(
  seller_id NUMBER GENERATED ALWAYS AS IDENTITY,
  seller VARCHAR2(50),
  address VARCHAR2(50),
  phone VARCHAR2(50),
  email VARCHAR2(50),
  constraint pk_suplier primary key (seller_id)
);

--sat?? c?dv?li
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

commit;