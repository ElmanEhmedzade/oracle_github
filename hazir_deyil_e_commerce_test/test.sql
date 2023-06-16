

drop table payment_details;
drop table user1;
drop table order_details;
drop table order_items;
drop table shopping_session;
drop table cart_item;
drop table product;


SELECT * FROM user1;


CREATE TABLE user1(--1
  id NUMBER GENERATED ALWAYS AS IDENTITY,
  username VARCHAR2(50),
  password VARCHAR2(50),
  first_name VARCHAR2(50),
  last_name  VARCHAR2(50),
  address VARCHAR2(50),
  telephone NUMBER,
  created_at DATE,
  modified_at DATE,
  CONSTRAINT pk_user PRIMARY KEY(id)
);

CREATE TABLE shopping_session(--2
  id NUMBER GENERATED ALWAYS AS IDENTITY,
  user_id NUMBER,
  total NUMBER,
  created_at DATE,
  modified_at DATE,
  CONSTRAINT pk_shopping_session PRIMARY KEY(id),
  CONSTRAINT fk_shopping_session_user FOREIGN KEY(user_id) REFERENCES user1(id)
);

CREATE TABLE order_details(--3
  id NUMBER GENERATED ALWAYS AS IDENTITY,
  user_id NUMBER,
  total NUMBER,
  payment_id NUMBER,
  created_at DATE,
  modified_at DATE,
  CONSTRAINT pk_order_details PRIMARY KEY(id),
  CONSTRAINT fk_order_details_user FOREIGN KEY(user_id) REFERENCES user1(id)
);
CREATE TABLE product(--4
  id NUMBER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR2(100),
  description VARCHAR2(100),
  SKU VARCHAR2(100),
  category_id NUMBER,
  inventory_id NUMBER,
  price NUMBER,
  discount_id NUMBER,
  created_at DATE,
  modified_at DATE,
  deleted_at DATE,
  CONSTRAINT pk_product PRIMARY KEY(id)
);


CREATE TABLE cart_item(--5
  id NUMBER GENERATED ALWAYS AS IDENTITY,
  session_id NUMBER,
  product_id NUMBER,
  quantity NUMBER,
  created_at DATE,
  modified_at DATE,
  CONSTRAINT pk_cart_item PRIMARY KEY(id),
  CONSTRAINT fk_cart_item_session FOREIGN KEY(session_id) REFERENCES shopping_session(id),
  CONSTRAINT fk_cart_item_product FOREIGN KEY(product_id) REFERENCES product(id)
);

CREATE TABLE payment_details(--6
  id NUMBER GENERATED ALWAYS AS IDENTITY,
  order_id NUMBER,
  amount NUMBER,
  provider NUMBER,
  status DATE,
  created_at DATE,
  modified_at DATE,
  CONSTRAINT pk_payment_details PRIMARY KEY(id),
  CONSTRAINT fk_payment_details_order FOREIGN KEY(order_id) REFERENCES order_details(id)
);

CREATE TABLE order_items(--7
  id NUMBER GENERATED ALWAYS AS IDENTITY,
  order_id NUMBER,
  product_id NUMBER,
  quantity NUMBER,
  created_at DATE,
  modified_at DATE,
  CONSTRAINT pk_order_items PRIMARY KEY(id),
  CONSTRAINT fk_order_items_order FOREIGN KEY(order_id) REFERENCES order_details(id),
  CONSTRAINT fk_order_items_product FOREIGN KEY(product_id) REFERENCES product(id)
);


select * from user1;
