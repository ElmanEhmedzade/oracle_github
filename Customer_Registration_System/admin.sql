
CREATE TABLE customers_table_test_data(
  CustomerID NUMBER,
  NAME VARCHAR2(50),
  Surname VARCHAR2(50),
  Email VARCHAR2(50),
  Telephone VARCHAR2(50),
  Address VARCHAR2(100),
  City VARCHAR2(100),
  Country VARCHAR2(100),
  date_registration date,
  CONSTRAINT pk_customers_table_test_data PRIMARY KEY (CustomerID)
);

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

CREATE TABLE customers_table_admin(
  ID NUMBER GENERATED ALWAYS AS IDENTITY,
  NE_ETDI VARCHAR(30),
  KIM_ETDI VARCHAR(30),
  NE_ZAMAN VARCHAR(30),
  PC VARCHAR(30),
  IP_ADRESS VARCHAR(30),
  CustomerID NUMBER,
  CONSTRAINT pk_customers_table_admin PRIMARY KEY (id)
);